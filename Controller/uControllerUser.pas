unit uControllerUser;

interface

uses System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, Datasnap.DBClient, uIDAOUser,
  uIControllerUser;

type
  TControllerUser = class(TInterfacedObject, IControllerUser)
    private
    FDAOUser: IDAOUser;

    public
    function Save (): Boolean;
    function Authentication(userName, userPassword : String): Boolean;
    constructor Create(userName, userPassword : String);
    destructor Destroy; Override;

    class function New(userName, userPassword : String) : IControllerUser;
    published
  end;

implementation

uses
  uDAOUser;

{ TControllerSale }

function TControllerUser.Authentication(userName, userPassword: String): Boolean;
begin
  if (FDAOUser.Authentication(userName, userPassword)) then
    result := true
  else
    result := false;


end;

constructor TControllerUser.Create(userName, userPassword : String);
begin
  FDAOUser := TDAOUser.New(userName, userPassword);
end;

destructor TControllerUser.Destroy;
begin

  inherited;
end;

class function TControllerUser.New(userName, userPassword : String): IControllerUser;
begin
  result := Self.Create(userName, userPassword);
end;

function TControllerUser.Save: Boolean;
begin
  result := FDAOUser.Save;
end;

end.
