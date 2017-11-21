unit Privilege;

interface


uses
   SysUtils, classes, Generics.Collections;

type
  TRole = class(TObject)

  end;

  TOperator = class(TObject)
  private
    FOperID: Integer;
    FAccount: String;
    FOperName: String;
    FLoginDeptCode: String;
    FLoginDeptName: String;
    FLoginTime: TDatetime;
    FRoleList: TDictionary<Integer,TRole>;
  public
    property OperID: Integer read FOperID write FOperID;
    property Account: String read FAccount write FAccount;
    property OperName: String read FOpername write FOperName;
    property LoginDeptCode: String read FLoginDeptCode write FLoginDeptCode;
    property LonginDeptName: String read FLoginDeptName write FLoginDeptName;
    property LoginTime: TDatetime read FLOginTime write FLoginTime;
    property RoleList :TDictionary<Integer,TRole> read FRoleList write FRoleList;
  end;

implementation

end.
