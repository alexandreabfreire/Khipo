unit uControllerSale;

interface

uses uIDAOSale, uIDAOProduct, uModelProduct, System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, Datasnap.DBClient, uIControllerSale;

type
  TControllerSale = class(TInterfacedObject, IControllerSale)
    private
    FDAOSale: IDAOSale;
    FDAOProduct: IDAOProduct;
    FModelProduct : TModelProduct;
    public
    function Save(productId : String; quantity : Double): Boolean;
    function List(productId : String) : TDataSource;
    constructor Create;
    destructor Destroy; Override;

    class function New : IControllerSale;
    published
  end;

implementation

uses
  uDAOSale, uDAOProduct;

{ TControllerSale }

constructor TControllerSale.Create;
begin
  FDAOSale := TDAOSale.New;
  FDAOProduct := TDAOProduct.New;
  inherited;
end;

destructor TControllerSale.Destroy;
begin

  inherited;
end;

function TControllerSale.List(productId: String): TDataSource;
begin
  result := FDAOSale.List(productId);
end;

class function TControllerSale.New: IControllerSale;
begin
  result := Self.Create;
end;

function TControllerSale.Save(productId : String; quantity : Double): Boolean;
var
  unitTypeSale : String;
  price : Double;
begin
  FModelProduct := FDAOProduct.GetId(productId);
  unitTypeSale := FModelProduct.UnitTypeSale;
  price := FModelProduct.Price;
  if (FDAOSale.Save(productId, unitTypeSale, quantity, price)) then
    result := true
  else
    result := false;
end;

end.
