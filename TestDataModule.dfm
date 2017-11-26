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
      'SELECT [ORDER_CODE],[ORDER_NAME],[SPECS],[CLASS_CODE],[FEE_CODE]'
      
        ',[SPELL_CODE],[WB_CODE],[INPUT_CDOE],[GB_CODE],[INTERNATIONAL_CO' +
        'DE]'
      
        ',[ALIAS_NAME],[ALIAS_SPELL],[ALIAS_WB],[ENGLISH_NAME],[ENGLISH_A' +
        'LIAS]'
      
        ',[ORDER_UNIT],[ORDER_PRICE],[ORDER_PRICE2],[ORDER_PRICE3],[ORDER' +
        '_PRICE4]'
      
        ',[ORDER_PRICE5],[EXEDEPT_CODE],[VALID_STATE],[APPLY_STATE],[ITEM' +
        '_FLAG]'
      
        ',[COMB_FLAG],[SPECIAL_FLAG1],[SPECIAL_FLAG2],[SPECIAL_FLAG3],[SP' +
        'ECIAL_FLAG4]'
      ',[SPECIAL_FLAG5],[OPER_ID],[OPER_TIME]   '
      'FROM [FIN_COM_ORDER]')
    Left = 232
    Top = 144
  end
  object FDTableAdapter1: TFDTableAdapter
    SelectCommand = FDCommand1
    Left = 280
    Top = 216
  end
end
