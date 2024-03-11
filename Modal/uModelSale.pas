unit uModelSale;

interface

uses
  FireDAC.Comp.Client, System.SysUtils;

Type
  TModelSale = class
    private
    FId : TGUID;
    FProductId : TGUID;
    FUnitType : String;
    FQuantity : Double;
    FPrice : Double;
    FCreatedDate : TDateTime;

    public
    property Id : TGUID read FId;
    property ProductId : TGUID read FProductId write FProductId;
    property UnitType : String read FUnitType write FUnitType;
    property Quantity : Double read FQuantity write FQuantity;
    property Price : Double read FPrice write FPrice;
    property CreatedDate : TDateTime read FCreatedDate;

    constructor Create;
    destructor Destroy; Override;

    published
  end;


implementation

{ TModelSale }

constructor TModelSale.Create;
begin
  inherited Create;
  CreateGUID(FId);
  FCreatedDate := Now;
end;

destructor TModelSale.Destroy;
begin

  inherited;
end;

end.
