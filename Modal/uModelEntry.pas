unit uModelEntry;

interface

uses
  FireDAC.Comp.Client, System.SysUtils;

Type
  TModelEntry = class
    private
    FId : TGUID;
    FProductId : TGUID;
    FUnitType : String;
    FPackageQuantity : double;
    FQuantity : Double;
    FAmount : Double;
    FCreatedDate : TDateTime;

    public
    property Id : TGUID read FId;
    property ProductId : TGUID read FProductId write FProductId;
    property UnitType : String read FUnitType write FUnitType;
    property PackageQuantity : Double read FPackageQuantity write FPackageQuantity;
    property Quantity : Double read FQuantity write FQuantity;
    property Amount : Double read FAmount write FAmount;
    property CreatedDate : TDateTime read FCreatedDate;

    constructor Create;
    destructor Destroy; Override;

    published
  end;

implementation

{ TModelEntry }

constructor TModelEntry.Create;
begin

  inherited Create;
  CreateGUID(FId);
  FCreatedDate := Now;
end;

destructor TModelEntry.Destroy;
begin

  inherited;
end;

end.
