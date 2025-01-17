program Crypter;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmCrypter},
  DCPbase64 in 'DCPbase64.pas',
  MessageDigest_5 in 'C:\Program Files\Embarcadero\RAD Studio\10.0\source\soap\wsdlimporter\MessageDigest_5.pas',
  IdHashMessageDigest in 'C:\Program Files\Embarcadero\RAD Studio\10.0\source\Indy10\Protocols\IdHashMessageDigest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCrypter, frmCrypter);
  Application.Run;
end.
