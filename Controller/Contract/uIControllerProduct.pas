unit uIControllerProduct;

interface

uses
  uModelProduct, Data.DB;

type
  IControllerProduct = interface
    ['{2B1B8149-0D3F-4A54-BEB9-2E965F40198E}']

    function Save(code, name, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
    function Update(id : String; code, name, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
    function Delete(id : String): Boolean;
    function GetCode(code : String): TModelProduct;
    function GetId(id : String) : TModelProduct;
    function List : TDataSource;

    end;

implementation

end.
