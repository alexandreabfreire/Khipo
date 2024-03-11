unit uDAOEntry;

interface

uses
  uControllerConnection, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, System.SysUtils, Datasnap.DBClient, Datasnap.Provider,
  uIDAOEntry, uModelEntry;

type
  TDAOentry = class(TInterfacedObject, IDAOEntry)

    private
    FModelEntry : TModelEntry;
    FDTransaction: TFDTransaction;
    FDQueryProduct : TFDQuery;
    FDQueryEntry : TFDQuery;
    procedure DefineMemTable(var memTable : TFDMemTable);
    public
      function Save (productId, unitTypeEntry : String; quantity, amount, packageQuantity : Double): Boolean;
      function Delete (id, productId : String; quantity : Double): Boolean;
      function List(productId : String) : TDataSource;

      constructor Create;
      destructor Destroy; Override;

      class function New : IDAOEntry;
      published
  end;

implementation


{ TDAOEntry }

constructor TDAOEntry.Create;
begin
  FModelEntry := TModelEntry.Create;
  inherited;
end;

destructor TDAOEntry.Destroy;
begin
  FreeAndNil(FModelEntry);
  inherited;
end;

class function TDAOentry.New: IDAOEntry;
begin
  result := Self.Create;
end;

function TDAOentry.List(productId: String): TDataSource;
var
  FMemTable : TFDMemTable;
  DataSource : TDataSource;
begin
  DataSource := TDataSource.Create(nil);
  FMemTable := TFDMemTable.Create(nil);
  FDQueryEntry := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with FDQueryEntry do
      begin
        Unprepare;
        SQL.Text := 'SELECT createdDate, quantity, unitType, packageQuantity, amount, id FROM tbl_entry WHERE productId = :productId ORDER BY createdDate DESC';
        Params.Clear;
        Params.Add('productId', ftString, 38, ptInput);
        ParamByName('productId').AsString := productId;
        Prepare;
        Open;
      end;
      DefineMemTable(FMemTable);
      FMemTable.Open;
      FMemTable.CopyDataSet(FDQueryEntry);
      DataSource.DataSet := FMemTable;
      result := DataSource;
    finally
      FreeAndNil(FDQueryEntry);
    end;
  except
  end;
end;

procedure TDAOEntry.DefineMemTable(var memTable : TFDMemTable);
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
      Name := 'packageQuantity';
      DataType := ftFloat;
    end;
    with AddFieldDef do
    begin
      Name := 'amount';
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

function TDAOEntry.Save(productId, unitTypeEntry : String; quantity, amount, packageQuantity : Double): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  FDQueryProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  FDQueryEntry := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    with FDQueryProduct do
    begin
      SQL.Text := 'UPDATE tbl_product SET balance = balance + :quantity, lastModifiedDate = CURRENT_TIME WHERE id = :id';
      Params.Clear;
      Params.Add('id', ftString, 38, ptInput);
      Params.Add('quantity', ftFloat, ptInput);

      ParamByName('id').AsString := productId;
      ParamByName('quantity').AsFloat := quantity * packageQuantity;
      ExecSQL;
    end;
    with FDQueryEntry do
    begin
      SQL.Text := 'INSERT INTO tbl_entry (id, productId, unitType, packageQuantity, quantity, amount, createdDate) VALUES (:id, :productId, :unitType, :packageQuantity, :quantity, :amount, :createdDate)';
      Params.Clear;
      Params.Add('id', ftString, 38, ptInput);
      Params.Add('ProductId', ftString, 38, ptInput);
      Params.Add('unitType', ftString, 20, ptInput);
      Params.Add('packageQuantity', ftFloat, ptInput);
      Params.Add('quantity', ftFloat, ptInput);
      Params.Add('amount', ftFloat, ptInput);
      Params.Add('createdDate', ftDateTime, ptInput);

      ParamByName('id').AsString := FModelEntry.Id.ToString();
      ParamByName('ProductId').AsString := productId;
      ParamByName('unitType').AsString := unitTypeEntry;
      ParamByName('packageQuantity').AsFloat := packageQuantity;
      ParamByName('quantity').AsFloat := quantity;
      ParamByName('amount').AsFloat := amount;
      ParamByName('createdDate').AsDateTime := FModelEntry.CreatedDate;
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

function TDAOEntry.Delete(id, productId : String; quantity : Double): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  FDQueryProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  FDQueryEntry := TControllerConnection.GetInstance().daoConnection.NewQuery;
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
    with FDQueryEntry do
    begin
      SQL.Text := 'DELETE FROM tbl_entry WHERE id = :id)';
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
