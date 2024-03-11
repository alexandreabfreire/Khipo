unit uModelUser;

interface

uses IdHashMessageDigest, System.SysUtils;

Type
  TModelUser = class
    private
    FId : TGUID;
    FUserName : String;
    FUserPassword : String;
    FCreatedDate : TDateTime;

    public
    property Id : TGUID read FId;
    property UserName : String read FUserName write FUserName;
    property UserPassword : String read FUserPassword write FUserPassword;
    property CreatedDate : TDateTime read FCreatedDate;
    function MD5(const texto:string):string;


    constructor Create(userName, userPassword : String);
    destructor Destroy; Override;

    published
  end;

implementation

{ TModelUser }

constructor TModelUser.Create(userName, userPassword : String);
begin
  inherited Create;
  CreateGUID(FId);
  FCreatedDate := Now;
  FUserName := userName;
  FUserPassword := userPassword;
end;

destructor TModelUser.Destroy;
begin

  inherited;
end;

function TModelUser.MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

end.
