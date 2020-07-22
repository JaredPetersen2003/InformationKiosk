unit LocatePatient_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmUserData_U, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RegistrationPage_U,
  DirectoryPage_U;

type
  TfrmLocatePatient = class(TForm)
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnHome: TButton;
    BtnAbout: TButton;
    BtnLogin: TButton;
    Label2: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    EdtName: TEdit;
    EdtSurname: TEdit;
    btnSearch: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ShpUnderline: TShape;
    procedure OnCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BtnHomeClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure search(sName, sSurname: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocatePatient: TfrmLocatePatient;

implementation

{$R *.dfm}

uses HomePage_u, LoginPage_U;

procedure TfrmLocatePatient.search(sName, sSurname: string);
var
iRoomNr: integer;
begin
  //checks if patient exists
  if (dmDatabase.tblPatientData.locate('Patient Name', sName, [])) and
    (dmDatabase.tblPatientData.locate('Patient Surname', sSurname, [])) then
  begin
    // get room number of patient
    iRoomNr:= dmDatabase.tblPatientData['Room Number'];
    showmessage('Patient is in room ' + inttostr(iRoomNr));
  end
  else
    showmessage('Patient not found');
end;

procedure TfrmLocatePatient.BtnHomeClick(Sender: TObject);
begin
  frmLocatePatient.Hide;
  frmHome.Show;
end;

procedure TfrmLocatePatient.BtnLoginClick(Sender: TObject);
begin
  frmLocatePatient.Hide;
  frmLogin.Show;
end;

procedure TfrmLocatePatient.btnSearchClick(Sender: TObject);
begin
  search(edtName.Text, edtSurname.Text);
end;


procedure TfrmLocatePatient.Label4Click(Sender: TObject);
begin
  frmLocatePatient.Hide;
  frmDirectory.Show;
end;

procedure TfrmLocatePatient.OnCreate(Sender: TObject);
begin
  //opens database if not active
  if not dmDatabase.tblPatientData.Active then
    dmDatabase.tblPatientData.Open;
  // Changes the colour of various components
  frmLocatePatient.Color := rgb(52, 73, 94);
  pnlMenu.Color := rgb(225, 78, 66);
  PnlHeader.Color := rgb(108, 110, 112);
  EdtName.Color := rgb(52, 73, 94);
  EdtSurname.Color := rgb(52, 73, 94);
end;

end.
