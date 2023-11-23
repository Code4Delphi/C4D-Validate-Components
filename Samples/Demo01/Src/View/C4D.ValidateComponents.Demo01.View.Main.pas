unit C4D.ValidateComponents.Demo01.View.Main;

interface

uses
  Winapi.Windows,

  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  C4D.ValidateComponents.Demo01.Utils,
  C4D.Validate.Components;

type
  TC4DValidateComponentsDemo01ViewMain = class(TForm)
    pnTudo: TPanel;
    pnTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;

    [FieldDisplay('Código')]
    [NotEmpty('Campo <FieldDisplay> não pode ficar vazio')]
    edtCode: TEdit;

    [FieldDisplay('Nome')]
    [NotEmpty]
    [Length(5, 10)]
    edtName: TEdit;

    [NotEmpty]
    [MinMaxValue(5, 10)]
    edtLimit: TEdit;

    [NotEmpty]
    cBoxType: TComboBox;

    [NotEmpty]
    rdGroupTypePerson: TRadioGroup;

    [NotEmpty]
    edtTestWithTabs: TEdit;

    [NotEmpty]
    Memo1: TMemo;

    ckCheck: TCheckBox;
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
    Label6: TLabel;
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
begin
  TUtils.ClearAllFieldsForm(Self);
end;

procedure TC4DValidateComponentsDemo01ViewMain.btnValidarClick(Sender: TObject);
begin
  TC4DValidateComponents.Validate(TC4DValidateComponentsDemo01ViewMain, Self);
  ShowMeSsage('SUCESSO');
end;

end.
