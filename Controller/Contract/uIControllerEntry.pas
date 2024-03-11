unit uIControllerEntry;

interface

uses
  Data.DB;

type
  IControllerEntry = interface
    ['{937A503B-9E40-4331-B80E-97E08BBA3213}']

    function Save(productId : String; quantity, amount : Double): Boolean;
    function List(productId : String) : TDataSource;

    end;

implementation

end.
