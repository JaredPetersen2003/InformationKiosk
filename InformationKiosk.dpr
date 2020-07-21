program InformationKiosk;

uses
  Vcl.Forms,
  HomePage_U in 'HomePage_U.pas' {frmHome},
  LoginPage_U in 'LoginPage_U.pas' {frmLogin},
  RegistrationPage_U in 'RegistrationPage_U.pas' {frmRegisterPatient},
  dmUserData_U in 'dmUserData_U.pas' {dmDatabase: TDataModule},
  LocatePatient_U in 'LocatePatient_U.pas' {frmLocatePatient},
  DirectoryPage_u in 'DirectoryPage_u.pas' {FrmDirectory},
  Appointments_U in 'Appointments_U.pas' {frmAppointments},
  AdminPage_U in 'AdminPage_U.pas' {frmAdmin},
  EditRecords_U in 'EditRecords_U.pas' {frmEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmRegisterPatient, frmRegisterPatient);
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfrmLocatePatient, frmLocatePatient);
  Application.CreateForm(TFrmDirectory, FrmDirectory);
  Application.CreateForm(TfrmAppointments, frmAppointments);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmEdit, frmEdit);
  Application.Run;
end.
