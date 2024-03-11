unit uIDAOSale;

interface

uses
  Data.DB;

type
  IDAOSale = interface
    ['{8508F959-4FFA-41D0-88F4-F7CD68156F08}']

    function Save (productId, unitTypeSale : String; quantity, price : Double): Boolean;
    function Delete (id, productId : String; quantity : Double): Boolean;
    function List(productId : String) : TDataSource;

    end;

implementation

end.
