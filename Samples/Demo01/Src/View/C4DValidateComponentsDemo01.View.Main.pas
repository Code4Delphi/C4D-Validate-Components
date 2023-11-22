unit C4DValidateComponentsDemo01.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.RTTI,
  C4D.Validate.Components.NotEmpty,
  C4D.Validate.Components.Length,
  C4D.Validate.Components.MinMaxValue,
  Vcl.ComCtrls;

type
  TC4DValidateComponentsDemo01ViewMain = class(TForm)
    pnTudo: TPanel;
    pnTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;

    [NotEmpty]
    edtCodigo: TEdit;

    [NotEmpty]
    [Length(5, 10)] //'Texto deve ter entre <min> e <max> caracteres'
    edtNome: TEdit;


    [NotEmpty]
    [MinMaxValue(5, 10)]
    edtLimite: TEdit;

    [NotEmpty]
    cBoxTipoJuridico: TComboBox;

    [NotEmpty]
    rdGroupSexo: TRadioGroup;

    [NotEmpty]
    edtTesteComAbas: TEdit;

    [NotEmpty]
    Memo1: TMemo;

    ckAtivo: TCheckBox;
    pnBotoes: TPanel;
    btnValidar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    btnClearAllFields: TButton;
    procedure btnValidarClick(Sender: TObject);
    procedure btnClearAllFieldsClick(Sender: TObject);
  private
  public
  end;

var
  C4DValidateComponentsDemo01ViewMain: TC4DValidateComponentsDemo01ViewMain;

implementation

{$R *.dfm}

procedure TC4DValidateComponentsDemo01ViewMain.btnClearAllFieldsClick(Sender: TObject);
var
  i: Integer;
  LComponent: TComponent;
begin
  for i := 0 to Pred(Self.ComponentCount) do
  begin
    LComponent := Self.Components[i];
    if(LComponent is TEdit)then
      TEdit(LComponent).Clear
    else if(LComponent is TComboBox)then
      TComboBox(LComponent).ItemIndex := -1
    else if(LComponent is TCheckBox)then
      TCheckBox(LComponent).Checked := False
    else if(LComponent is TRadioGroup)then
      TRadioGroup(LComponent).ItemIndex := -1
    else if(LComponent is TMemo)then
      TMemo(LComponent).Lines.Clear
  end;
end;

procedure TC4DValidateComponentsDemo01ViewMain.btnValidarClick(Sender: TObject);
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiField: TRttiField;
  LCustomAttribute: TCustomAttribute;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(TC4DValidateComponentsDemo01ViewMain);

    for LRttiField in LRttiType.GetFields do
    begin
      for LCustomAttribute in LRttiField.GetAttributes do
      begin
        if(LCustomAttribute is NotEmpty)then
          NotEmpty(LCustomAttribute).Validar(LRttiField, Self);

        if(LCustomAttribute is Length)then
          Length(LCustomAttribute).Validar(LRttiField, Self);

        if(LCustomAttribute is MinMaxValue)then
          MinMaxValue(LCustomAttribute).Validar(LRttiField, Self);
      end;
    end;
  finally
    LRttiContext.Free;
  end;

  ShowMeSsage('SUCESSO')
end;

end.
