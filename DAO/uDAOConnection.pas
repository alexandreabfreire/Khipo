unit uDAOConnection;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB;

Type
  TDAOConnection = Class
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    private
    FConnection : TFDConnection;
    public
    function GetConnection : TFDConnection;
    function NewQuery : TFDQuery;
    constructor Create;
    destructor Destroy; Override;
End;

implementation

{ TDAOConnection }

constructor TDAOConnection.Create;
begin
  inherited Create;
  FConnection := TFDConnection.Create(nil);
  FConnection.TxOptions.Isolation := xiReadCommitted;
  with FConnection do
  begin
    Params.DriverID := 'IB';
    Params.Database := 'DBESTOQUE.IB';
    Params.UserName := 'SYSDBA';
    Params.Password := 'masterkey';
    LoginPrompt := false;
  end;
end;

destructor TDAOConnection.Destroy;
begin
  inherited;
end;

function TDAOConnection.GetConnection: TFDConnection;
begin
  result := FConnection;
end;

function TDAOConnection.NewQuery: TFDQuery;
var
  query : TFDQuery;

begin
  query := TFDQuery.Create(nil);
  query.Connection := FConnection;
  result := query;
end;

end.
