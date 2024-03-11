unit uModelProduct;

interface

uses
  FireDAC.Comp.Client, System.SysUtils;

Type
  TModelProduct = class
    private
    FId : TGUID;
    FCode : String;
    FName : String;
    FStatus : Boolean;
    FUnitTypeEntry : String;
    FUnitTypeSale : String;
    FPackageQuantity : double;
    FCreatedDate : TDateTime;
    FLastModifiedDate : TDateTime;
    FBalance : Double;
    FPrice : Double;
    FCategory : String;


    public
    property Id : TGUID read FId write FId;
    property Code : String read FCode write FCode;
    property Name : String read FName write FName;
    property Status : Boolean read FStatus write FStatus;
    property UnitTypeEntry : String read FUnitTypeEntry write FUnitTypeEntry;
    property UnitTypeSale : String read FUnitTypeSale write FUnitTypeSale;
    property PackageQuantity : Double read FPackageQuantity write FPackageQuantity;
    property CreatedDate : TDateTime read FCreatedDate write FCreatedDate;
    property LastModifiedDate : TDateTime read FLastModifiedDate write FLastModifiedDate;
    property Balance : Double read FBalance write FBalance;
    property Price : Double read FPrice write FPrice;
    property Category : String read FCategory write FCategory;

    constructor Create;
    destructor Destroy; Override;

    published
  end;

implementation

{ TModelProduct }

constructor TModelProduct.Create;
begin

  CreateGUID(FId);
  FCreatedDate := Now;
end;

destructor TModelProduct.Destroy;
begin

end;

end.
