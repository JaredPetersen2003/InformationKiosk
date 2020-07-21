unit dmUserData_U;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmDatabase = class(TDataModule)
    dscPatientData: TDataSource;
    conCDDatabse: TADOConnection;
    tblPatientData: TADOTable;
    tblLoginInfo: TADOTable;
    dscLogin: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatabase: TdmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
