unit uDAOSale;

interface

uses
  uModelSale, uControllerConnection, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, System.SysUtils, Datasnap.DBClient, Datasnap.Provider,
  uIDAOSale;

type
  TDAOSale = class(TInterfacedObject, IDAOSale)

    private
      FModelSale : TModelSale;
      FDTransaction: TFDTransaction;
      FDQueryProduct : TFDQuery;
      FDQuerySale : TFDQuery;
      procedure DefineMemTable(var memTable : TFDMemTable);
    public
      function Save (productId, unitTypeSale : String; quantity, price : Double): Boolean;
      function Delete (id, productId : String; quantity : Double): Boolean;
      function List(productId : String) : TDataSource;

      constructor Create;
      destructor Destroy; Override;

      class function New : IDAOSale;
      published
  end;

implementation

{ TDAOSale }

constructor TDAOSale.Create;
begin

  FModelSale := TModelSale.Create;
  inherited;
end;

destructor TDAOSale.Destroy;
begin
  FreeAndNil(FModelSale);
  inherited;
end;

class function TDAOSale.New: IDAOSale;
begin
  result := Self.Create;
end;

function TDAOSale.List(productId : String): TDataSource;
var
  FMemTable : TFDMemTable;
  DataSource : TDataSource;
begin
  DataSource := TDataSource.Create(nil);
  FMemTable := TFDMemTable.Create(nil);
  FDQuerySale := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with FDQuerySale do
      begin
        Unprepare;
        SQL.Text := 'SELECT createdDate, quantity, unitType, price, id FROM tbl_sale WHERE productId = :productId ORDER BY createdDate DESC';
        Params.Clear;
        Params.Add('productId', ftString, 38, ptInput);
        ParamByName('productId').AsString := productId;
        Prepare;
        Open;
      end;
      DefineMemTable(FMemTable);
      FMemTable.Open;
      FMemTable.CopyDataSet(FDQuerySale);
      DataSource.DataSet := FMemTable;
      result := DataSource;
    finally
      FreeAndNil(FDQuerySale);
    end;
  except
  end;
end;

procedure TDAOSale.DefineMemTable(var memTable : TFDMemTable);
begin
  with memTable.FieldDefs do
  begin
   with AddFieldDef do
    begin
      Name := 'createdDate';
      DataType := ftString;
      Size := 20;
    end;
    with AddFieldDef do
    begin
      Name := 'quantity';
      DataType := ftFloat;
    end;
    with AddFieldDef do
    begin
      Name := 'unitType';
      DataType := ftString;
      Size := 20;
    end;
    with AddFieldDef do
    begin
      Name := 'price';
      DataType := ftFloat;
    end;
    with AddFieldDef do
    begin
      Name := 'id';
      DataType := ftString;
      Size := 38;
    end;
   end;
end;

function TDAOSale.Save(productId, unitTypeSale : String; quantity, price : Double): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  FDQueryProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  FDQuerySale := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    with FDQueryProduct do
    begin
      SQL.Text := 'UPDATE tbl_product SET balance = balance - :quantity, lastModifiedDate = CURRENT_TIME WHERE id = :id';
      Params.Clear;
      Params.Add('id', ftString, 38, ptInput);
      Params.Add('quantity', ftFloat, ptInput);

      ParamByName('id').AsString := productId;
      ParamByName('quantity').AsFloat := quantity;
      ExecSQL;
    end;
    with FDQuerySale do
    begin
      SQL.Text := 'INSERT INTO tbl_sale (id, productId, unitType, quantity, price, createdDate) VALUES (:id, :productId, :unitType, :quantity, :price, :createdDate)';
      Params.Clear;
      Params.Add('id', ftString, 38, ptInput);
      Params.Add('ProductId', ftString, 38, ptInput);
      Params.Add('unitType', ftString, 20, ptInput);
      Params.Add('quantity', ftFloat, ptInput);
      Params.Add('price', ftFloat, ptInput);
      Params.Add('createdDate', ftDateTime, ptInput);

      ParamByName('id').AsString := FModelSale.Id.ToString();
      ParamByName('ProductId').AsString := productId;
      ParamByName('unitType').AsString := unitTypeSale;
      ParamByName('quantity').AsFloat := quantity;
      ParamByName('price').AsFloat := price;
      ParamByName('createdDate').AsDateTime := FModelSale.CreatedDate;
      ExecSQL;
    end;
    FDTransaction.Commit;
    result := true;
  except
    on E: EAbort do begin
      FDTransaction.Rollback;
      result := false;
    end;

  end;

end;

function TDAOSale.Delete(id, productId : String; quantity : Double): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  FDQueryProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  FDQuerySale := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    with FDQueryProduct do
    begin
      SQL.Text := 'UPDATE tbl_product SET balance = balance + :quantity, lastModifiedDate = CURRENT_TIME WHERE id = :id';
      Params.Clear;
      Params.Add('id', ftString, 38, ptInput);
      Params.Add('quantity', ftFloat, ptInput);

      ParamByName('id').AsString := productId;
      ParamByName('quantity').AsFloat := quantity;
      ExecSQL;
    end;
    with FDQuerySale do
    begin
      SQL.Text := 'DELETE FROM tbl_sale WHERE id = :id)';
      Params.Clear;
      Params.Add('id', ftString, 38, ptInput);
      ParamByName('id').AsString := id;
      ExecSQL;
    end;
    FDTransaction.Commit;
  except
    on E: EAbort do
      FDTransaction.Rollback;
  end;

end;

end.
