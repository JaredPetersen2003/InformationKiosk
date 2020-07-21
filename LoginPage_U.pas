unit LoginPage_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, AdminPage_U, LocatePatient_U, dmUserData_U;

type
  TfrmLogin = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    Image1: TImage;
    Shape2: TShape;
    EdtPassword: TEdit;
    Image3: TImage;
    Shape1: TShape;
    EdtUsername: TEdit;
    chkPassword: TCheckBox;
    Label4: TLabel;
    ShpUnderline: TShape;
    PnlHeader: TPanel;
    ImgLogo: TImage;
    Label1: TLabel;
    LblPhoneNr: TLabel;
    LblVisitHr: TLabel;
    pnlMenu: TPanel;
    BtnHome: TButton;
    BtnAbout: TButton;
    procedure OnCreate(Sender: TObject);
    procedure chkPasswordClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BtnHomeClick(Sender: TObject);
    procedure OnEnterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    sCurrentUser: string;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses HomePage_u;

Function VigenereEncrypt(sSource, sKey: String;
  iTableSize: Integer = 94): String;
var
  i, iPosText, iPosKey: Integer;
  sTable: string;
begin
  // Create our Cipher Table
  i := 32;
  While i <= (iTableSize + 32) do
  Begin
    sTable := sTable + Chr(i);
    inc(i);
  end;
  // Make the key the same size or greater than the Source
  while Length(sSource) >= Length(sKey) do
    sKey := (sKey + sKey);
  // Remove Line Feed & Carrage Returns from Cipher
  i := 0;
  while i <= Length(sSource) do
    if (sSource[i] = Chr(10)) or (sSource[i] = Chr(13)) then
      Delete(sSource, i, 1)
    else
      inc(i);

  // Vegenere Encryption
  i := 1;
  while i <= Length(sSource) do
  Begin
    iPosText := pos(sSource[i], sTable) - 1;
    iPosKey := pos(sKey[i], sTable) - 1;
    Result := Result + sTable[((iPosText + iPosKey) mod iTableSize) + 1];
    inc(i);
  end;

end;

function LogIn: Boolean;
var
  sPassword: string;
begin
  // Checks if Database is open and Username and password matches
  if not dmDatabase.tblLoginInfo.Active then
    dmDatabase.tblLoginInfo.Open;
  Result := dmDatabase.tblLoginInfo.Locate('Doctor ID',
    frmLogin.EdtUsername.Text, []);
  sPassword := VigenereEncrypt(frmLogin.EdtPassword.Text,
    'loremipsumdolorsitametconsecteturadipiscinge');
  Result := Result and (sPassword = dmDatabase.tblLoginInfo.FieldByName
    ('Password').AsString);
  if Result then
  begin
    frmLogin.sCurrentUser := frmLogin.EdtUsername.Text;
    showmessage('Login Complete!');
    frmLogin.EdtUsername.Clear;
    frmLogin.EdtPassword.Clear;
    frmLogin.Hide;
    frmAdmin.Show;
  end;
  if not Result then
    showmessage('Login Failed!');
end;

procedure Check;
begin
  if frmLogin.EdtUsername.Text = '' then
    showmessage('Please enter Doctor ID');
  if frmLogin.EdtPassword.Text = '' then
    showmessage('Please enter Password');

  // Initiates login Fuction
  if (frmLogin.EdtUsername.Text <> '') and (frmLogin.EdtPassword.Text <> '')
  then
    LogIn;
end;

procedure TfrmLogin.BtnHomeClick(Sender: TObject);
begin
  frmLogin.Hide;
  frmHome.Show;
end;

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
  frmLogin.Hide;
  frmLocatePatient.Show;
end;

procedure TfrmLogin.Button4Click(Sender: TObject);
begin
   Check;
end;

procedure TfrmLogin.chkPasswordClick(Sender: TObject);
begin
  // Hides/Shows password
  if chkPassword.Checked = True then
    EdtPassword.PasswordChar := #0;
  if chkPassword.Checked = False then
    EdtPassword.PasswordChar := '*';
end;


procedure TfrmLogin.OnCreate(Sender: TObject);
begin
  // Changes the colour of various components
  pnlMenu.Color := rgb(225, 78, 66);
  PnlHeader.Color := rgb(108, 110, 112);
  frmLogin.Color := rgb(52, 73, 94);
  EdtUsername.Color := rgb(52, 73, 94);
  EdtPassword.Color := rgb(52, 73, 94);
  ShpUnderline.Brush.Color := rgb(225, 78, 66);
  ShpUnderline.Pen.Color := rgb(225, 78, 66);
end;

procedure TfrmLogin.OnEnterKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then //Begins login process if enter key is pressed
  begin
    Key := #0; // prevent beeping
    check;
  end;
end;

end.
