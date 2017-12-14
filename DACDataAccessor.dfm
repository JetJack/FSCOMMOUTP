object DataAccessor: TDataAccessor
  OldCreateOrder = False
  Height = 306
  Width = 434
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 152
    Top = 72
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 160
    Top = 160
  end
  object FDCommand: TFDCommand
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 256
    Top = 80
  end
  object FDTableAdapter: TFDTableAdapter
    SelectCommand = FDCommand
    Left = 264
    Top = 144
  end
  object FDMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = FDTableAdapter
    Left = 264
    Top = 208
  end
  object FDTransaction: TFDTransaction
    Options.AutoStop = False
    Connection = conSys
    AfterCommit = FDTransactionAfterCommit
    AfterRollback = FDTransactionAfterRollback
    Left = 56
    Top = 112
  end
  object FDQuery: TFDQuery
    Transaction = FDTransaction
    Left = 56
    Top = 200
  end
  object conSys: TFDConnection
    Transaction = FDTransaction
    Left = 48
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 320
    Top = 32
  end
end
