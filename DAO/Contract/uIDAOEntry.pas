unit uIDAOEntry;

interface

uses
  Data.DB;

type
  IDAOEntry = interface
    ['{C735D708-CABB-414B-864B-B410D2CD2DA0}']

    function Save (productId, unitTypeEntry : String; quantity, amount, packageQuantity : Double): Boolean;
    function Delete (id, productId : String; quantity : Double): Boolean;
    function List(productId : String) : TDataSource;

  end;
implementation

end.
