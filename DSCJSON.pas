unit DSCJSON;

(*
作者: 刘志林
最后修改日期: 2016-08-17
版本: 1.3

修改历史:
  2017-10-21  修改者：霍杰
    修改压缩配置类型TConfig为TSevenZIPConfig
    把 JSONToDataset和DatasetToJSON两个方法封装到TDSCJSONTools类中
    根据DELPHI支持的字段类型细化了转换类型
    把TFDMemTable的Delta包解析为SQL字符串的方法
  1.3
    去掉字符编码配置, 去掉二进制编码配置
    增加对二进制字段压缩的支持(使用7-ZIP)
    优化了一些代码结构
  1.2
    支持QJSON
    增加SYSTEM.JSON单元支持(D10中新单元, 就是原有的DBXJSON)
  1.1
    支持FireDAC
    增加DBXJSON单元支持
    增加对NULL值字段支持
  1.0:
    支持ADO/ClientDataset与JSON互相转换
    使用SuperObject单元作为JSON解析单元

联系方式: lzl_17948876@hotmail.com

!!! 若有修改,请通知作者,谢谢合作 !!!
*)

{$DEFINE FIREDAC}
//{$DEFINE ADO}

{$DEFINE QJSON}
//{$DEFINE JSON_SO}
//{$DEFINE JSON_DBX}
//{$DEFINE JSON_SYS}
{$IF DEFINED(JSON_DBX) OR DEFINED(JSON_SYS)}
  {$DEFINE SYSJSON}
{$ENDIF}

//{$DEFINE 7ZIP}

interface

uses
  SysUtils, Classes, DB, DBClient, DateUtils, FireDAC.Comp.Client, FireDAC.DatS,System.JSON,
  System.Variants
{$IFDEF JSON_DBX}
  , DBXJSON
{$ENDIF}
{$IFDEF JSON_SO}
  , superobject, Variants
{$ENDIF}
{$IFDEF FIREDAC}
  , FireDAC.Comp.DataSet
{$ENDIF}
{$IFDEF JSON_SYS}
  , System.JSON
{$ENDIF}
{$IFDEF QJSON}
  , QJSON
{$ENDIF}
{$IFDEF ADO}
  , ADODB
{$ENDIF}
  , EncdDecd;

type
TDSCJSONTools = class(TObject)
  private

  public
    /// <summary>将数据集转化为JSON数据</summary>
    class function JSONToDataSet(AJSON: WideString; ADataSet: TDataSet): Boolean;
    /// <summary>JSON数据转换为结果集</summary>
    class function DataSetToJSON(ADataSet: TDataSet; var AJSON: WideString): Boolean;
    /// <summary>解析TFDMmemtable的Detla包为SQL语句并用JSONArray返回</summary>
    class function FDMemtableToSQLJSON(DB:TFDMemTable;sTable:string;sKey:String;sNoField:String):WideString;
  end;

 {
/// <summary>将数据集转化为JSON数据</summary>
/// <param name="ADataSet">TDataSet - 数据集</param>
/// <param name="AJSON">WideString - 输出转换结果</param>
/// <returns>转换结果 成功: True 失败: False</returns>
function DataSetToJSON(ADataSet: TDataSet; var AJSON: WideString): Boolean;

/// <summary>JSON数据转换为结果集</summary>
/// <param name="AJSON">JSON数据</param>
/// <param name="ADataSet">数据集</param>
/// <returns>转换结果 成功: True 失败: False</returns>
function JSONToDataSet(AJSON: WideString; ADataSet: TDataSet): Boolean;

}

implementation

{$IFDEF 7ZIP}
uses
  SevenZIP;
{$ENDIF}

(*
  C: 配置表
    C.BC BolbComp 二进制字段是否压缩
      0:未压缩 1:已压缩
      默认 0
    C.CC CompClass 压缩类型 {使用7-ZIP压缩, 如果不打开7ZIP编译开关, 此控制无效认为不压缩}
      空表示不压缩, 否则为7-ZIP压缩类型
      默认 CLSID_CFormatGZip : TGUID = '{23170F69-40C1-278A-1000-000110EF0000}'

  T: 表结构表
    T.N:列名
    T.D:显示列名
    T.T:列数据类型 Data.DB.TFieldType
    T.L:列数据长度
    T.R:列值是否允许为空

  R: 数据表

{
  "C":{"BC":0, "CM":"", "BE":0},
  "T":[{"N":"FieldName", "D":"DisplayName", "T":0, "L":100, "R":1}],
  "R":[["Field1Value", "Field2Value"]]
}

*)

const
  _FT_STRING = $00; {字符}
  _FT_FIXEDCHAR = $01; {Fixed character field }
  _FT_WIDESTRING = $02;{Wide string field}
  _FT_MEMO = $03; {MEMO类型}
  _FT_FMTMEMO = $04;{Formatted text memo field}
  //ftSmallint, ftInteger, ftWord, ftLargeint, ftLongWord, ftShortint, ftByte:
  _FT_BYTE = $05;{Fixed number of bytes (binary storage) }
  _FT_SHORTINT = $06;{Short integer}
  _FT_SMALLINT = $07; {16-bit integer field }
  _FT_INTEGER = $08; {32-bit integer field }
  _FT_WORD = $09;{16-bit unsigned integer field}
  _FT_LARGEINT = $10;{Int64 large integer field }
  _FT_LOGWORD = $11;{long word}
  //ftFloat, ftBCD, ftSingle, ftExtended, ftCurrency:
  _FT_SINGLE = $12;{Single precision floating-point number }
  _FT_FLOAT = $13; {浮点}
  _FT_BCD = $14;{Binary-coded Decimal field that can be converted to Currency type without a loss of precision. }
  _FT_FMTBCD = $15;{Binary-coded decimal field that is too large for ftBCD}
  _FT_CURRENCY = $16; {金额}
  _FT_EXTENDED = $17;{EXTENDED}
  //ftDate, ftTime, ftDateTime, ftTimeStamp:
  _FT_DATE = $18;{Date field }
  _FT_TIME = $19;{Time field }
  _FT_DATETIME = $20; {日期}
  _FT_TIMESTAMP = $21;{Date and time field accessed through dbExpress }
  _FT_BOOLEAN = $22; {布尔}
  _FT_BLOB = $23; {二进制}
  //ftGraphic
  _FT_GRAPHIC = $24;{Bitmap field }



type
  TSevenZIPConfig = record
    BolbComp: Boolean; {二进制字段是否压缩}
    CompClass: string; {压缩模式 空表示不压缩, 否则为7-ZIP压缩类型}
  end;

{ TDSCJSONTools }
class function TDSCJSONTools.FDMemtableToSQLJSON(DB: TFDMemTable; sTable, sKey,
  sNoField: String): WideString;
Var
  ItemKey,ItemNoField:TStringlist;
  JA:TJSONArray;
  sField,sValue,sSQL,sTmp,sName:string;
  i,j:Integer;
begin
  JA:=TJSONArray.Create;
  ItemKey:=TStringlist.Create;
  ItemNoField:=TStringlist.Create;

  ItemKey.Delimiter:=',';
  ItemKey.DelimitedText:=sKey;

  ItemNoField.Delimiter:=',';
  ItemNoField.DelimitedText:=sNoField;

  sField:='';
  sValue:='';
  sSQL:='';
  with DB.Delta.DataView.Rows do begin
    for I := 0 to Count-1 do  begin
      sField:='';
      sValue:='';
      //判断数据的操作状态 :插入
      if ItemsI[i].RowState=TFDDatSRowState.rsInserted then begin

        //循环对应的数据字段
        for j := 0 to DB.Fields.Count-1 do begin
          //获取字段名称
          sName:=DB.Fields[J].FieldName;

          //排除不需要插入的字段信息
          if (ItemNoField.IndexOf(sName)>-1) or (DB.Fields[j].FieldKind <> fkData) then
            Continue;

          //判断字段的数据类型
          case DB.Fields[J].DataType of
            ftString,ftWideString,ftMemo: sTmp:=VarToStr(ItemsI[i].GetValues(sName)).QuotedString;
            ftByte, ftShortInt, ftsmallInt, ftInteger, ftWord, ftLargeint, ftLongWord, ftSingle, ftFloat , ftBCD, ftFMTBCD, ftCurrency:
            begin
               if VarIsNull(ItemsI[i].GetValues(sName)) then
                Continue
              else
                 sTmp:=VarToStr(ItemsI[i].GetValues(sName));
            end;
            ftDate, ftTime, ftDateTime, ftTimeStamp: begin
            {
              sTmp:=VarToStr(ItemsI[i].GetValues(sName));
              //日期如何没有填写默认为Null
              if sTmp='' then
                sTmp:='Null'
              else
                sTmp:=FormatDateTime('yyyy-mm-dd hh:ss:mm',StrToDateTime(sTmp)).QuotedString;
                }
              if VarIsNull(ItemsI[i].GetValues(sName)) then
                sTmp := QuotedStr('')
              else
                sTmp:=FormatDateTime('yyyy-mm-dd hh:ss:mm:zzz',ItemsI[i].GetValues(sName)).QuotedString;
            end;
            ftBoolean: begin
              if ItemsI[i].GetValues(sName)=True then
                sTmp:='1'
              else
                sTmp:='0';
            end;
            else
             sTmp:=VarToStr(ItemsI[i].GetValues(sName)).QuotedString;
          end;

          //累积字段和插入值
          sField:=sField+sName+',';
          sValue:=sValue+sTmp+',';
        end;
        //拼接成SQL并插入到数组中
        JA.Add('Insert Into '+sTable+' ('+Copy(sField,1,Length(sField)-1)+')'+#13#10
          +' Values('+Copy(sValue,1,Length(sValue)-1)+')'+#13#10 ) ;

      end
      //判断数据的操作状态 :修改
      else if ItemsI[i].RowState in [TFDDatSRowState.rsModified,
        TFDDatSRowState.rsEditing] then begin
       sField := '';
       sSQL := '';
        for j := 0 to DB.Fields.Count-1 do begin
          sName:=DB.Fields[J].FieldName;

          //排除不需要插入的字段信息
          if (ItemNoField.IndexOf(sName)>-1) or (DB.Fields[j].FieldKind <> fkData) then
            Continue;

          //判断字段的数据类型
          case DB.Fields[J].DataType of
            ftString,ftWideString,ftMemo: sTmp:=VarToStr(ItemsI[i].GetValues(sName)).QuotedString;
            ftByte, ftShortInt, ftsmallInt, ftInteger, ftWord, ftLargeint, ftLongWord, ftSingle, ftFloat , ftBCD, ftFMTBCD, ftCurrency:
            begin
              if VarIsNull(ItemsI[i].GetValues(sName)) then
                Continue
              else
                 sTmp:=VarToStr(ItemsI[i].GetValues(sName));
            end;
            ftDate, ftTime, ftDateTime, ftTimeStamp: begin
            {
              sTmp:=VarToStr(ItemsI[i].GetValues(sName));
              if sTmp='' then
                sTmp:='Null'
              else
                sTmp:=FormatDateTime('yyyy-mm-dd hh:ss:mm:zzz',StrToDateTime(sTmp)).QuotedString;
                }
              if VarIsNull(ItemsI[i].GetValues(sName)) then
                sTmp := QuotedStr('')
              else
                sTmp:=FormatDateTime('yyyy-mm-dd hh:ss:mm:zzz',ItemsI[i].GetValues(sName)).QuotedString;
            end;
            ftBoolean: begin
              if ItemsI[i].GetValues(sName)=True then
                sTmp:='1'
              else
                sTmp:='0';
            end;
            else
             sTmp:=VarToStr(ItemsI[i].GetValues(sName)).QuotedString;
          end;
          //累积更新字段值
          sField:=sField+sName+'='+sTmp+',';

          //修改数据关键字段，条件值
          if ItemKey.IndexOf(sName)>-1 then
            //sSQL:=sSQL+' And '+ sName+ ' = '+VarToStr(ItemsI[i].GetData(sName,rvOriginal));
            sSQL:=sSQL+' And '+ sName+ ' = '+ sTmp  ;

        end;
        //拼接成SQL并插入到数组中
        JA.Add('Update '+sTable+' Set '+Copy(sField,1,Length(sField)-1)+' Where '+Copy(sSQL,5,Length(sSQL)) );
      end
      else if ItemsI[i].RowState in [TFDDatSRowState.rsDeleted] then begin
        sSQL:='';
        //删除数据关键字段，条件值
        for J := 0 to ItemKey.Count-1 do begin
          //sValue:=ItemsI[i].GetValues(ItemKey.Strings[j]);
          if VarIsNull(ItemsI[i].GetValues(ItemKey.Strings[j])) then
            continue
          else
          begin
            case db.FieldByName(ItemKey.Strings[j]).DataType of
              ftString,ftWideString,ftMemo: sTmp:=VarToStr(ItemsI[i].GetValues(sName)).QuotedString;
            ftByte, ftShortInt, ftsmallInt, ftInteger, ftWord, ftLargeint, ftLongWord, ftSingle, ftFloat , ftBCD, ftFMTBCD, ftCurrency:
            begin
              if VarIsNull(ItemsI[i].GetValues(sName)) then
                Continue
              else
                 sTmp:=VarToStr(ItemsI[i].GetValues(sName));
            end;
            ftDate, ftTime, ftDateTime, ftTimeStamp: begin
            {
              sTmp:=VarToStr(ItemsI[i].GetValues(sName));
              if sTmp='' then
                sTmp:='Null'
              else
                sTmp:=FormatDateTime('yyyy-mm-dd hh:ss:mm:zzz',StrToDateTime(sTmp)).QuotedString;
                }
              if VarIsNull(ItemsI[i].GetValues(sName)) then
                sTmp := ''
              else
                sTmp:=FormatDateTime('yyyy-mm-dd hh:ss:mm:zzz',ItemsI[i].GetValues(sName)).QuotedString;
            end;
            ftBoolean: begin
              if ItemsI[i].GetValues(sName)=True then
                sTmp:='1'
              else
                sTmp:='0';
            end;
            else
             sTmp:=VarToStr(ItemsI[i].GetValues(sName)).QuotedString;
            end;
            sSQL:=sSQL+' And '+ ItemKey.Strings[j]+' = '+ sTmp;
          end;
          //if sValue.Trim<>'' then
            //sSQL:=sSQL+' And '+ ItemKey.Strings[j]+' = '+QuotedStr(sValue.Trim);
        end;

        //拼接成SQL并插入到数组中
        if sSQL<>'' then
          JA.Add('Delete '+sTable+' Where '+Copy(sSQL,5,Length(sSQL)) );
      end;
    end;
  end;
  Result:=JA.ToString;
  FreeAndNil(JA);
  FreeAndNil(ItemKey);
  FreeAndNil(ItemNoField);

end;

class function TDSCJSONTools.JSONToDataSet(AJSON: WideString; ADataSet: TDataSet): Boolean;
var
  nJDS: {$IFDEF SYSJSON}TJSONObject{$ENDIF}
        {$IFDEF JSON_SO}ISuperObject{$ENDIF}
        {$IFDEF QJSON}TQJson{$ENDIF}
        ;
  nConfig: TSevenZIPConfig;
  _sFieldList: String;

  procedure _JTDConfig;
  var
    nJO: {$IFDEF SYSJSON}TJSONObject{$ENDIF}
          {$IFDEF JSON_SO}ISuperObject{$ENDIF}
          {$IFDEF QJSON}TQJson{$ENDIF}
          ;
  begin
    with nConfig do
    begin
      BolbComp := False;
      CompClass := '';
    end;

{$IFDEF SYSJSON}
    nJO := nJDS.GetValue('C') as TJSONObject;
    if nJO = nil then
      Exit;
{$ENDIF}
{$IFDEF JSON_SO}
    nJO := nJDS.N['C'];
    if nJO.DataType = stNull then
      Exit;
{$ENDIF}
{$IFDEF QJSON}
    nJO := nJDS.ItemByName('C');
    if nJO.DataType = jdtNull then
      Exit;
{$ENDIF}
    with nConfig do
    begin
      BolbComp := {$IFDEF SYSJSON}TJSONNumber(nJO.GetValue('BC')).AsInt{$ENDIF}
                  {$IFDEF JSON_SO}nJO.I['BC']{$ENDIF}
                  {$IFDEF QJSON}nJO.ItemByName('BC').AsInteger{$ENDIF}
                   = 1;
{$IFDEF 7ZIP}
      CompClass := {$IFDEF SYSJSON}nJO.GetValue('CC').Value{$ENDIF}
                  {$IFDEF JSON_SO}nJO['CC'].AsString{$ENDIF}
                  {$IFDEF QJSON}nJO.ItemByName('CC').AsString{$ENDIF}
                  ;
{$ELSE}
      CompClass := '';
{$ENDIF}
    end;
  end;

  function _JTDStepField: String;
  var
    nFName, nFDisplay: String;
    i, nFLength: Integer;
    nFType: Byte;
    nFD: TFieldDef;
    nFRequired: Boolean;
{$IFDEF SYSJSON}
    nJA: TJSONArray;
    nJO: TJSONObject;
    nJV: TJSONValue;
    nJP: TJSONPair;
{$ENDIF}
{$IFDEF JSON_SO}
    nJA: TSuperArray;
    nJO, nJR: ISuperObject;
{$ENDIF}
{$IFDEF QJSON}
    nJO, nJR: TQJson;
{$ENDIF}
  begin
    Result := '';
    ADataSet.Close;

{$IFDEF SYSJSON}
    nJA := nJDS.GetValue('T') as TJSONArray;
    if nJA = nil then
      Exit;
{$ENDIF}
{$IFDEF JSON_SO}
    nJO := nJDS.N['T'];
    if nJO.DataType = stNull then
      Exit;
{$ENDIF}
{$IFDEF QJSON}
    nJO := nJDS.ItemByName('T');
    if nJO.DataType = jdtNull then
      Exit;
{$ENDIF}

    ADataSet.FieldDefs.BeginUpdate;
    try
      ADataSet.FieldDefs.Clear;

    {拆解Field}
{$IFDEF SYSJSON}
      for i := 0 to nJA.Size - 1 do
      begin
        nJO := nJA.Get(i) as TJSONObject;
        nFName := nJO.GetValue('N').Value;
        nFDisplay := nJO.GetValue('D').Value;
        nFType := TJSONNumber(nJO.GetValue('T')).AsInt;
        nFLength := TJSONNumber(nJO.GetValue('L')).AsInt;
        nFRequired := Boolean(TJSONNumber(nJO.GetValue('R')).AsInt);
{$ENDIF}
{$IFDEF JSON_SO}
      nJA := nJO.AsArray;
      for i := 0 to nJA.Length - 1 do
      begin
        nJR := nJA[i];
        nFName := nJR['N'].AsString;
        nFDisplay := nJR['D'].AsString;
        nFType := nJR['T'].AsInteger;
        nFLength := nJR['L'].AsInteger;
        nFRequired := Boolean(nJR['R'].AsInteger);
{$ENDIF}
{$IFDEF QJSON}
      for i := 0 to nJO.Count - 1 do
      begin
        nJR := nJO.Items[i];
        nFName := nJR.ItemByName('N').AsString;
        nFDisplay := nJR.ItemByName('D').AsString;
        nFType := nJR.ItemByName('T').AsInteger;
        nFLength := nJR.ItemByName('L').AsInteger;
        nFRequired := Boolean(nJR.ItemByName('R').AsInteger);
{$ENDIF}
        Result := Result + nFName + '|' ;
        nFD := ADataSet.FieldDefs.AddFieldDef;
        with nFD do
        try
          Name := nFName;
          case nFType of
            _FT_STRING:
            begin
              DataType := ftString;
              size := nFLength;
            end;
            _FT_FIXEDCHAR:
            begin
              DataType := ftFixedChar;
              size := nFLength;
            end;
            _FT_WIDESTRING:
             begin
              DataType := ftWideString;
              size := nFLength;
             end;
            _FT_MEMO:
              DataType := ftMemo;
            _FT_FMTMEMO:
              DataType := ftFMTMemo;
            _FT_BYTE:
              DataType := ftByte;
            _FT_SHORTINT:
              DataType := ftShortInt;
            _FT_SMALLINT:
              DataType := ftSmallInt;
            _FT_INTEGER:
              DataType := ftInteger;
            _FT_WORD:
              DataType := ftWord;
            _FT_LARGEINT:
              DataType := ftLargeInt;
             _FT_LOGWORD:
              DataType := ftLongWord;
            _FT_SINGLE:
              DataType := ftSingle;
            _FT_FLOAT:
              DataType := ftFloat;
            _FT_BCD:
              DataType := ftBCD;
            _FT_FMTBCD:
              DataType := ftFMTBCD;
            _FT_CURRENCY:
              DataType := ftCurrency;
            _FT_EXTENDED:
              DataType := ftExtended;
            _FT_DATE:
              DataType := ftDate;
            _FT_TIME:
              DataType := ftTime;
            _FT_DATETIME:
              DataType := ftDatetime;
            _FT_TIMESTAMP:
              DataType := ftTimeStamp;
            _FT_BOOLEAN:
              DataType := ftBoolean;
            _FT_BLOB:
              DataType := ftBlob;
            _FT_GRAPHIC:
              DataType := ftGraphic;
          else
            DataType := ftString;
            Size := nFLength;
          end;
          Required := nFRequired;
          DisplayName := nFDisplay;
        except
          DisposeOf;
        end;
      end;
    finally
      ADataSet.FieldDefs.EndUpdate;
    end;
    //Result := True;
  end;

  function _JTDStepRecord(FieldList:String): Boolean;
  var
    nFName, nStr: String;
    FList: TStringList;
    i, j, _iFCount: Integer;
    nField: TField;
    nMSI, nMSO: TMemoryStream;
{$IFDEF 7ZIP}
    nCItemIndex: Integer;
    nMSC: TMemoryStream; {解压缩用}
{$ENDIF}
    nJRA: {$IFDEF SYSJSON}TJSONArray{$ENDIF}
          {$IFDEF JSON_SO}TSuperArray{$ENDIF}
          {$IFDEF QJSON}TQJson{$ENDIF}
          ;
{$IFDEF SYSJSON}
    nJA: TJSONArray;
{$ENDIF}
{$IFDEF JSON_SO}
    nJA: TSuperArray;
    nJO, nJR: ISuperObject;
{$ENDIF}
{$IFDEF QJSON}
    nJO: TQJson;
{$ENDIF}
  begin
    Result := False;
    FList := TStringList.Create;
    FList.Delimiter := '|';
    FList.DelimitedText := FieldList;
{$IFDEF SYSJSON}
    nJA := nJDS.GetValue('R') as TJSONArray;
    if nJA = nil then
      Exit;
{$ENDIF}
{$IFDEF JSON_SO}
    nJO := nJDS.N['R'];
    if nJO.DataType = stNull then
      Exit;
    nJA := nJO.AsArray;
{$ENDIF}
{$IFDEF QJSON}
    nJO := nJDS.ItemByName('R');
    if nJO.DataType = jdtNull then
      Exit;
{$ENDIF}
    nMSO := TMemoryStream.Create;
    nMSI := TStringStream.Create;
{$IFDEF 7ZIP}
    nMSC := TMemoryStream.Create;
{$ENDIF}
    ADataSet.DisableControls;
    try
      for i := 0 to {$IFDEF SYSJSON}nJA.Size - 1{$ENDIF}
                    {$IFDEF JSON_SO}nJA.Length - 1{$ENDIF}
                    {$IFDEF QJSON}nJO.Count - 1{$ENDIF}
      do
      begin
        nJRA := {$IFDEF SYSJSON}nJA.Get(i) as TJSONArray{$ENDIF}
                {$IFDEF JSON_SO}nJA[i].AsArray{$ENDIF}
                {$IFDEF QJSON}nJO.Items[i]{$ENDIF}
                ;
        //获取JSON串字段数量
        {$IFDEF SYSJSON}_iFCount := nJRA.Size {$ENDIF}
        {$IFDEF JSON_SO}_iFCount := nJRA.Length {$ENDIF}
        {$IFDEF QJSON}_iFCount := nJRA.Count {$ENDIF}
        ;
        ADataSet.Append;
        //for j := 0 to ADataSet.Fields.Count - 1 do
        for j := 0 to _iFCount - 1 do
        begin
          //nField := ADataSet.Fields[j];
          nField := ADataSet.FieldByName(FList.Strings[j]) ;
          nFName := nField.FieldName;
          if
            {$IFDEF SYSJSON}nJRA.Get(j).Null{$ENDIF}
            {$IFDEF JSON_SO}nJRA[j].DataType = stNull{$ENDIF}
            {$IFDEF QJSON}nJRA[j].DataType = jdtNull{$ENDIF}
          then
          begin
            nField.SetData(nil);
          end
          else
          begin
            case nField.DataType of
              ftLargeint, ftSmallint, ftInteger, ftWord,  ftLongWord, ftShortint, ftByte:
              begin
                nField.Value := {$IFDEF SYSJSON}TJSONNumber(nJRA.Get(j)).AsInt64{$ENDIF}
                                {$IFDEF JSON_SO}nJRA[j].AsInteger{$ENDIF}
                                {$IFDEF QJSON}nJRA.Items[j].AsInteger{$ENDIF}
                                ;
              end;
              ftFloat,  ftBCD, ftSingle, ftExtended, ftCurrency:
              begin
                nField.Value := {$IFDEF SYSJSON}TJSONNumber(nJRA.Get(j)).AsDouble{$ENDIF}
                                {$IFDEF JSON_SO}nJRA[j].AsDouble{$ENDIF}
                                {$IFDEF QJSON}nJRA.Items[j].AsFloat{$ENDIF}
                                ;
              end;
              ftDate, ftTime, ftDateTime, ftTimeStamp:
              begin
                //nField.Value := UnixToDateTime(
                {$IFDEF SYSJSON}nField.Value := UnixToDateTime(TJSONNumber(nJRA.Get(j)).AsInt64);{$ENDIF}
                {$IFDEF JSON_SO}nField.Value := UnixToDateTime(nJRA[j].AsInteger);{$ENDIF}
                //                  {$IFDEF QJSON}nJRA.Items[j].AsInt64{$ENDIF}
                //                );
                {$IFDEF QJSON}nField.Value := nJRA.Items[j].AsDateTime;     {$ENDIF}
              end;
              ftBoolean:
              begin
                nField.Value := Boolean(
                                  {$IFDEF SYSJSON}TJSONNumber(nJRA.Get(j)).AsInt{$ENDIF}
                                  {$IFDEF JSON_SO}nJRA[j].AsInteger{$ENDIF}
                                  {$IFDEF QJSON}nJRA.Items[j].AsInteger{$ENDIF}
                                );
              end;
              ftBlob, ftMemo, ftGraphic:
              begin
                nMSI.Clear;
                nMSO.Clear;
                nStr := {$IFDEF SYSJSON}TJSONString(nJRA.Get(j)).Value{$ENDIF}
                        {$IFDEF JSON_SO}nJRA[j].AsString{$ENDIF}
                        {$IFDEF QJSON}nJRA.Items[j].AsString{$ENDIF}
                        ;
                nMSI.Write(nStr[1], Length(nStr) * SizeOf(Char));
                nMSI.Position := 0;
                nMSO.Clear;
{$IFDEF 7ZIP}
                if nConfig.CompClass = '' then
                begin
{$ENDIF}
                  DecodeStream(nMSI, nMSO);
{$IFDEF 7ZIP}
                end
                else
                try
                  nMSC.Clear;
                  DecodeStream(nMSI, nMSC);
                  nMSC.Position := 0;
                  with CreateInArchive(TGUID.Create(nConfig.CompClass)) do
                  begin
                    OpenStream(T7zStream.Create(nMSC, soReference));
                    for nCItemIndex := 0 to NumberOfItems - 1 do
                      if not ItemIsFolder[nCItemIndex] then
                      begin
                        ExtractItem(nCItemIndex, nMSO, False);
                        Break;
                      end;
                  end;
                except
                  {此处解压缩异常后, 默认不写入数据, 根据实际情况进行处理}
                  nMSO.Clear;
                end;
{$ENDIF}
                nMSO.Position := 0;
                TBlobField(nField).LoadFromStream(nMSO);
              end;
              ftWideString:
              begin
                nField.AsWideString := {$IFDEF SYSJSON}TJSONString(nJRA.Get(j)).Value{$ENDIF}
                              {$IFDEF JSON_SO}nJRA[j].AsString{$ENDIF}
                              {$IFDEF QJSON}nJRA.Items[j].AsString{$ENDIF}
                              ;
              end
            else
              nField.Value := {$IFDEF SYSJSON}TJSONString(nJRA.Get(j)).Value{$ENDIF}
                              {$IFDEF JSON_SO}nJRA[j].AsString{$ENDIF}
                              {$IFDEF QJSON}nJRA.Items[j].AsString{$ENDIF}
                              ;
            end;
          end;
        end;
        ADataSet.Post;
      end;
      ADataSet.First;
    finally
      ADataSet.EnableControls;
      nMSO.Free;
      nMSI.Free;
      FList.Free();
{$IFDEF 7ZIP}
      nMSC.Free;
{$ENDIF}
    end;
    Result := True;
  end;

begin
  if ADataSet = nil then
    Exit;

{$IFDEF SYSJSON}
  nJDS := TJSONObject.ParseJSONValue(AJSON) as TJSONObject;
  try
{$ENDIF}
{$IFDEF JSON_SO}
  nJDS := SO(AJSON);
{$ENDIF}
{$IFDEF QJSON}
  nJDS := TQJson.Create;
  nJDS.Parse(AJSON);
  try
{$ENDIF}
    try
      _JTDConfig;

      if ADataSet is TCustomClientDataSet then
      begin
        _sFieldList := _JTDStepField;
        if not( _sFieldList = '')  then
        begin
          TCustomClientDataSet(ADataSet).CreateDataSet;
          Result := _JTDStepRecord(_sFieldList);
        end;
      end
{$IFDEF ADO}
      else if ADataSet is TADODataSet then
      begin
        _sFieldList := _JTDStepField;
        if not (_sFieldList = '') then
        begin
          TADODataSet(ADataSet).CreateDataSet;
          Result := _JTDStepRecord(_sFieldList);
        end;
      end
{$ENDIF}
{$IFDEF FIREDAC}
      else if ADataSet is TFDDataSet then
      begin
        _sFieldList := _JTDStepField;
        //Result := true;
        if not (_sFieldList = '') then
        begin
          TFDDataSet(ADataSet).CreateDataSet;
          ADataset.Open();
          Result := _JTDStepRecord(_sFieldList);
        end;
      end
{$ENDIF}
      else
        Result := False;
    except
      Result := False;
    end;
{$IFDEF SYSJSON}
  finally
    nJDS.Free;
  end;
{$ENDIF}
{$IFDEF QJSON}
  finally
    nJDS.Free;
  end;
{$ENDIF}
end;

class function TDSCJSONTools.DataSetToJSON(ADataSet: TDataSet;
  var AJSON: WideString): Boolean;
var
  nJA, nJRA: {$IFDEF SYSJSON}TJSONArray{$ENDIF}
             {$IFDEF JSON_SO}TSuperArray{$ENDIF}
             {$IFDEF QJSON}TQJson{$ENDIF}
             ;
  nJDS: {$IFDEF SYSJSON}TJSONObject{$ENDIF}
        {$IFDEF JSON_SO}ISuperObject{$ENDIF}
        {$IFDEF QJSON}TQJson{$ENDIF}
        ;
{$IFDEF SYSJSON}
  nJO: TJSONObject;
{$ENDIF}
{$IFDEF JSON_SO}
  nJR: ISuperObject;
{$ENDIF}
  i: Integer;
  nTitle, nStr, nFDisplay: string;
  nField: TField;
  nFT: Byte;
  nMSI: TMemoryStream;
  nSSO: TStringStream;
  nCompClassStr: string;
{$IFDEF 7ZIP}
  nMSC: TMemoryStream; {解压缩用}
{$ENDIF}
const
  _DEF_TITLE = '{"C":{"BC":0,"CC":"%s"},"T":[],"R":[]}';
  _DEf_RECORD = '{"N":"%s","D":"%s","T":%d,"L":%d,"R":%d}';
begin
  Result := False;
{$IFDEF 7ZIP}
  nCompClassStr := CLSID_CFormatGZip.ToString;
{$ELSE}
  nCompClassStr := '';
{$ENDIF}
  nTitle := Format(_DEF_TITLE, [nCompClassStr]);
{$IFDEF SYSJSON}
  nJDS := TJSONObject.ParseJSONValue(nTitle) as TJSONObject;
{$ENDIF}
{$IFDEF JSON_SO}
  nJDS := SO(nTitle);
{$ENDIF}
{$IFDEF QJSON}
  nJDS := TQJson.Create;
  nJDS.Parse(nTitle);
{$ENDIF}
  ADataSet.DisableControls;
  nMSI := TMemoryStream.Create;
  nSSO := TStringStream.Create;
{$IFDEF 7ZIP}
  nMSC := TMemoryStream.Create;
{$ENDIF}
  try
    nJA := {$IFDEF SYSJSON}nJDS.GetValue('T') as TJSONArray{$ENDIF}
           {$IFDEF JSON_SO}nJDS.A['T']{$ENDIF}
           {$IFDEF QJSON}nJDS.ItemByName('T'){$ENDIF}
           ;
    AJSON := '';
    try
      ADataSet.First;
      for i := 0 to ADataSet.Fields.Count - 1 do
      begin
        //ftByte, ftShortInt, ftsmallInt, ftInteger, ftWord, ftLargeint, ftLongWord, ftSingle, ftFloat , ftBCD, ftFMTBCD, ftCurrency
        nField := ADataSet.Fields[i];
        case nField.DataType of
          ftString:
            nFT := _FT_STRING;
          ftFixedChar:
            nFT := _FT_FIXEDCHAR;
          ftWideString:
            nFT := _FT_WIDESTRING;
          ftMemo:
            nFT := _FT_MEMO;
          ftFMTMemo:
            nFT := _FT_FMTMEMO;
          ftByte:
            nFT := _FT_BYTE;
          ftShortInt:
            nFT := _FT_SHORTINT;
          ftSmallInt:
            nFT := _FT_SMALLINT;
          ftInteger:
            nFT := _FT_INTEGER;
          ftWord:
            nFT := _FT_WORD;
          ftLargeint:
            nFT := _FT_LARGEINT;
          ftLongWord:
            nFT := _FT_LOGWORD;
          ftSingle:
            nFT := _FT_SINGLE;
          ftFloat:
            nFT := _FT_FLOAT;
          ftBCD:
            nFT := _FT_BCD;
          ftFMTBCD:
            nFT := _FT_FMTBCD;
          ftCurrency:
            nFT := _FT_CURRENCY;
          ftExtended:
            nFT := _FT_EXTENDED;
          ftDate:
            nFT := _FT_DATE;
          ftTime:
            nFT := _FT_TIME;
          ftDateTime:
            nFT := _FT_DATETIME;
          ftTimeStamp:
            nFT := _FT_TIMESTAMP;
          ftBoolean:
            nFT := _FT_BOOLEAN;
          ftBlob:
            nFT := _FT_BLOB;
          ftGraphic:
            nFT := _FT_GRAPHIC;
        else
          nFT := _FT_STRING;
        end;
        if nField.DisplayLabel = nField.FieldName then
          nFDisplay := ''
        else
          nFDisplay := nField.DisplayLabel;
        nStr := Format(_DEf_RECORD, [nField.FieldName, nFDisplay, nFT,
          nField.DataSize, Byte(nField.Required)]);
{$IFDEF SYSJSON}
        nJA.AddElement(TJSONObject.ParseJSONValue(nStr));
{$ENDIF}
{$IFDEF JSON_SO}
        nJA.Add(SO(nStr));
{$ENDIF}
{$IFDEF QJSON}
        nJA.Add.Parse(nStr);
{$ENDIF}
      end;

      nJA := {$IFDEF SYSJSON}nJDS.GetValue('R') as TJSONArray{$ENDIF}
             {$IFDEF JSON_SO}nJDS.A['R']{$ENDIF}
             {$IFDEF QJSON}nJDS.ItemByName('R'){$ENDIF}
             ;
      while not ADataSet.Eof do
      begin
{$IFDEF SYSJSON}
        nJRA := TJSONArray.Create;
        nJA.AddElement(nJRA);
{$ENDIF}
{$IFDEF JSON_SO}
        nJR := SA([]);
        nJA.Add(nJR);
        nJRA := nJR.AsArray;
{$ENDIF}
{$IFDEF QJSON}
        nJRA := nJA.Add('', jdtArray);
{$ENDIF}
        for i := 0 to ADataSet.Fields.Count - 1 do
        begin
          nField := ADataSet.Fields[i];
          if nField.IsNull then
          begin
{$IFDEF SYSJSON}
            nJRA.AddElement(TJSONNull.Create);
{$ENDIF}
{$IFDEF JSON_SO}
            nJRA.Add(SO(NULL));
{$ENDIF}
{$IFDEF QJSON}
            nJRA.Add('', jdtNull);
{$ENDIF}
          end
          else
          begin
            case nField.DataType of
              ftFixedChar, ftString, ftWideString:
              begin
                nJRA.Add.AsString := nField.AsString;
              end;
              ftSmallint, ftInteger, ftWord, ftLargeint, ftLongWord, ftShortint, ftByte:
              begin
{$IFDEF SYSJSON}
                nJRA.Add(nField.AsInteger);
{$ENDIF}
{$IFDEF JSON_SO}
                nJRA.Add(SO(nField.AsInteger));
{$ENDIF}
{$IFDEF QJSON}
                nJRA.Add.AsInteger := nField.AsInteger;
{$ENDIF}
              end;
              ftFloat, ftBCD, ftFMTBCD, ftSingle, ftExtended, ftCurrency:
              begin
{$IFDEF SYSJSON}
                nJRA.Add(nField.AsFloat);
{$ENDIF}
{$IFDEF JSON_SO}
                nJRA.Add(SO(nField.AsFloat));
{$ENDIF}
{$IFDEF QJSON}
                nJRA.Add.AsFloat := nField.AsFloat;
{$ENDIF}
              end;
              ftDate, ftTime, ftDateTime, ftTimeStamp:
              begin
{$IFDEF SYSJSON}
                nJRA.Add(DateTimeToUnix(nField.AsDateTime));
{$ENDIF}
{$IFDEF JSON_SO}
                nJRA.Add(SO(DateTimeToUnix(nField.AsDateTime)));
{$ENDIF}
{$IFDEF QJSON}
                //nJRA.Add.AsInt64 := DateTimeToUnix(nField.AsDateTime);
                nJRA.Add.AsDateTime := nField.AsDateTime;
{$ENDIF}
              end;
              ftBlob, ftMemo, ftFMTMemo, ftGraphic:
              begin
                nMSI.Clear;
                nSSO.Clear;
{$IFDEF 7ZIP}
                if nCompClassStr <> '' then
                try
                  nMSC.Clear;
                  TBlobField(nField).SaveToStream(nMSC);
                  nMSC.Position := 0;
                  with CreateOutArchive(TGUID.Create(nCompClassStr)) do
                  begin
                    AddStream(nMSC, soReference, faArchive, CurrentFileTime, CurrentFileTime,
                      ExtractFilePath(ParamStr(0)), False, False);
                    SaveToStream(nMSI);
                  end;
                except
                  nMSI.Clear;
                end
                else
                begin
{$ENDIF}
                  TBlobField(nField).SaveToStream(nMSI);
{$IFDEF 7ZIP}
                end;
{$ENDIF}
                nMSI.Position := 0;
                EncodeStream(nMSI, nSSO);
{$IFDEF SYSJSON}
                nJRA.Add(nSSO.DataString);
{$ENDIF}
{$IFDEF JSON_SO}
                nJRA.Add(SO(nSSO.DataString));
{$ENDIF}
{$IFDEF QJSON}
                nJRA.Add('', nSSO.DataString);
{$ENDIF}
              end;
            else
{$IFDEF SYSJSON}
              nJRA.Add(nField.AsString);
{$ENDIF}
{$IFDEF JSON_SO}
              nJRA.Add(SO(nField.AsString));
{$ENDIF}
{$IFDEF QJSON}
              //nJRA.Add('', nField.AsString);
              nJRA.Add.AsString := nField.AsString;
{$ENDIF}
            end;
          end;
        end;
        ADataSet.Next;
      end;
      AJSON := {$IFDEF SYSJSON}nJDS.ToString{$ENDIF}
               {$IFDEF JSON_SO}nJDS.AsJSon(False, False){$ENDIF}
               {$IFDEF QJSON}nJDS.Encode(False){$ENDIF}
               ;
      Result := True;
    except
    end;
  finally
{$IFDEF 7ZIP}
    nMSC.Free;
{$ENDIF}
    nMSI.Free;
    nSSO.Free;
    ADataSet.EnableControls;
{$IFDEF SYSJSON}
    nJDS.Free;
{$ENDIF}
{$IFDEF QJSON}
    nJDS.Free;
{$ENDIF}
  end;
end;

{ TDSCJSONTools }

{
class function TDSCJSONTools.DataSetToJSON(ADataSet: TDataSet;
  var AJSON: WideString): Boolean;
begin

end;
}

{
class function TDSCJSONTools.JSONToDataSet(AJSON: WideString; ADataSet: TDataSet): Boolean;
begin

end;
}

end.
