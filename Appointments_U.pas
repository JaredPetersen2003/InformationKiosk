unit Appointments_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.WinXPickers, RegistrationPage_U,
  LoginPage_U, dmUserData_U;

type
  TfrmAppointments = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    ShpUnderline: TShape;
    Shape5: TShape;
    EdtName: TEdit;
    cmbGender: TComboBox;
    dtpDOB: TDatePicker;
    EdtSurname: TEdit;
    EdtPhoneNr: TEdit;
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnHome: TButton;
    BtnAbout: TButton;
    BtnLogin: TButton;
    ClnDate: TMonthCalendar;
    Button1: TButton;
    cmbSymptoms: TComboBox;
    shpOther: TShape;
    edtOther: TEdit;
    Label3: TLabel;
    lblOther: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure onCreate(Sender: TObject);
    procedure OnEnter(Sender: TObject);
    procedure OnExit(Sender: TObject);
    procedure BtnHomeClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure SelectOther(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppointments: TfrmAppointments;

implementation

{$R *.dfm}

uses HomePage_U;

procedure TfrmAppointments.BtnHomeClick(Sender: TObject);
begin
  frmAppointments.Hide;
  frmHome.Show;
end;

procedure TfrmAppointments.BtnLoginClick(Sender: TObject);
begin
  frmAppointments.Hide;
  frmLogin.Show;
end;

procedure TfrmAppointments.Button1Click(Sender: TObject);
var
  tAppointments: Textfile;
  sName, sDOB, sGender, sDate, sReason: string;
  iPhonenr: integer;
begin
  // save information to a textfile
  AssignFile(tAppointments,
    'Appointments.txt');
  sName := 'Name: ' + EdtName.Text + ' ' + EdtSurname.Text;
  sDOB := ', Date of Birth: ' + DatetoStr(dtpDOB.Date);
  sDate := ', Appointment Date: ' + DatetoStr(ClnDate.Date);
  sGender := ', Gender: ' + cmbGender.Text;
  if cmbSymptoms.Text = 'Other' then
  begin
    sReason := ', ' + edtOther.Text;
  end
  else
    sReason := ', ' + cmbSymptoms.Text;
  append(tAppointments);
  Writeln(tAppointments, sName + sGender + sDOB + sDate + sReason);
  closefile(tAppointments);
  showmessage('Your appointment has been booked!');
end;

procedure TfrmAppointments.onCreate(Sender: TObject);
begin
  // Changes the colour of various components
  pnlMenu.Color := rgb(225, 78, 66);
  PnlHeader.Color := rgb(108, 110, 112);
  frmAppointments.Color := rgb(52, 73, 94);
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

procedure TfrmAppointments.OnEnter(Sender: TObject);
begin
  // Changes edit box colour when focused
  if EdtName.Focused then
    EdtName.Color := rgb(72, 73, 110);
  if EdtSurname.Focused then
    EdtSurname.Color := rgb(72, 73, 110);
  if EdtPhoneNr.Focused then
    EdtPhoneNr.Color := rgb(72, 73, 110);
  if edtOther.Focused then
    edtOther.Color := rgb(72, 73, 110);

end;

procedure TfrmAppointments.OnExit(Sender: TObject);
begin
  // Reverses colour change
  if EdtName.Focused = False then
    EdtName.Color := rgb(52, 73, 94);
  if EdtSurname.Focused = False then
    EdtSurname.Color := rgb(52, 73, 94);
  if EdtPhoneNr.Focused = False then
    EdtPhoneNr.Color := rgb(52, 73, 94);
  if edtOther.Focused = False then
    edtOther.Color := rgb(52, 73, 94);
end;

procedure TfrmAppointments.SelectOther(Sender: TObject);
begin
  if cmbSymptoms.Text = 'Other' then
  begin
    edtOther.Visible := True;
    shpOther.Visible := True;
    lblOther.Visible := True;
  end;
  if cmbSymptoms.Text <> 'Other' then
  begin
    edtOther.Visible := False;
    shpOther.Visible := False;
    lblOther.Visible := False;
  end;
end;

end.
