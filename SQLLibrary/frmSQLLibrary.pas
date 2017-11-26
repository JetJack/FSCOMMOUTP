unit frmSQLLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, cxTextEdit, cxContainer, cxEdit, dxSkinsForm,
  dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, cxGroupBox, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, dxtree, dxdbtree,
  SQLLibraryDataModule, Data.DB, Datasnap.DBClient, cxMaskEdit, cxDropDownEdit,
  cxDBEdit, cxMemo, cxDBLabel, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxSkinscxPCPainter;

type
  TfrmSQL = class(TdxRibbonForm)
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxSkinController1: TdxSkinController;
    Panel1: TPanel;
    dxBarManager1: TdxBarManager;
    Panel2: TPanel;
    cxGroupBox1: TcxGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    dxDBTreeView1: TdxDBTreeView;
    Panel6: TPanel;
    Panel7: TPanel;
    cxGroupBox4: TcxGroupBox;
    cdsSQLView: TClientDataSet;
    dsSQLView: TDataSource;
    cdsSQLViewDomain: TStringField;
    cdsSQLViewParentField: TStringField;
    cdsSQLViewSQLName: TStringField;
    cdsSQLViewSQLID: TIntegerField;
    cdsSQLViewIsValid: TIntegerField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cbModule: TcxDBComboBox;
    cdsSQL: TClientDataSet;
    cdsSQLSQLID: TIntegerField;
    cdsSQLModuleName: TStringField;
    cdsSQLClassName: TStringField;
    cdsSQLProcedureName: TStringField;
    cdsSQLSQLName: TStringField;
    cdsSQLSQLText: TMemoField;
    cdsSQLIsValid: TByteField;
    cdsSQLComment: TStringField;
    cdsSQLCreateTime: TSQLTimeStampField;
    dsSQL: TDataSource;
    cbClass: TcxDBComboBox;
    cbProcdure: TcxDBComboBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBMemo1: TcxDBMemo;
    cxDBMemo2: TcxDBMemo;
    cdsGen: TClientDataSet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    eSQLName: TcxDBTextEdit;
    eCreateor: TcxDBTextEdit;
    cdsSQLCreator: TIntegerField;
    cdsSQLInfo: TClientDataSet;
    cdsSQLInfoModuleName: TStringField;
    cdsSQLInfoClassName: TStringField;
    cdsSQLInfoProcedureName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsSQLBeforePost(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsSQLModuleNameChange(Sender: TField);
    procedure cdsSQLClassNameChange(Sender: TField);
    procedure cdsSQLAfterOpen(DataSet: TDataSet);
    procedure dxDBTreeView1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshSQLList();
    procedure AddNewSQL();
    procedure SaveSQL();
    procedure RefreshModule();
    procedure RefreshClass(ModuleName: String);
    procedure RefreshProcedure(ModuleName, ClassName: String);
    procedure DeleteSQl(SQLID: Integer);
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation

{$R *.dfm}

{ TForm3 }

procedure TfrmSQL.AddNewSQL;
var sSQlStr: String;
begin
 if not self.cdsSQL.Active then
    self.cdsSQL.Open;
  if self.cdsSQL.ChangeCount > 0 then
  begin
    if messagedlg('SQL语句内容已修改，需要保存吗？',mtConfirmation,
      [mbYes,mbNo],0)=mrYes  then
    begin
      try
        self.SaveSQL();
      except
        on E :Exception do
        begin
          showmessage(E.Message);
          exit;
        end;
      end;
    end;
  end;
  try
    self.cdsSQL.ReadOnly := false;
    self.cdsSQL.EmptyDataSet;
    self.cdsSQL.Append;
    self.cdsSQLSQLID.AsInteger := -1;
    self.cdsSQLModuleName.AsString := '';
    self.cdsSQLClassName.AsString := '';
    self.cdsSQLProcedureName.AsString := '';
    self.cdsSQLIsValid.AsInteger := 1;
    if not self.cdsSQLView.IsEmpty  then
    begin
      {
      sSQLStr := 'select ModuleName, ClassName, ProcedureName from SQLLibrary where SQLID = '
        + IntToStr(self.cdsSQLViewSQLID.AsInteger);
      self.cdsGen.Close;
      self.cdsGen.CommandText := sSQLStr;
      self.cdsGen.Open;
      }
      self.cdsSQLInfo.Close;
      self.cdsSQLInfo.ParamByName('SQLID').AsInteger := self.cdsSQLViewSQLID.AsInteger;
      self.cdsSQLInfo.Open();
      if not self.cdsSQLInfo.IsEmpty then
      begin
        self.cdsSQLModuleName.AsString
          //:= self.cdsGen.FieldByName('ModuleName').AsString;
          := self.cdsSQLInfoModuleName.AsString;
        self.cdsSQLClassName.AsString
          := self.cdsSQLInfoClassName.AsString;
          //:= self.cdsGen.FieldByName('ClassName').AsString;
        self.cdsSQLProcedureName.AsString
          := self.cdsSQLInfoProcedureName.AsString;
      end;
      {
      if not self.cdsGen.IsEmpty then
      begin
        self.cdsSQLModuleName.AsString
          //:= self.cdsGen.FieldByName('ModuleName').AsString;
          := self.cdsSQLModuleName.AsString;
        self.cdsSQLClassName.AsString
          //:= self.cdsGen.FieldByName('ClassName').AsString;
        self.cdsSQLProcedureName.AsString
          //:= self.cdsGen.FieldByName('ProcedureName').AsString;
          := self.cdsGen.Fields.Fields[2].AsString;
      end;
      }
      self.cdsSQLInfo.Close();
    end;
      //self.cdsSQLSQLID.AsInteger := dmSQLLibrary.GetNewSQLID();
      self.cdsSQLCreateTime.AsDateTime := time();
  finally

  end;
end;

procedure TfrmSQL.cdsSQLAfterOpen(DataSet: TDataSet);
begin
  self.RefreshModule;
  self.RefreshClass(DataSet.FieldByName('ModuleName').AsString);
  self.RefreshProcedure(DataSet.FieldByName('ModuleName').AsString,
  DataSet.FieldByName('ClassName').AsString);
end;

procedure TfrmSQL.cdsSQLBeforePost(DataSet: TDataSet);
var sSqlStr: String;
begin
 { if self.cdsSQLModuleName.AsString = '' then
  begin
    showmessage('模块名不能为空！') ;
    self.cdsSQL.Cancel;
  end;
  if self.cdsSQLClassName.AsString = '' then
  begin
    showmessage('类名不能为空！') ;
    self.cdsSQL.Cancel;
  end;
  if self.cdsSQLProcedureName.AsString = '' then
  begin
    showmessage('函数名不能为空！') ;
    self.cdsSQL.Cancel;
  end;
  sSqlStr := 'select SQLID from SQLLibrary where ModuleName = @p1 and '
    + ' ClassName = @p2 and ProcedureName = @p3 and SQLName = @p4' ;
  sSqlStr := StringReplace(sSqlStr,'@p1',QuotedStr(self.cdsSQLModuleName.AsString),[rfIgnoreCase]);
  sSqlStr := StringReplace(sSqlStr,'@p2',QuotedStr(self.cdsSQLClassName.AsString),[rfIgnoreCase]);
  sSqlStr := StringReplace(sSqlStr,'@p3',QuotedStr(self.cdsSQLProcedureName.AsString),[rfIgnoreCase]);
  sSqlStr := StringReplace(sSqlStr,'@p4',QuotedStr(self.cdsSQLSQLName.AsString),[rfIgnoreCase]);
  self.cdsGen.Close;
  self.cdsGen.CommandText := sSqlStr;
  self.cdsGen.Open;
  if not self.cdsGen.IsEmpty then
    if self.cdsGen.FieldByName('SQLID').AsInteger
      <> self.cdsSQLSQLID.AsInteger then
  begin
    showmessage('已存在同名的SQL语句！') ;
    self.cdsSQL.Cancel;
  end; }
end;

procedure TfrmSQL.cdsSQLClassNameChange(Sender: TField);
begin
  self.RefreshProcedure(self.cdsSQLModuleName.AsString,
    self.cdsSQLClassName.AsString);
end;

procedure TfrmSQL.cdsSQLModuleNameChange(Sender: TField);
begin
  self.RefreshClass(Sender.AsString);
end;

procedure TfrmSQL.cxButton1Click(Sender: TObject);
begin
  self.AddNewSQL();
end;

procedure TfrmSQL.cxButton2Click(Sender: TObject);
var bookmark :TBookmark;
begin
  try
    try
      bookmark := self.cdsSQLView.GetBookmark() ;
      self.SaveSQL();
      self.cdsSQLView.Close;
      self.cdsSQLView.Data := dmSQLLibrary.GetSQLList;
      self.cdsSQLView.Open;
      self.cdsSQLView.GotoBookmark(bookmark);
    except
      on E:Exception do
      begin
        Showmessage('数据保存失败！'+ E.Message);
      end;
    end;
  finally

  end;
end;

procedure TfrmSQL.cxButton3Click(Sender: TObject);
begin
  if not self.cdsSQL.IsEmpty then
  begin
    self.DeleteSQl(self.cdsSQLSQLID.AsInteger);
  end;
end;

procedure TfrmSQL.DeleteSQl(SQLID: Integer);
begin
  if SQLID > 0 then
  begin
    if messagedlg('要删除SQL语句吗？',mtConfirmation,
    [mbYes,mbNo],0)=mrYes then
    begin
    try
      dmSQLLibrary.DeleteSQL(SQLID);
      showmessage('删除操作成功!');
    except
      On E: Exception do
        showmessage('删除操作失败！' + E.Message);
    end;
    end;
  end;
  self.RefreshSQLList();
end;

procedure TfrmSQL.dxDBTreeView1Click(Sender: TObject);
begin
  if self.dxDBTreeView1.Selected.Count = 0 then
  begin
    self.cdsSQL.Close;
    self.cdsSQL.ParamByName('SQLID').AsInteger
      := self.cdsSQLViewSQLID.AsInteger;
    self.cdsSQL.Open;
    self.cdsSQL.ReadOnly := false;
  end
  else
  begin
    self.cdsSQL.EmptyDataSet;
    self.cdsSQL.ReadOnly := true;
  end;
end;

procedure TfrmSQL.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure TfrmSQL.FormShow(Sender: TObject);
begin
  self.cdsSQLView.Close;
  self.cdsSQLView.Data := dmSQLLibrary.GetSQLList();
  self.cdsSQLView.Open;
  self.RefreshModule();
  self.cdsSQL.Close;
  self.cdsSQL.ParamByName('SQLID').AsInteger := 0;
  self.cdsSQL.Open;
  self.RefreshModule;
end;

procedure TfrmSQL.RefreshSQLList;
begin
  self.cdsSQLView.Close;
  self.cdsSQLView.Data := dmSQLLibrary.GetSQLList();
  self.cdsSQLView.Open;
end;

procedure TfrmSQL.RefreshClass(ModuleName: String);
var sSqlStr: String;
begin
  sSqlStr := 'select distinct ClassName from SQLLibrary where ModuleName = '
    + QuotedStr(ModuleName);
  self.cbClass.Properties.Items.Clear;
  self.cdsGen.Close;
  self.cdsGen.CommandText := sSQLStr;
  self.cdsGen.Open;
  if not self.cdsGen.IsEmpty then
  begin
    self.cdsGen.First;
    while not self.cdsGen.Eof do
    begin
      self.cbClass.Properties.Items.Add(self.cdsGen.FieldByName('ClassName').AsString);
      self.cdsGen.Next;
    end;
  end;
  self.cdsGen.Close;
end;

procedure TfrmSQL.RefreshModule;
var sSqlStr: String;
begin
  sSQLStr := 'select distinct ModuleName from SQLLibrary';
  self.cbModule.Properties.Items.Clear;
  self.cdsGen.Close;
  self.cdsGen.CommandText := sSQLStr;
  self.cdsGen.Open;
  if not self.cdsGen.IsEmpty then
  begin
    self.cdsGen.First;
    while not self.cdsGen.Eof do
    begin
      self.cbModule.Properties.Items.Add(self.cdsGen.FieldByName('ModuleName').AsString);
      self.cdsGen.Next;
    end;
  end;
  self.cdsGen.Close;
end;

procedure TfrmSQL.RefreshProcedure(ModuleName, ClassName: String);
var sSQLStr: String;
begin
  sSQLStr := 'select distinct ProcedureName from SQLLibrary where ModuleName = @p1 and ClassName = @p2' ;
  sSQLStr := StringReplace(sSQLStr,'@p1',QuotedStr(ModuleName),[rfIgnoreCase]);
  sSQLStr := StringReplace(sSQLStr,'@p2',QuotedStr(ClassName),[rfIgnoreCase]);
  self.cbProcdure.Properties.Items.Clear;
  self.cdsGen.Close;
  self.cdsGen.CommandText := sSQLStr;
  self.cdsGen.Open;
  if not self.cdsGen.IsEmpty then
  begin
    self.cdsGen.First;
    while not self.cdsGen.Eof do
    begin
      self.cbProcdure.Properties.Items.Add(self.cdsGen.FieldByName('ProcedureName').AsString);
      self.cdsGen.Next;
    end;
  end;
  self.cdsGen.Close;
end;

procedure TfrmSQL.SaveSQL;
var sSqlStr: String;
begin
  try
    if self.cdsSQLModuleName.AsString = '' then
    begin
      showmessage('模块名不能为空！') ;
      exit;
    end;
    if self.cdsSQLClassName.AsString = '' then
    begin
      showmessage('类名不能为空！') ;
      exit;
    end;
    if self.cdsSQLProcedureName.AsString = '' then
    begin
      showmessage('函数名不能为空！') ;
      exit;
    end;
    sSqlStr := 'select SQLID from SQLLibrary where ModuleName = @p1 and '
      + ' ClassName = @p2 and ProcedureName = @p3 and SQLName = @p4' ;
    sSqlStr := StringReplace(sSqlStr,'@p1',QuotedStr(self.cdsSQLModuleName.AsString),[rfIgnoreCase]);
    sSqlStr := StringReplace(sSqlStr,'@p2',QuotedStr(self.cdsSQLClassName.AsString),[rfIgnoreCase]);
    sSqlStr := StringReplace(sSqlStr,'@p3',QuotedStr(self.cdsSQLProcedureName.AsString),[rfIgnoreCase]);
    sSqlStr := StringReplace(sSqlStr,'@p4',QuotedStr(self.cdsSQLSQLName.AsString),[rfIgnoreCase]);
    self.cdsGen.Close;
    self.cdsGen.CommandText := sSqlStr;
    self.cdsGen.Open;
    if not self.cdsGen.IsEmpty then
      if self.cdsGen.FieldByName('SQLID').AsInteger
        <> self.cdsSQLSQLID.AsInteger then
    begin
      showmessage('已存在同名的SQL语句！') ;
      exit;
    end;
    //self.cdsSQL.Post();
    self.cdsSQL.ApplyUpdates(-1);
  except
     on E: Exception do
     begin
       showmessage(E.Message);
     end;
  end;
end;

end.
