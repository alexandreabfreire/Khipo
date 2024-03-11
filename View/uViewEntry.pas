unit uViewEntry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, uModelProduct, uControllerConnection,
  uIControllerProduct, uIControllerEntry, uControllerProduct;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label13: TLabel;
    Image1: TImage;
    Label15: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label16: TLabel;
    Edit2: TEdit;
    ComboBox4: TComboBox;
    Edit1: TEdit;
    Edit3: TEdit;
    ComboBox5: TComboBox;
    Edit9: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    EditPackageQuantity: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Edit5: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure ClearFields();
    function IsValid(): Boolean;
  end;

var
  Form4: TForm4;
  FControllerProduct :  IControllerProduct;
  FControllerEntry :  IControllerEntry;
  FModelProduct : TModelProduct;

implementation

uses
  uControllerEntry;


{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
  Edit2.SetFocus();
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  try
  FControllerProduct :=  TControllerProduct.New;
  FModelProduct := FControllerProduct.GetCode(Edit2.Text);
  Edit1.Text := FModelProduct.Name;
  Edit5.Text := FloatToStr(FModelProduct.Balance);
  EditPackageQuantity.Text := FloatToStr(FModelProduct.PackageQuantity);
  Combobox4.ItemIndex := Combobox4.Items.IndexOf(FModelProduct.Category);
  Combobox5.ItemIndex := Combobox5.Items.IndexOf(FModelProduct.UnitTypeEntry);
  Edit9.Text :=  PCHAR(GUIDToString(FModelProduct.Id));
  except
    showmessage('Produto não encontrado.');
  end;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  if (IsValid) then
  begin
    FControllerEntry :=  TControllerEntry.New;
    if (FControllerEntry.Save(Edit9.Text, StrToFloat(Edit4.Text), StrToFloat(Edit3.Text))) then
    begin
      showmessage('Abastecimento realizado!');
      ClearFields();
    end;
  end else showmessage('Dados inválidos. Verifique por favor os campos preço de compra e quantidade');

end;

procedure TForm4.ClearFields();
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit9.Text := '';
  Combobox4.ItemIndex := -1;
  Combobox5.ItemIndex := -1;
  EditPackageQuantity.Text := '';
end;

function TForm4.IsValid(): Boolean;
var
  verifyDouble : Double;
begin
  try
    verifyDouble := StrToFloat(Edit3.Text);
    verifyDouble := StrToFloat(Edit4.Text);
    verifyDouble := StrToFloat(Edit5.Text);
    result := true;
  except
    result := false;
  end;
end;

end.
