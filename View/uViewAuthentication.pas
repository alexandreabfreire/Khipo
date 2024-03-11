unit uViewAuthentication;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, uControllerConnection, uIControllerUser;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Edit2: TEdit;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  FControllerUser : IControllerUser;

implementation

uses
  uControllerUser, uViewMain;

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
begin
  Edit2.SetFocus();
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
  TControllerConnection.GetInstance.daoConnection.GetConnection.Connected := true;
  if TControllerConnection.GetInstance.daoConnection.GetConnection.Connected = false then
    showmessage('Banco de dados não encontrado.');
    FControllerUser :=  TControllerUser.New(Edit2.Text, Edit1.Text);

    if (FControllerUser.Authentication(Edit2.Text, Edit1.Text)) then
    begin
      Form1.Authenticated := true;
      Form1.UserName := Edit2.Text;
    end else
      Form1.Authenticated := false;
    Form5.Close;
end;

end.
