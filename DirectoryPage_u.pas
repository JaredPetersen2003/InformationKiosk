unit DirectoryPage_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFrmDirectory = class(TForm)
    Label2: TLabel;
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnHome: TButton;
    BtnAbout: TButton;
    BtnLogin: TButton;
    procedure BtnHomeClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure OnCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDirectory: TFrmDirectory;

implementation

{$R *.dfm}

uses HomePage_U;

procedure TFrmDirectory.BtnHomeClick(Sender: TObject);
begin
  frmDirectory.Hide;
  frmHome.Show;
end;

procedure TFrmDirectory.BtnLoginClick(Sender: TObject);
begin
  frmDirectory.Hide;
  //frmLogin.Show;
end;

procedure TFrmDirectory.OnCreate(Sender: TObject);
begin
  frmDirectory.Color := rgb(52, 73, 94);
  pnlMenu.Color := rgb(225, 78, 66);
  pnlHeader.Color := rgb(108, 110, 112);
end;

end.
