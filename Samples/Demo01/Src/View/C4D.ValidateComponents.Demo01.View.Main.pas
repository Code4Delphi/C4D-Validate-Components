unit C4D.ValidateComponents.Demo01.View.Main;

{$WARN UNKNOWN_CUSTOM_ATTRIBUTE ERROR}

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
  Vcl.DBCtrls,
  Data.DB,
  Vcl.Mask,
  Datasnap.DBClient,
  C4D.ValidateComponents.Demo01.Utils,
  C4D.Validate.Components;

type
  TC4DValidateComponentsDemo01ViewMain = class(TForm)
    pnBackAll: TPanel;
    pnDemoBack: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;

    [FieldDisplay('Código')]
    [NotEmpty('Campo <FieldDisplay> não pode ficar vazio')]
    edtCode: TEdit;

    [FieldDisplay('Nome')]
    [NotEmpty]
    [Length(5, 15)]
    edtName: TEdit;

    [MinMaxValue(5, 10)]
    edtLimit: TEdit;

    [FieldDisplay('Type')]
    [NotEmpty]
    cBoxType: TComboBox;

    [FieldDisplay('Type Person')]
    [NotEmpty]
    rdGroupTypePerson: TRadioGroup;

    [NotEmpty]
    edtTestWithTabs: TEdit;

    [NotEmpty]
    Memo1: TMemo;

    [NotEmpty]
    [MinMaxDate('01/12/2023', '10/12/2023')]
    DateTimePicker1: TDateTimePicker;

    //DBWARE
    [NotEmpty]
    edtDBCode: TDBEdit;

    [NotEmpty]
    edtDBName: TDBEdit;

    [NotEmpty]
    edtDBLimit: TDBEdit;

    [FieldDisplay('Type')]
    [NotEmpty]
    cBoxDBType: TDBComboBox;

    [FieldDisplay('Type Person')]
    [NotEmpty]
    rdGroupDBTypePerson: TDBRadioGroup;

    [NotEmpty]
    DBMemo1: TDBMemo;
    pnButtons: TPanel;
    btnValidar: TButton;
    [NotEmpty]
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
    Label6: TLabel;
    GroupBox2: TGroupBox;
    btnClearAllFields: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Id: TIntegerField;
    ClientDataSet1Name: TStringField;
    ClientDataSet1TypePerson: TIntegerField;
    ClientDataSet1Observation: TStringField;
    ClientDataSet1Limit: TFloatField;
    ClientDataSet1Check: TStringField;
    ClientDataSet1Type: TStringField;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DataSource1: TDataSource;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PageControl3: TPageControl;
    tabDemo: TTabSheet;
    tabConfig: TTabSheet;
    pnConfigBack: TPanel;
    Label13: TLabel;
    ckConfigDisplayComponentNameIfNotFieldDisplay: TCheckBox;
    cBoxConfigLanguage: TComboBox;
    bntConfigSave: TButton;
    procedure btnValidarClick(Sender: TObject);
    procedure btnClearAllFieldsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bntConfigSaveClick(Sender: TObject);
  private
  public
  end;

var
  C4DValidateComponentsDemo01ViewMain: TC4DValidateComponentsDemo01ViewMain;

implementation

{$R *.dfm}

procedure TC4DValidateComponentsDemo01ViewMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TC4DValidateComponentsDemo01ViewMain.bntConfigSaveClick(Sender: TObject);
begin
  TC4DValidateComponents
    .Config
    .Language(TLanguageDefault(cBoxConfigLanguage.ItemIndex))
    .DisplayComponentNameIfNotFieldDisplay(ckConfigDisplayComponentNameIfNotFieldDisplay.Checked);
end;

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
