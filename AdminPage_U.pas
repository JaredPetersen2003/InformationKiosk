unit AdminPage_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, RegistrationPage_U;

type
  TfrmAdmin = class(TForm)
    Label4: TLabel;
    ShpUnderline: TShape;
    Label2: TLabel;
    Panel4: TPanel;
    Image3: TImage;
    Label3: TLabel;
    LblUser: TLabel;
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnSwitchUser: TButton;
    BtnLogout: TButton;
    Label7: TLabel;
    Shape1: TShape;
    Panel5: TPanel;
    imgRegisterPatient: TImage;
    Label5: TLabel;
    Shape2: TShape;
    Panel1: TPanel;
    imgEdit: TImage;
    procedure OnShow(Sender: TObject);
    procedure imgRegisterPatientClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSwitchUserClick(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
    procedure imgEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

{$R *.dfm}

uses LoginPage_U, HomePage_U, EditRecords_U;

procedure TfrmAdmin.BtnLogoutClick(Sender: TObject);
begin
  frmAdmin.Hide;
  frmHome.show;
end;

procedure TfrmAdmin.BtnSwitchUserClick(Sender: TObject);
begin
   frmAdmin.Hide;
   frmLogin.Show;
end;

procedure TfrmAdmin.FormCreate(Sender: TObject);
begin
  frmAdmin.Color := rgb(52, 73, 94);
  pnlMenu.Color := rgb(225, 78, 66);
  pnlHeader.Color := rgb(108, 110, 112);
end;

procedure TfrmAdmin.imgEditClick(Sender: TObject);
begin
  frmAdmin.Hide;
  frmEdit.Show;
end;

procedure TfrmAdmin.imgRegisterPatientClick(Sender: TObject);
begin
  frmAdmin.Hide;
  frmRegisterPatient.Show;
end;


procedure TfrmAdmin.OnShow(Sender: TObject);
begin
lblUser.Caption:= frmLogin.sCurrentUser;
end;

end.
