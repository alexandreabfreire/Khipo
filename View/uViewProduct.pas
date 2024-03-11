unit uViewProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.StdCtrls, uIControllerProduct, uControllerConnection, Vcl.Imaging.pngimage,
  uModelProduct, Data.DB, Vcl.Grids, Vcl.DBGrids, System.SysUtils;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    EditNameProduct: TEdit;
    Label2: TLabel;
    EditCode: TEdit;
    Label3: TLabel;
    EditPrice: TEdit;
    Label9: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    EditPackageQuantity: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    ComboBox2: TComboBox;
    Label11: TLabel;
    ComboBox3: TComboBox;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox4: TComboBox;
    Edit4: TEdit;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Panel10: TPanel;
    SpeedButton3: TSpeedButton;
    Image1: TImage;
    Panel11: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Image2: TImage;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox7: TComboBox;
    Edit8: TEdit;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Panel12: TPanel;
    SpeedButton4: TSpeedButton;
    TabSheet4: TTabSheet;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    DBGrid1: TDBGrid;
    SpeedButton5: TSpeedButton;
    Edit9: TEdit;
    Edit10: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ClearFields();
    function InsertIsValid(): Boolean;

  end;

var
  Form2: TForm2;
  FControllerProduct: IControllerProduct;
  FModelProduct : TModelProduct;

implementation

uses
  uControllerProduct;


{$R *.dfm}

procedure TForm2.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key<'0') or (key>'9')) and (key<>'.') and (key<>'/') and (key<>'*') and (key<>#8) and (key<>#13) then
  begin
    Messagebeep(0);
    key:=#0;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  PageControl1.Pages[0];
  EditNameProduct.SetFocus();
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  try
  FControllerProduct :=  TControllerProduct.New;
  FModelProduct := FControllerProduct.GetCode(Edit2.Text);
  Edit1.Text := FModelProduct.Name;
  Edit4.Text := FloatToStr(FModelProduct.PackageQuantity);
  Edit3.Text := FloatToStr(FModelProduct.Price);
  Combobox4.ItemIndex := Combobox4.Items.IndexOf(FModelProduct.Category);
  Combobox5.ItemIndex := Combobox5.Items.IndexOf(FModelProduct.UnitTypeSale);
  Combobox6.ItemIndex := Combobox6.Items.IndexOf(FModelProduct.UnitTypeEntry);
  Edit9.Text :=  PCHAR(GUIDToString(FModelProduct.Id));
  except
    showmessage('Produto não encontrado.');
  end;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  try
  FControllerProduct :=  TControllerProduct.New;
  FModelProduct := FControllerProduct.GetCode(Edit6.Text);
  Edit5.Text := FModelProduct.Name;
  Edit8.Text := FloatToStr(FModelProduct.PackageQuantity);
  Edit7.Text := FloatToStr(FModelProduct.Price);
  Combobox7.ItemIndex := Combobox7.Items.IndexOf(FModelProduct.Category);
  Combobox8.ItemIndex := Combobox8.Items.IndexOf(FModelProduct.UnitTypeSale);
  Combobox9.ItemIndex := Combobox9.Items.IndexOf(FModelProduct.UnitTypeEntry);
  Edit10.Text :=  PCHAR(GUIDToString(FModelProduct.Id));
  except
    showmessage('Produto não encontrado.');
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  PageControl1.Pages[0];
  PageControl1.ActivePageIndex := 0;
  EditNameProduct.SetFocus();
  Close;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  if (InsertIsValid) then
  begin
  FControllerProduct :=  TControllerProduct.New;
  if (FControllerProduct.Save(EditCode.Text,EditNameProduct.Text,Combobox2.Text, Combobox3.Text, Combobox1.Text,StrToFloat(EditPackageQuantity.Text),StrToFloat(EditPrice.Text))) then
  begin
    showmessage('Produto cadastrado!');
    ClearFields();
  end;
  end else showmessage('Dados inválidos. Verifique por favor os campos digitados');

end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  FControllerProduct :=  TControllerProduct.New;
  if (FControllerProduct.Update(Edit9.Text, Edit2.Text, Edit1.Text,Combobox5.Text, Combobox6.Text, Combobox4.Text,StrToFloat(Edit4.Text),StrToFloat(Edit3.Text))) then
  begin
    showmessage('Produto alterado!');
    ClearFields();
  end;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  if Application.MessageBox( 'Confirma excluir o produto?',' Estoque ',mb_YesNo +mb_iconQuestion) = mrno
    then exit;
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');

  FControllerProduct :=  TControllerProduct.New;
  if (FControllerProduct.Delete(Edit10.Text)) then
  begin
    showmessage('Produto excluído!');
    ClearFields();
  end else showmessage('Não foi possível excluir. Provavelmente este produto já foi abastecido no passado.');
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  FControllerProduct :=  TControllerProduct.New;

  DBGrid1.DataSource := FControllerProduct.List;
end;

procedure TForm2.ClearFields();
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
  Edit7.Text := '';
  Edit9.Text := '';
  Edit10.Text := '';
  EditCode.Text := '';
  EditNameProduct.Text := '';
  EditPackageQuantity.Text := '';
  EditPrice.Text  := '';
  Combobox1.ItemIndex := -1;
  Combobox2.ItemIndex := -1;
  Combobox3.ItemIndex := -1;
  Combobox4.ItemIndex := -1;
  Combobox5.ItemIndex := -1;
  Combobox6.ItemIndex := -1;
  Combobox7.ItemIndex := -1;
  Combobox8.ItemIndex := -1;
  Combobox9.ItemIndex := -1;

end;

function TForm2.InsertIsValid(): Boolean;
var
  verifyDouble : Double;
begin
  try
    verifyDouble := StrToFloat(EditPackageQuantity.Text);
    verifyDouble := StrToFloat(EditPrice.Text);
    if (Trim(EditNameProduct.text) = '') OR (Trim(EditCode.text) = '') OR (Combobox1.ItemIndex = -1) OR (Combobox2.ItemIndex = -1)  OR (Combobox3.ItemIndex = -1) then
    begin
      result := false;
    end else result := true;
  except
    result := false;
  end;
end;

end.
