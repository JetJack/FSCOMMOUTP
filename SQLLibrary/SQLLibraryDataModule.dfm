object dmSQLLibrary: TdmSQLLibrary
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 269
  Width = 391
  object System: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=127.0.0.1\SQLSERVER2014'
      'DataBase=HHIS'
      'User_Name=sa'
      'Password=d8d8g2hh8'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Prepare SQL=False'
      'ConnectTimeout=60'
      'Mars_Connection=False')
    Left = 48
    Top = 48
  end
  object qryGen: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = System
    Left = 48
    Top = 120
  end
  object dspGen: TDataSetProvider
    DataSet = qryGen
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 48
    Top = 192
  end
  object qrySQL: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'SQLID'
        ParamType = ptInput
        Value = '1'
      end>
    SQL.Strings = (
      'select SQLID, ModuleName, ClassName, ProcedureName, SQLName,'
      '       SQLText, IsValid, Comment, CreateTime, Creator'
      '       from SQLLibrary'
      '    where SQLID =:SQLID')
    SQLConnection = System
    Left = 120
    Top = 48
  end
  object LocalConnection1: TLocalConnection
    Left = 240
    Top = 176
  end
  object qryNewSQLID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT next value for Seq_SQLID'
      '')
    SQLConnection = System
    Left = 240
    Top = 112
  end
  object dspSQL: TDataSetProvider
    DataSet = qrySQL
    Options = [poPropogateChanges, poUseQuoteChar]
    BeforeUpdateRecord = dspSQLBeforeUpdateRecord
    Left = 120
    Top = 120
  end
  object spNewSequence: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Size = 10
        Value = 0
      end
      item
        DataType = ftWideString
        Precision = 50
        Name = '@SeqID'
        ParamType = ptInput
        Value = 'SRApplyID'
      end
      item
        DataType = ftInteger
        Precision = 10
        Name = '@NewSeq'
        ParamType = ptInputOutput
        Size = 10
        Value = 2
      end>
    SQLConnection = System
    StoredProcName = 'get_NewSequence'
    Left = 208
    Top = 24
  end
  object deleSQL: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SQLID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'delete from SQLLibrary where SQLID = :SQLID')
    SQLConnection = System
    Left = 128
    Top = 200
  end
end
