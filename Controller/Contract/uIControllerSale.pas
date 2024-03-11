unit uIControllerSale;

interface

uses
  Data.DB;

type
  IControllerSale = interface
    ['{BBD681FE-C538-4648-912F-B2A83355A3D4}']

    function Save(productId : String; quantity : Double): Boolean;
    function List(productId : String) : TDataSource;

    end;

implementation

end.
