unit uControllerEntry;

interface

uses uIDAOEntry, uIDAOProduct, uModelProduct, System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, Datasnap.DBClient, uIControllerEntry;

type
  TControllerEntry = class(TInterfacedObject, IControllerEntry)
    private
      FDAOEntry: IDAOEntry;
      FDAOProduct: IDAOProduct;
      FModelProduct : TModelProduct;
    public
    function Save(productId : String; quantity, amount : Double): Boolean;
    function List(productId : String) : TDataSource;
    constructor Create;
    destructor Destroy; Override;

    class function New : IControllerEntry;
    published
  end;

implementation

uses
  uDAOEntry, uDAOProduct;

{ TControllerProduct }

constructor TControllerEntry.Create;
begin

  FDAOEntry := TDAOEntry.New;
  FDAOProduct := TDAOProduct.New;
  inherited;
end;

destructor TControllerEntry.Destroy;
begin

  inherited;
end;

function TControllerEntry.List(productId: String): TDataSource;
begin
  result := FDAOEntry.List(productId);
end;

class function TControllerEntry.New: IControllerEntry;
begin
  result := Self.Create;
end;

function TControllerEntry.Save(productId : String; quantity, amount : Double): Boolean;
var
  unitTypeSale : String;
  price, packageQuantity : Double;
begin
  FModelProduct := FDAOProduct.GetId(productId);
  unitTypeSale := FModelProduct.UnitTypeSale;
  packageQuantity := FModelProduct.PackageQuantity;
  if (FDAOEntry.Save(productId, unitTypeSale, quantity, amount, packageQuantity)) then
    result := true
  else
    result := false;
end;

end.
