unit uDAOUser;

interface

uses
  uControllerConnection, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, System.SysUtils, Datasnap.DBClient, Datasnap.Provider,
  uIDAOUser, uModelUser;

type
  TDAOUser = class(TInterfacedObject, IDAOUser)

    private
      FModelUser : TModelUser;
      FDTransaction: TFDTransaction;
      FDQueryUser : TFDQuery;
      function IsValid(userName, userPassword : String) : Boolean;

    public
      function Save: Boolean;
      function Authentication(userName, userPassword : String): Boolean;

      constructor Create(userName, userPassword : String);
      destructor Destroy; Override;

      class function New(userName, userPassword : String) : IDAOUser;
      published
  end;

implementation

{ TDAOUser }

function TDAOUser.Authentication(userName, userPassword: String): Boolean;
begin
 FDQueryUser := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with FDQueryUser do
      begin
        Unprepare;
        Params.Add('userName', ftString, 100, ptInput);
        Params.Add('userPassword', ftString, 32, ptInput);

        ParamByName('userName').AsString := userName;
        ParamByName('userPassword').AsString := FModelUser.MD5(userPassword);
        SQL.Text := 'SELECT id FROM tbl_user WHERE userName = :userName AND userPassword = :userPassword';
        Prepare;
        Open;
      end;
      if (FDQueryUser.RecordCount > 0) then
        result := true
      else
        result := false;
    finally
      FreeAndNil(FDQueryUser);
    end;
  except
  end;
end;

constructor TDAOUser.Create(userName, userPassword : String);
begin
  FModelUser := TModelUser.Create(userName, userPassword);
end;

destructor TDAOUser.Destroy;
begin
  FreeAndNil(FModelUser);
  inherited;
end;

function TDAOUser.IsValid(userName, userPassword: String): Boolean;
var
  r : Boolean;
begin
  r := true;
  if (userName.Length < 1) OR (userPassword.Length < 1) then r := false;
  result := r;
end;

class function TDAOUser.New(userName, userPassword : String): IDAOUser;
begin
  result := Self.Create(userName, userPassword);
end;

function TDAOUser.Save: Boolean;
begin
  if IsValid(FModelUser.UserName, FModelUser.UserPassword) then
  begin
    FModelUser.UserPassword :=  FModelUser.MD5(FModelUser.UserPassword);
    FDTransaction := TFDTransaction.Create(nil);
    FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
    FDTransaction.StartTransaction;
    FDQueryUser := TControllerConnection.GetInstance().daoConnection.NewQuery;
    try
      try
        with FDQueryUser do
        begin
          SQL.Text := 'INSERT INTO tbl_user (id, userName, userPassword, createdDate)' +
                      ' VALUES (:id, :userName, :userPassword, :createdDate);';
          Params.Clear;
          Params.Add('id', ftString, 38, ptInput);
          Params.Add('userName', ftString, 100, ptInput);
          Params.Add('userPassword', ftString, 32, ptInput);
          Params.Add('createdDate', ftDateTime, ptInput);

          ParamByName('id').AsString := GUIDToString(FModelUser.Id);
          ParamByName('userName').AsString := FModelUser.UserName;
          ParamByName('userPassword').AsString := FModelUser.UserPassword;
          ParamByName('createdDate').AsDateTime := FModelUser.CreatedDate;
        end;
        FDQueryUser.ExecSQL;
        FDTransaction.Commit;
      finally
        FreeAndNil(FDQueryUser);
      end;
      result := true;
    except
      result := false;
    end;
  end else result := false;
end;

end.
