unit uViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IniFiles,
  uControllerConnection, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Stan.Intf, FireDAC.Comp.Client,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, uModelProduct,
  uControllerUser, uIControllerProduct, uIControllerSale, uIControllerEntry,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image1: TImage;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button11Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public
    Authenticated : Boolean;
    UserName : String;
  end;


var
  Form1: TForm1;
  FControllerProduct: IControllerProduct;
  FControllerSale: IControllerSale;
  FControllerEntry : IControllerEntry;
  ControllerUser : TControllerUser;
implementation

uses
  uControllerProduct, uControllerSale, uControllerEntry, uViewProduct,
  uViewSale, uViewEntry, uViewAuthentication;

{$R *.dfm}


procedure TForm1.Button11Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Destroy;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form5.showmodal;
  if (not Authenticated) then
  begin
    showmessage('Credenciais não encontradas');
    Application.Terminate;
  end;
  Label1.Caption := 'Usuário ' + UserName;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Form2.showmodal;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Form3.showmodal;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Form4.showmodal;
end;

end.
