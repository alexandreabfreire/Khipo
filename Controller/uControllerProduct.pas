unit uControllerProduct;

interface

uses System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, Datasnap.DBClient, System.Generics.Collections,
  uIDAOProduct, uModelProduct, uIControllerProduct;

type
  TControllerProduct = class(TInterfacedObject, IControllerProduct)
    private
    FDAOProduct: IDAOProduct;

    public
    function Save(code, name, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
    function Update(id : String; code, name, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
    function Delete(id : String): Boolean;
    function GetCode(code : String): TModelProduct;
    function GetId(id : String) : TModelProduct;
    function List : TDataSource;

    constructor Create;
    destructor Destroy; Override;

    class function New : IControllerProduct;
    published
  end;

implementation

uses
  uDAOProduct, Winapi.Windows, Vcl.Forms;

{ TControllerProduct }

constructor TControllerProduct.Create;
begin
  FDAOProduct := TDAOProduct.New;
end;

destructor TControllerProduct.Destroy;
begin

  inherited;
end;

function TControllerProduct.GetCode(code: String): TModelProduct;
begin
  result := FDAOProduct.GetCode(code);
end;

function TControllerProduct.GetId(id: String): TModelProduct;
begin

end;

function TControllerProduct.List: TDataSource;
begin
   result := FDAOProduct.List;
end;

class function TControllerProduct.New: IControllerProduct;
begin
  result := Self.Create;
end;

function TControllerProduct.Save(code, name, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
begin
  if (FDAOProduct.Save(code, name, unitTypeSale, unitTypeEntry, category, packageQuantity, price)) then
    result := true
  else
    result := false;
end;

function TControllerProduct.Update(id: String; code, name, unitTypeSale,
  unitTypeEntry, category: String; packageQuantity, price: Double): Boolean;
begin
  if (FDAOProduct.Update(id, code, name, unitTypeSale, unitTypeEntry, category, packageQuantity, price)) then
    result := true
  else
    result := false;
end;

function TControllerProduct.Delete(id: String): Boolean;
begin
  if (FDAOProduct.Delete(id)) then
    result := true
  else
    result := false;
end;

end.
