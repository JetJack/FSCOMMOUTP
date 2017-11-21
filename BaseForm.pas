unit BaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem, Privilege;

type
  TfrmBase = class(TdxRibbonForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    User: TOperator;
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

end.
