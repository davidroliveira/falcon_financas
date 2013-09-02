object DM: TDM
  OldCreateOrder = False
  Height = 208
  Width = 279
  object ConexaoFiredac: TADConnection
    Params.Strings = (
      'Database=falcon'
      'User_Name=falcon'
      'Password=v8n1g2a1'
      'Server=localhost'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object WaitCursor: TADGUIxWaitCursor
    Left = 40
    Top = 128
  end
  object MySQLDriverLink: TADPhysMySQLDriverLink
    Left = 40
    Top = 71
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=falcon'
      'User_Name=falcon'
      'Password=v8n1g2a1'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Connected = True
    Left = 184
    Top = 24
  end
end
