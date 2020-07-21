object dmDatabase: TdmDatabase
  OldCreateOrder = False
  Height = 326
  Width = 482
  object dscPatientData: TDataSource
    DataSet = tblPatientData
    Left = 344
    Top = 112
  end
  object conCDDatabse: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\User\Docum' +
      'ents\Projects\IT PAT\Win32\Debug\User_Data.mdb;Mode=ReadWrite;Pe' +
      'rsist Security Info=False;Jet OLEDB:System database="";Jet OLEDB' +
      ':Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engin' +
      'e Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Part' +
      'ial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:Ne' +
      'w Database Password="";Jet OLEDB:Create System Database=False;Je' +
      't OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Co' +
      'mpact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet O' +
      'LEDB:SFP=False'
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 224
    Top = 144
  end
  object tblPatientData: TADOTable
    Active = True
    Connection = conCDDatabse
    CursorType = ctStatic
    TableName = 'tblPatientData'
    Left = 320
    Top = 184
  end
  object tblLoginInfo: TADOTable
    Active = True
    Connection = conCDDatabse
    CursorType = ctStatic
    TableName = 'tblLoginInfo'
    Left = 208
    Top = 240
  end
  object dscLogin: TDataSource
    DataSet = tblLoginInfo
    Left = 128
    Top = 176
  end
end
