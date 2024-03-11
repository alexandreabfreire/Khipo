unit uDAOProduct;

interface

uses
  uModelProduct, uControllerConnection, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, System.SysUtils, Datasnap.DBClient, Datasnap.Provider,
  uIDAOProduct;

type
  TDAOProduct = class(TInterfacedObject, IDAOProduct)

    private
      FModelProduct : TModelProduct;
      QProduct : TFDQuery;
      FDTransaction: TFDTransaction;
      procedure CopyMemTableToObject(var memTable : TFDMemTable; var obj : TModelProduct);
      procedure DefineMemTable(var memTable : TFDMemTable);
    public

      function GetCode(code : String) : TModelProduct;
      function GetId(id : String) : TModelProduct;
      function Save (code, productName, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
      function Update (id, code, productName, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
      function Delete (id : String): Boolean;
      function List : TDataSource;

      constructor Create;
      destructor Destroy; Override;

      class function New : IDAOProduct;
      published
  end;

implementation

constructor TDAOProduct.Create;
begin
  FModelProduct := TModelProduct.Create;
end;

destructor TDAOProduct.Destroy;
begin
  FreeAndNil(FModelProduct);
  inherited;
end;

class function TDAOProduct.New: IDAOProduct;
begin
  result := Self.Create;
end;

function TDAOProduct.GetCode(code : String): TModelProduct;
var
  FMemTable : TFDMemTable;
begin
  FMemTable := TFDMemTable.Create(nil);
  QProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with QProduct do
      begin
        Unprepare;
        Params.Add('code', ftString, 14, ptInput);
        ParamByName('code').AsString := code;
        SQL.Text := 'SELECT id, code, productName, status, unitTypeEntry, unitTypeSale, packageQuantity, createdDate, balance, price, category FROM tbl_product WHERE code = :code';
        Prepare;
        Open;
      end;
      DefineMemTable(FMemTable);
      FMemTable.Open;
      FMemTable.CopyDataSet(QProduct);
      CopyMemTableToObject(FMemTable, FModelProduct);
      result := FModelProduct;
    finally
      FreeAndNil(QProduct);
    end;
  except
  end;
end;

function TDAOProduct.GetId(id : String): TModelProduct;
var
  FMemTable : TFDMemTable;
begin
  FMemTable := TFDMemTable.Create(nil);
  QProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with QProduct do
      begin
        Unprepare;
        Params.Add('id', ftString, 38, ptInput);
        ParamByName('id').AsString := id;
        SQL.Text := 'SELECT id, code, productName, status, unitTypeEntry, unitTypeSale, packageQuantity, createdDate, balance, price, category FROM tbl_product WHERE id = :id';
        Prepare;
        Open;
      end;
      DefineMemTable(FMemTable);
      FMemTable.Open;
      FMemTable.CopyDataSet(QProduct);
      CopyMemTableToObject(FMemTable, FModelProduct);
      result := FModelProduct;
    finally
      FreeAndNil(QProduct);
    end;
  except
  end;
end;

procedure TDAOProduct.CopyMemTableToObject(var memTable : TFDMemTable; var obj : TModelProduct);
begin
 with obj do
 begin
   Id := StrToGUID(PCHAR(memTable.fieldbyname('id').AsString));
   Code := memTable.fieldbyname('code').AsString;
   Name := memTable.fieldbyname('productName').AsString;
   Status := memTable.fieldbyname('status').AsBoolean;
   UnitTypeEntry := memTable.fieldbyname('unitTypeEntry').AsString;
   UnitTypeSale := memTable.fieldbyname('unitTypeSale').AsString;
   PackageQuantity := memTable.fieldbyname('packageQuantity').AsFloat;
   CreatedDate := StrToDateTime(memTable.fieldbyname('createdDate').AsString);
   Balance := memTable.fieldbyname('balance').AsFloat;
   Price := memTable.fieldbyname('price').AsFloat;
   Category := memTable.fieldbyname('category').AsString;
 end;
end;


function TDAOProduct.List: TDataSource;
var
  FMemTable : TFDMemTable;
  DataSource : TDataSource;
begin
  DataSource := TDataSource.Create(nil);
  FMemTable := TFDMemTable.Create(nil);
  QProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with QProduct do
      begin
        Unprepare;
        SQL.Text := 'SELECT productName, code, status, unitTypeEntry, unitTypeSale, packageQuantity, createdDate, balance, price, category, id FROM tbl_product ORDER BY productName';
        Prepare;
        Open;
      end;
      DefineMemTable(FMemTable);
      FMemTable.Open;
      FMemTable.CopyDataSet(QProduct);
      DataSource.DataSet := FMemTable;
      result := DataSource;
    finally
      FreeAndNil(QProduct);
    end;
  except
  end;
end;

procedure TDAOProduct.DefineMemTable(var memTable : TFDMemTable);
begin
  with memTable.FieldDefs do
  begin
    with AddFieldDef do
    begin
      Name := 'productName';
      DataType := ftString;
      Size := 60;
    end;
    with AddFieldDef do
    begin
      Name := 'balance';
      DataType := ftFloat;
    end;
    with AddFieldDef do
    begin
      Name := 'status';
      DataType := ftString;
    end;
    with AddFieldDef do
    begin
      Name := 'code';
      DataType := ftString;
      Size := 14;
    end;
    with AddFieldDef do
    begin
      Name := 'price';
      DataType := ftFloat;
    end;
    with AddFieldDef do
    begin
      Name := 'category';
      DataType := ftString;
      Size := 40;
    end;
    with AddFieldDef do
    begin
      Name := 'unitTypeSale';
      DataType := ftString;
      Size := 20;
    end;
    with AddFieldDef do
    begin
      Name := 'unitTypeEntry';
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
      Name := 'lastModifiedDate';
      DataType := ftString;
      Size := 20;
    end;
    with AddFieldDef do
    begin
      Name := 'createdDate';
      DataType := ftString;
      Size := 20;
    end;
    with AddFieldDef do
    begin
      Name := 'id';
      DataType := ftString;
      Size := 38;
    end;
  end;
end;

function TDAOProduct.Save(code, productName, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  QProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with QProduct do
      begin
        SQL.Text := 'INSERT INTO tbl_product (id, code, productName, status, unitTypeEntry, unitTypeSale, packageQuantity, createdDate, balance, price, category)' +
                    ' VALUES (:id, :code, :productName, :status, :unitTypeEntry, :unitTypeSale, :packageQuantity, :createdDate, :balance, :price, :category);';
        Params.Clear;
        Params.Add('id', ftString, 38, ptInput);
        Params.Add('code', ftString, 14, ptInput);
        Params.Add('productName', ftString, 100, ptInput);
        Params.Add('status', ftBoolean, ptInput);
        Params.Add('unitTypeEntry', ftString, 20, ptInput);
        Params.Add('unitTypeSale', ftString, 20, ptInput);
        Params.Add('packageQuantity', ftFloat, ptInput);
        Params.Add('createdDate', ftDateTime, ptInput);
        Params.Add('balance', ftFloat, ptInput);
        Params.Add('price', ftFloat, ptInput);
        Params.Add('category', ftString, 100, ptInput);

        ParamByName('id').AsString := GUIDToString(FModelProduct.Id);
        ParamByName('code').AsString := code;
        ParamByName('productName').AsString := productName;
        ParamByName('status').AsBoolean := true;
        ParamByName('unitTypeEntry').AsString := unitTypeEntry;
        ParamByName('unitTypeSale').AsString := unitTypeSale;
        ParamByName('packageQuantity').AsFloat := packageQuantity;
        ParamByName('createdDate').AsDateTime := FModelProduct.CreatedDate;
        ParamByName('balance').AsFloat := 0;
        ParamByName('price').AsFloat := price;
        ParamByName('category').AsString := category;
      end;
      QProduct.ExecSQL;
      FDTransaction.Commit;
    finally
      FreeAndNil(QProduct);
    end;
    result := true;
  except
    result := false;
  end;
end;

function TDAOProduct.Update(id, code, productName, unitTypeSale, unitTypeEntry, category : String; packageQuantity, price : Double): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  QProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with QProduct do
      begin
        SQL.Text := 'UPDATE tbl_product SET productName = :productName, code = :code, status = :status, unitTypeEntry = :unitTypeEntry, unitTypeSale = :unitTypeSale, packageQuantity = :packageQuantity, ' +
                    ' price = :price, category = :category, lastModifiedDate = CURRENT_TIME WHERE id = :id;';
        Params.Clear;
        Params.Add('id', ftString, 38, ptInput);
        Params.Add('code', ftString, 14, ptInput);
        Params.Add('productName', ftString, 100, ptInput);
        Params.Add('status', ftBoolean, ptInput);
        Params.Add('unitTypeEntry', ftString, 20, ptInput);
        Params.Add('unitTypeSale', ftString, 20, ptInput);
        Params.Add('packageQuantity', ftFloat, ptInput);
        Params.Add('price', ftFloat, ptInput);
        Params.Add('category', ftString, 100, ptInput);

        ParamByName('id').AsString := id;
        ParamByName('code').AsString := code;
        ParamByName('productName').AsString := productName;
        ParamByName('status').AsBoolean := true;
        ParamByName('unitTypeEntry').AsString := unitTypeEntry;
        ParamByName('unitTypeSale').AsString := unitTypeSale;
        ParamByName('packageQuantity').AsFloat := packageQuantity;
        ParamByName('price').AsFloat := price;
        ParamByName('category').AsString := category;
      end;
      QProduct.ExecSQL;
      FDTransaction.Commit;
    finally
      FreeAndNil(QProduct);
    end;
    result := true;
  except
    result := false;
  end;

end;

function TDAOProduct.Delete(id : String): Boolean;
begin
  FDTransaction := TFDTransaction.Create(nil);
  FDTransaction.Connection := TControllerConnection.GetInstance().daoConnection.GetConnection;
  FDTransaction.StartTransaction;
  QProduct := TControllerConnection.GetInstance().daoConnection.NewQuery;
  try
    try
      with QProduct do
      begin
        SQL.Text := 'DELETE FROM tbl_product WHERE id = :id;';
        Params.Clear;
        Params.Add('id', ftString, 38, ptInput);
        ParamByName('id').AsString := id;
      end;
      QProduct.ExecSQL;
      FDTransaction.Commit;
    finally
      FreeAndNil(QProduct);
    end;
    result := true;
  except
    result := false;
  end;
end;

end.
