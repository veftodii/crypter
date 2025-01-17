unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMemo, cxLabel, Vcl.ExtCtrls, cxGroupBox, cxRadioGroup, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC,
  dxSkinsForm, cxSplitter, Types, cxCheckBox;

type
  TfrmCrypter = class(TForm)
    cxMemoSource: TcxMemo;
    btnEncode: TcxButton;
    btnDecode: TcxButton;
    cxMemoResult: TcxMemo;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    rbtnBase64: TcxRadioButton;
    cxLabel3: TcxLabel;
    PanelSource: TPanel;
    PanelResult: TPanel;
    cxTabControl1: TcxTabControl;
    dxSkinController1: TdxSkinController;
    cxTabControl2: TcxTabControl;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    rbtnMD5: TcxRadioButton;
    rbtnMD5Indy10: TcxRadioButton;
    cxMemoStatus: TcxMemo;
    cxCheckBox1: TcxCheckBox;
    procedure btnEncodeClick(Sender: TObject);
    procedure btnDecodeClick(Sender: TObject);
    procedure rbtnMD5Click(Sender: TObject);
    procedure rbtnBase64Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxMemoStatusEditing(Sender: TObject; var CanEdit: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCrypter: TfrmCrypter;

implementation

{$R *.dfm}

{ USES:
($BDS)\source\soap\wsdlimporter\MessageDigest_5;
($BDS)\source\Indy10\Protocols\IdHashMessageDigest;
}

uses DCPbase64, MessageDigest_5, IdHashMessageDigest;

{$REGION 'PROTOTYPES'}
//function GetMD5Hash(const AValue: string): string;
//function GetMD5HashIndy10(const AValue: string): string;
{$ENDREGION}

{$REGION 'DECLARATIONS'}
{ MessageDigest_5 }
function GetMD5Hash(const AValue: string): string;
var
  AMD5: IMD5;
begin
  AMD5 := GetMD5;
  AMD5.Init;
  AMD5.Update(TByteDynArray(RawByteString(AValue)), Length(AValue));
	Result := AMD5.AsString;
end;

{ Indy10 }
function GetMD5HashIndy10(const AValue: string): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Result := idmd5.HashStringAsHex(AValue);
  finally
    idmd5.Free;
  end;
end;
{$ENDREGION}

procedure TfrmCrypter.btnDecodeClick(Sender: TObject);
begin
  if rbtnBase64.Checked then
  begin
    cxMemoResult.Clear;
    cxMemoResult.Text := Base64DecodeStr(cxMemoSource.Text);
  end;
end;

procedure TfrmCrypter.btnEncodeClick(Sender: TObject);
begin
  cxMemoResult.Clear;
  if rbtnBase64.Checked then
  begin
    cxMemoResult.Text := Base64EncodeStr(cxMemoSource.Text);
  end
  else if rbtnMD5.Checked then
  begin
    cxMemoResult.Text := GetMD5Hash(cxMemoSource.Text);
    if cxCheckBox1.Checked then
    begin
      cxMemoStatus.Clear;
      if cxMemoResult.Text = GetMD5HashIndy10(cxMemoSource.Text) then
      begin
        cxMemoStatus.Style.TextColor := clGreen;
        cxMemoStatus.Text := 'Equal';
      end
      else
      begin
        cxMemoStatus.Style.TextColor := RGB(236,0,0);
        cxMemoStatus.Text := 'Different !';
      end;
    end;
  end
  else if rbtnMD5Indy10.Checked then
  begin
    cxMemoResult.Text := GetMD5HashIndy10(cxMemoSource.Text);
    if cxCheckBox1.Checked then
    begin
      cxMemoStatus.Clear;
      if cxMemoResult.Text = GetMD5Hash(cxMemoSource.Text) then
      begin
        cxMemoStatus.Style.TextColor := clGreen;
        cxMemoStatus.Text := 'Equal';
      end
      else
      begin
        cxMemoStatus.Style.TextColor := RGB(236,0,0);
        cxMemoStatus.Text := 'Different !';
      end;
    end;
  end;
end;

procedure TfrmCrypter.cxMemoStatusEditing(Sender: TObject; var CanEdit: Boolean);
begin
  CanEdit := false;
end;

procedure TfrmCrypter.FormShow(Sender: TObject);
begin
  if not rbtnBase64.Checked then
    rbtnBase64.Checked := true;
end;

procedure TfrmCrypter.rbtnBase64Click(Sender: TObject);
begin
  btnDecode.Enabled := true;
  cxCheckBox1.Visible := false;
  cxMemoStatus.Visible := false;
  cxMemoStatus.Clear;
end;

procedure TfrmCrypter.rbtnMD5Click(Sender: TObject);
begin
  btnDecode.Enabled := false;
  cxCheckBox1.Visible := true;
  cxMemoStatus.Visible := true;
  cxMemoStatus.Clear;
end;

end.
