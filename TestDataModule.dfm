object dmTest: TdmTest
  OldCreateOrder = False
  Height = 279
  Width = 395
  object conSys: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Database=HHIS'
      'Server=127.0.0.1\SQLSERVER2014'
      'User_Name=sa'
      'Password=d8d8g2hh8')
    Connected = True
    LoginPrompt = False
    Left = 160
    Top = 112
  end
  object FDCommand1: TFDCommand
    Connection = conSys
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    CommandText.Strings = (
      
        'SELECT D.FIN_TYPE, D.INSU_ITEM_CODE, D.INSU_ITEM_NAME, D.INSU_DO' +
        'SAGE_FORM, A.ORDER_CODE,'
      
        '       A.ORDER_NAME, A.SPECS, A.ORDER_UNIT, A.ORDER_PRICE2,D.BAS' +
        'E_MED_TYPE,'
      #9'   D.BASE_MED_RATE, D.COM_OUTP_RATE, A.VALID_STATE'
      'FROM FIN_COM_ORDER A'
      'LEFT JOIN'
      '(SELECT B.ORDER_CODE, C.*'
      ' FROM FIN_COM_ORDER_RELATE B, COM_INSU_ITEM C'
      ' WHERE B.INSU_ITEM_CODE = C.INSU_ITEM_CODE'
      
        '   AND B.INTERFACE_TYPE = '#39'FSSI'#39') D ON D.ORDER_CODE = A.ORDER_CO' +
        'DE'
      '   ORDER BY A.ORDER_CODE')
    Left = 232
    Top = 144
  end
  object FDTableAdapter1: TFDTableAdapter
    SelectCommand = FDCommand1
    Left = 280
    Top = 216
  end
end
