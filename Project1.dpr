program Project1;

uses
  Vcl.Forms,
  uViewMain in 'View\uViewMain.pas' {Form1},
  uControllerConnection in 'Controller\uControllerConnection.pas',
  uDAOConnection in 'DAO\uDAOConnection.pas',
  uModelProduct in 'Modal\uModelProduct.pas',
  uDAOProduct in 'DAO\uDAOProduct.pas',
  uControllerProduct in 'Controller\uControllerProduct.pas',
  uModelEntry in 'Modal\uModelEntry.pas',
  uDAOEntry in 'DAO\uDAOEntry.pas',
  uControllerEntry in 'Controller\uControllerEntry.pas',
  uModelSale in 'Modal\uModelSale.pas',
  uDAOSale in 'DAO\uDAOSale.pas',
  uControllerSale in 'Controller\uControllerSale.pas',
  uIDAOProduct in 'DAO\Contract\uIDAOProduct.pas',
  uIDAOSale in 'DAO\Contract\uIDAOSale.pas',
  uIDAOEntry in 'DAO\Contract\uIDAOEntry.pas',
  uModelUser in 'Modal\uModelUser.pas',
  uDAOUser in 'DAO\uDAOUser.pas',
  uIDAOUser in 'DAO\Contract\uIDAOUser.pas',
  uControllerUser in 'Controller\uControllerUser.pas',
  uIControllerProduct in 'Controller\Contract\uIControllerProduct.pas',
  uIControllerSale in 'Controller\Contract\uIControllerSale.pas',
  uIControllerEntry in 'Controller\Contract\uIControllerEntry.pas',
  uViewProduct in 'View\uViewProduct.pas' {Form2},
  uViewSale in 'View\uViewSale.pas' {Form3},
  uViewEntry in 'View\uViewEntry.pas' {Form4},
  uViewAuthentication in 'View\uViewAuthentication.pas' {Form5},
  uIControllerUser in 'Controller\Contract\uIControllerUser.pas';

{$R *.res}

begin
//  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
