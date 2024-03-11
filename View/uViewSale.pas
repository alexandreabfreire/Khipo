unit uViewSale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, uControllerConnection, uIControllerProduct,
  uIControllerSale, uModelProduct;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label13: TLabel;
    Edit2: TEdit;
    Image1: TImage;
    Label15: TLabel;
    ComboBox4: TComboBox;
    Label12: TLabel;
    Edit1: TEdit;
    Label14: TLabel;
    Edit3: TEdit;
    Label21: TLabel;
    ComboBox5: TComboBox;
    Edit9: TEdit;
    Edit4: TEdit;
    Label16: TLabel;
    Edit5: TEdit;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ClearFields();
    function IsValid(): Boolean;
  end;

var
  Form3: TForm3;
  FControllerProduct :  IControllerProduct;
  FControllerSale :  IControllerSale;
  FModelProduct : TModelProduct;

implementation

uses
  uControllerProduct, uControllerSale;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
  Edit2.SetFocus();
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
  try
  FControllerProduct :=  TControllerProduct.New;
  FModelProduct := FControllerProduct.GetCode(Edit2.Text);
  Edit1.Text := FModelProduct.Name;
  Edit4.Text := '1';
  Edit3.Text := FloatToStr(FModelProduct.Price);
  Edit5.Text := FloatToStr(FModelProduct.Balance);
  Combobox4.ItemIndex := Combobox4.Items.IndexOf(FModelProduct.Category);
  Combobox5.ItemIndex := Combobox5.Items.IndexOf(FModelProduct.UnitTypeSale);
  Edit9.Text :=  PCHAR(GUIDToString(FModelProduct.Id));
  except
    showmessage('Produto não encontrado.');
  end;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');

  if (IsValid) then
  begin
    if StrToFloat(Edit5.Text) > 0 then
    begin
      FControllerSale :=  TControllerSale.New;
      if (FControllerSale.Save(Edit9.Text, StrToFloat(Edit4.Text))) then
      begin
        showmessage('Venda realizada!');
        ClearFields();
      end;
    end else showmessage('Saldo insuficiente para vender');
  end else showmessage('Dados inválidos. Verifique por favor o campo quantidade');
end;

procedure TForm3.ClearFields();
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit9.Text := '';
  Combobox4.ItemIndex := -1;
  Combobox5.ItemIndex := -1;
end;

function TForm3.IsValid(): Boolean;
var
  verifyDouble : Double;
begin
  try
    verifyDouble := StrToFloat(Edit4.Text);
    verifyDouble := StrToFloat(Edit5.Text);
    result := true;
  except
    result := false;
  end;
end;

end.
