unit uIDAOProduct;

interface

uses
  Data.DB, uModelProduct;
type
  IDAOProduct = interface
    ['{69892735-8065-4CAD-B9A8-7E8FEFF66F54}']

    function GetCode(code : String) : TModelProduct;
    function GetId(id : String) : TModelProduct;
    function Save (code, productName, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
    function Update (id, code, productName, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
    function Delete (id : String): Boolean;
    function List : TDataSource;

    end;
implementation

end.
