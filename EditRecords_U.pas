unit EditRecords_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, dmUserData_U,
  RegistrationPage_U,
  LoginPage_U, HomePage_U, Vcl.Menus, System.UITypes;

type
  TfrmEdit = class(TForm)
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnSwitchUser: TButton;
    BtnLogout: TButton;
    Button2: TButton;
    dbgPatients: TDBGrid;
    Button1: TButton;
    Button4: TButton;
    Label4: TLabel;
    ShpUnderline: TShape;
    Label2: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    EdtName: TEdit;
    EdtSurname: TEdit;
    btnSearch: TButton;
    cmbSort: TComboBox;
    btnSwitch: TButton;
    dbgAdmins: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure MakeActive(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure onCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnSwitchUserClick(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure SortBy(Sender: TObject);
    procedure btnSwitchClick(Sender: TObject);
  private
    { Private declarations }
  var
    isSwitched: Boolean;

  public
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation

{$R *.dfm}

uses AdminPage_u;

procedure TfrmEdit.BtnLogoutClick(Sender: TObject);
begin
  frmEdit.Hide;
  frmHome.Show;
end;

procedure TfrmEdit.btnSearchClick(Sender: TObject);
var
  sName, sSurname: string;
  iRoomNr: integer;
begin
  sName := EdtName.Text;
  sSurname := EdtSurname.Text;
  if (dmDatabase.tblPatientData.locate('Patient Name', sName, [])) and
    (dmDatabase.tblPatientData.locate('Patient Surname', sSurname, [])) then
  begin
    // get room number of patient
    iRoomNr := dmDatabase.tblPatientData['Room Number'];
    showmessage('Patient is in room ' + inttostr(iRoomNr));
  end
  else
    showmessage('Patient not found');
end;

procedure TfrmEdit.BtnSwitchUserClick(Sender: TObject);
begin
  frmEdit.Hide;
  frmLogin.Show;
end;

procedure TfrmEdit.Button1Click(Sender: TObject);
var
  buttonSelected: integer;
begin
  // Show a custom dialog
  buttonSelected := messagedlg('Are you sure you want to delete this record?',
    mtCustom, [mbYes, mbNo], 0);

  // Show the button type selected
  if buttonSelected = mrYes then
  begin
    dmDatabase.tblPatientData.Delete;
    showmessage('Record Deleted!');
  end;
  if buttonSelected = mrNo then
    showmessage('Canceled!');
end;

procedure TfrmEdit.Button2Click(Sender: TObject);
begin
  frmEdit.Hide;
  frmAdmin.Show;
end;

procedure TfrmEdit.btnSwitchClick(Sender: TObject);
var
  iCount, iC: integer;
begin
  iC := 1;
  if isSwitched = False then
  begin
    dbgPatients.DataSource := dmDatabase.dscLogin;

    dbgPatients.DataSource.DataSet.Close;
    dbgPatients.DataSource.DataSet := dmDatabase.tblLoginInfo;
    dbgPatients.Columns.RebuildColumns;
    iCount := dbgPatients.Columns.Count;
    showmessage(inttostr(iCount));
    while not iCount = 3 do
    begin
      dbgPatients.Columns[iC].Width := 100;
      inc(iC);
    end;
    dbgPatients.DataSource.DataSet.Open;
    dbgPatients.DataSource.DataSet.Refresh;
    isSwitched := True;
  end
  else
  begin
    dbgPatients.DataSource := dmDatabase.dscPatientData;
    isSwitched := False;
    iCount := dbgPatients.Columns.Count;
    showmessage(inttostr(iCount));
    showmessage(inttostr(iC));
    while iC <> iCount do
    begin
      dbgPatients.Columns[iC].Width := 100;
      inc(iC);
    end;
  end;
end;

procedure TfrmEdit.Button4Click(Sender: TObject);
begin
  frmEdit.Hide;
  frmRegisterPatient.Show;
end;

procedure TfrmEdit.MakeActive(Sender: TObject);
begin
  if not dmDatabase.tblPatientData.Active then
    dmDatabase.tblPatientData.Open;
end;

procedure TfrmEdit.onCreate(Sender: TObject);
begin
  frmEdit.Color := rgb(52, 73, 94);
  pnlMenu.Color := rgb(225, 78, 66);
  PnlHeader.Color := rgb(108, 110, 112);
  isSwitched := False;
end;

procedure TfrmEdit.SortBy(Sender: TObject);
begin
  if cmbSort.Text = 'Name' then
    dmDatabase.tblPatientData.Sort := '[Patient Name] ASC';
  if cmbSort.Text = 'Surname' then
    dmDatabase.tblPatientData.Sort := '[Patient Surname] ASC';
  if cmbSort.Text = 'Room Number' then
    dmDatabase.tblPatientData.Sort := '[Room Number] ASC';

end;

end.
