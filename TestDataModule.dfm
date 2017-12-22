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
      'SELECT A.FILE_NO,MED_REDCORD_NO,NAME,BIRTHDAY,SEX_CODE'
      ' ,IDENNO,IDCARDTYPE,BLOOD_CODE,RH_CODE,PROF_CODE'
      ' ,DISTRICT,COUN_CODE,NATION_CODE,MARI,WORK_ADDRESS'
      ' ,WORK_TEL,WORK_ZIP,CURRENT_ADDRESS,HOME_ADDRESS,HOME_TEL'
      ' ,HOME_ZIP,RELA_CODE,LINKMAN_NAME,LINKMAN_TEL,LINKMAN_ADD'
      
        ' ,EMAIL,MONTHER_NAME,A.VALID_STATE,OPER_ID,OPER_TIME,B.CARD_TYPE' +
        ','
      #9'B.CARD_NO'
      'FROM COM_PATIENTINFO A,COM_PATIENT_CARDKEEP B'
      '  WHERE A.FILE_NO = B.FILE_NO'
      '   AND B.VALID_STATE = '#39'1'#39
      '   AND B.CARD_TYPE = '#39'01'#39
      '   AND B.CARD_NO = '#39'12345'#39)
    Left = 232
    Top = 144
  end
  object FDTableAdapter1: TFDTableAdapter
    DatSTableName = 'cdsPatientInfo'
    SelectCommand = FDCommand1
    Left = 280
    Top = 216
  end
end
