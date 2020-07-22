unit RegistrationPage_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPickers, Vcl.Samples.Spin, dmUserData_U;

type
  TfrmRegisterPatient = class(TForm)
    Label2: TLabel;
    EdtName: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cmbGender: TComboBox;
    dtpDOB: TDatePicker;
    Label8: TLabel;
    Shape1: TShape;
    EdtSurname: TEdit;
    Shape2: TShape;
    EdtPhoneNr: TEdit;
    Shape3: TShape;
    Shape4: TShape;
    ShpUnderline: TShape;
    Shape5: TShape;
    Label3: TLabel;
    Label5: TLabel;
    spnFloorNr: TSpinEdit;
    SpnRoomNr: TSpinEdit;
    Button1: TButton;
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnSwitchUser: TButton;
    BtnLogout: TButton;
    Button2: TButton;
    procedure OnCreate(Sender: TObject);
    procedure OnEnter(Sender: TObject);
    procedure OnExit(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
    procedure BtnHomeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegisterPatient: TfrmRegisterPatient;

implementation

uses LoginPage_U, HomePage_U, AdminPage_U,
  Appointments_U;

{$R *.dfm}

procedure TfrmRegisterPatient.BtnHomeClick(Sender: TObject);
begin
  frmRegisterPatient.Hide;
  frmHome.Show;
end;

procedure TfrmRegisterPatient.BtnLogoutClick(Sender: TObject);
begin
  frmRegisterPatient.Hide;
  frmHome.Show;
end;

procedure TfrmRegisterPatient.Button1Click(Sender: TObject);
var
  sName, sSurname, sGender, sNumber: string;
  iPhoneNr, iLength: integer;
begin
  sName := EdtName.Text;
  sSurname := EdtSurname.Text;
  sGender := cmbGender.Text;
  sNumber := EdtPhoneNr.Text;
  //error catching
  try
    StrToInt(sNumber);
  except
    showmessage(sNumber + ' is not a valid phone number');
    exit;
  end;
  iPhoneNr := StrToInt(EdtPhoneNr.Text);
  if (sName <> '') or (sSurname <> '') or
    (sGender <> 'Please select your gender') or (iPhoneNr = null) then
  begin
    iLength := length(sNumber);
    if iLength <> 10 then
    begin
      showmessage('Please input a valid phone number');
    end
    else
    begin
      //adds information to the database
      dmDatabase.tblPatientData.Insert;
      dmDatabase.tblPatientData['Patient Name'] := EdtName.Text;
      dmDatabase.tblPatientData['Patient Surname'] := EdtSurname.Text;
      dmDatabase.tblPatientData['Gender'] := cmbGender.Text;
      dmDatabase.tblPatientData['Date of Birth'] := datetostr(dtpDOB.Date);
      dmDatabase.tblPatientData['Phone Number'] := EdtPhoneNr.Text;
      dmDatabase.tblPatientData['Floor Number'] := spnFloorNr.Value;
      dmDatabase.tblPatientData['Room Number'] := SpnRoomNr.Value;
      dmDatabase.tblPatientData.Post;
    end;
  end
  else
    showmessage('Please enter all details');
end;

procedure TfrmRegisterPatient.Button2Click(Sender: TObject);
begin
  frmRegisterPatient.Hide;
  frmAdmin.Show;
end;

procedure TfrmRegisterPatient.OnCreate(Sender: TObject);
begin
  // Changes the colour of various components
  pnlMenu.Color := rgb(225, 78, 66);
  PnlHeader.Color := rgb(108, 110, 112);
  frmRegisterPatient.Color := rgb(52, 73, 94);
  EdtName.Color := rgb(52, 73, 94);
  EdtSurname.Color := rgb(52, 73, 94);
  EdtPhoneNr.Color := rgb(52, 73, 94);
  dtpDOB.Color := rgb(52, 73, 94);
  dtpDOB.PopupColor := rgb(52, 73, 94);
  dtpDOB.HotColor := rgb(72, 73, 110);
  cmbGender.Color := rgb(52, 73, 94);
  ShpUnderline.Brush.Color := rgb(225, 78, 66);
  ShpUnderline.Pen.Color := rgb(225, 78, 66);
end;

procedure TfrmRegisterPatient.OnEnter(Sender: TObject);
begin
  // Changes edit box colour when focused
  if EdtName.Focused then
    EdtName.Color := rgb(72, 73, 110);
  if EdtSurname.Focused then
    EdtSurname.Color := rgb(72, 73, 110);
  if EdtPhoneNr.Focused then
    EdtPhoneNr.Color := rgb(72, 73, 110);
end;

procedure TfrmRegisterPatient.OnExit(Sender: TObject);
begin
  // Reverses colour change
  if EdtName.Focused = False then
    EdtName.Color := rgb(52, 73, 94);
  if EdtSurname.Focused = False then
    EdtSurname.Color := rgb(52, 73, 94);
  if EdtPhoneNr.Focused = False then
    EdtPhoneNr.Color := rgb(52, 73, 94);
end;

end.
