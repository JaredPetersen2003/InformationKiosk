unit HomePage_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, LoginPage_U, Vcl.Mask,
  LocatePatient_U, Appointments_U;

type
  TfrmHome = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    Panel4: TPanel;
    Image3: TImage;
    Panel5: TPanel;
    imgLocatePatient: TImage;
    Label8: TLabel;
    Image7: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnAbout: TButton;
    BtnLogin: TButton;
    Button1: TButton;
    procedure BtnLoginClick(Sender: TObject);
    procedure OnCreate(Sender: TObject);
    procedure ImgLocatePatientClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}
uses RegistrationPage_U;

procedure TfrmHome.BtnLoginClick(Sender: TObject);
begin
  frmHome.Hide;
  frmLogin.Show;
end;


procedure TfrmHome.Button1Click(Sender: TObject);
begin
frmHome.Hide;
frmRegisterPatient.show;
end;

procedure TfrmHome.Image3Click(Sender: TObject);
begin
  frmHome.Hide;
  frmAppointments.Show;
end;

procedure TfrmHome.ImgLocatePatientClick(Sender: TObject);
begin
  frmHome.Hide;
  frmLocatePatient.Show;
end;

procedure TfrmHome.OnCreate(Sender: TObject);
begin
  //Changes the colour of various components
  frmHome.Color := rgb(52, 73, 94);
  frmHome.Label6.Font.Color := rgb(217, 62, 61);
  pnlMenu.Color := rgb(225, 78, 66);
  pnlHeader.Color := rgb(108, 110, 112);
end;

end.
