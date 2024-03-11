unit uControllerConnection;

interface

uses
  uDAOConnection, SysUtils;

Type
  // Singleton
  TControllerConnection = Class
    private
      FConnection : TDAOConnection;
      constructor Create;
      destructor Destroy; Override;
    public
      property daoConnection : TDAOConnection read FConnection write FConnection;
      class function GetInstance: TControllerConnection;
  End;

implementation

var
  dbInstance: TControllerConnection;

  { TControllerConnection }

constructor TControllerConnection.Create;
begin
  inherited Create;
  FConnection := TDAOConnection.Create;
end;

destructor TControllerConnection.Destroy;
begin
  inherited;
  FreeAndNil(FConnection);
end;

class function TControllerConnection.GetInstance: TControllerConnection;
begin
  if dbInstance = nil then
    dbInstance := TControllerConnection.Create;

  result := dbInstance
end;

initialization

dbInstance := nil;

finalization

if dbInstance <> nil then
  dbInstance.Free;

end.
