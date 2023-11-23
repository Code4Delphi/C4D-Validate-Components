object C4DValidateComponentsDemo01ViewMain: TC4DValidateComponentsDemo01ViewMain
  Left = 0
  Top = 0
  Caption = 'C4D-validate-components - Demo01'
  ClientHeight = 565
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnTudo: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 565
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 662
    ExplicitHeight = 588
    object pnTopo: TPanel
      Left = 0
      Top = 0
      Width = 643
      Height = 520
      Align = alClient
      TabOrder = 0
      ExplicitLeft = -72
      ExplicitTop = -2
      ExplicitWidth = 652
      ExplicitHeight = 636
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 60
        Height = 13
        Caption = 'Code (TEdit)'
      end
      object Label2: TLabel
        Left = 149
        Top = 11
        Width = 62
        Height = 13
        Caption = 'Name (TEdit)'
      end
      object Label3: TLabel
        Left = 16
        Top = 59
        Width = 65
        Height = 13
        Caption = 'Limit $ (TEdit)'
      end
      object Label4: TLabel
        Left = 149
        Top = 56
        Width = 92
        Height = 13
        Caption = 'Type (TComboBox)'
      end
      object Label6: TLabel
        Left = 287
        Top = 118
        Width = 104
        Height = 13
        Caption = 'Observation (TMemo)'
      end
      object Label12: TLabel
        Left = 440
        Top = 56
        Width = 23
        Height = 13
        Caption = 'Date'
      end
      object edtCode: TEdit
        Left = 17
        Top = 27
        Width = 129
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        Text = '10'
      end
      object edtName: TEdit
        Left = 149
        Top = 27
        Width = 468
        Height = 21
        TabOrder = 1
        Text = 'C'#233'sar Cardoso'
      end
      object edtLimit: TEdit
        Left = 17
        Top = 74
        Width = 129
        Height = 21
        TabOrder = 2
        Text = '10,00'
      end
      object cBoxType: TComboBox
        Left = 149
        Top = 74
        Width = 287
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = 'Normal'
        Items.Strings = (
          'Normal'
          'Priority')
      end
      object ckCheck: TCheckBox
        Left = 16
        Top = 107
        Width = 97
        Height = 17
        Caption = 'TCheckBox'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object rdGroupTypePerson: TRadioGroup
        Left = 16
        Top = 130
        Width = 265
        Height = 39
        Caption = ' Type person (TRadioGroup) '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Client'
          'Provider')
        TabOrder = 5
      end
      object Memo1: TMemo
        Left = 287
        Top = 134
        Width = 330
        Height = 34
        Lines.Strings = (
          'Test')
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object PageControl1: TPageControl
        Left = 16
        Top = 183
        Width = 601
        Height = 131
        ActivePage = TabSheet2
        TabOrder = 7
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          ExplicitWidth = 545
          object Edit2: TEdit
            Left = 32
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 0
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          ExplicitWidth = 545
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 593
            Height = 103
            ActivePage = TabSheet4
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 545
            object TabSheet3: TTabSheet
              Caption = 'TabSheet3'
              ExplicitWidth = 537
              object Edit1: TEdit
                Left = 32
                Top = 32
                Width = 121
                Height = 21
                TabOrder = 0
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'TabSheet4'
              ImageIndex = 1
              ExplicitWidth = 537
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 585
                Height = 75
                Align = alClient
                BevelInner = bvLowered
                TabOrder = 0
                ExplicitWidth = 537
                object GroupBox1: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 581
                  Height = 71
                  Align = alClient
                  Caption = 'GroupBox1'
                  TabOrder = 0
                  ExplicitWidth = 533
                  object Label5: TLabel
                    Left = 11
                    Top = 15
                    Width = 121
                    Height = 13
                    Caption = 'Test with tabs (TEdit)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edtTestWithTabs: TEdit
                    Left = 11
                    Top = 32
                    Width = 345
                    Height = 21
                    TabOrder = 0
                    Text = 'Coffee'
                  end
                end
              end
            end
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 335
        Width = 641
        Height = 184
        Align = alBottom
        Caption = ' Components DBWare '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        ExplicitTop = 424
        object Label7: TLabel
          Left = 15
          Top = 19
          Width = 73
          Height = 13
          Caption = 'Code (TDBEdit)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 149
          Top = 19
          Width = 75
          Height = 13
          Caption = 'Name (TDBEdit)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 15
          Top = 70
          Width = 69
          Height = 13
          Caption = 'Limit (TDBEdit)'
          Color = clBtnFace
          FocusControl = edtDBLimit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label10: TLabel
          Left = 149
          Top = 70
          Width = 99
          Height = 13
          Caption = 'Type (DBComboBox)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label11: TLabel
          Left = 247
          Top = 114
          Width = 117
          Height = 13
          Caption = 'Observation (TDBMemo)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object edtDBCode: TDBEdit
          Left = 17
          Top = 37
          Width = 129
          Height = 21
          DataField = 'Id'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtDBName: TDBEdit
          Left = 149
          Top = 37
          Width = 467
          Height = 21
          DataField = 'Name'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtDBLimit: TDBEdit
          Left = 17
          Top = 86
          Width = 129
          Height = 21
          DataField = 'Limit'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object cBoxDBType: TDBComboBox
          Left = 149
          Top = 86
          Width = 467
          Height = 21
          DataField = 'Type'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Normal'
            'Priority')
          ParentFont = False
          TabOrder = 3
        end
        object rdGroupDBTypePerson: TDBRadioGroup
          Left = 15
          Top = 115
          Width = 224
          Height = 49
          Caption = ' Tipe Person (DBRadioGroup)'
          Color = clBtnFace
          Columns = 2
          DataField = 'TypePerson'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Client'
            'Provider')
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          Values.Strings = (
            '1'
            '2')
        end
        object DBMemo1: TDBMemo
          Left = 245
          Top = 129
          Width = 371
          Height = 34
          DataField = 'Observation'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object DateTimePicker1: TDateTimePicker
        Left = 440
        Top = 73
        Width = 177
        Height = 21
        Date = 45253.000000000000000000
        Time = 0.453400254627922600
        TabOrder = 9
      end
    end
    object pnBotoes: TPanel
      Left = 0
      Top = 520
      Width = 643
      Height = 45
      Align = alBottom
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      ExplicitTop = 642
      ExplicitWidth = 652
      object btnValidar: TButton
        Left = 153
        Top = 4
        Width = 162
        Height = 37
        Align = alLeft
        Caption = 'Validate'
        TabOrder = 0
        OnClick = btnValidarClick
        ExplicitLeft = 159
      end
      object btnClearAllFields: TButton
        Left = 4
        Top = 4
        Width = 149
        Height = 37
        Align = alLeft
        Caption = 'Clear all fields'
        TabOrder = 1
        OnClick = btnClearAllFieldsClick
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      B20000009619E0BD010000001800000007000000000003000000B20002496404
      00010000000000044E616D650100490000000100055749445448020002006400
      0A54797065506572736F6E04000100000000000B4F62736572766174696F6E01
      00490000000100055749445448020002006400054C696D697408000400000000
      0005436865636B01004900000001000557494454480200020005000454797065
      01004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 540
    Top = 351
    object ClientDataSet1Id: TIntegerField
      FieldName = 'Id'
    end
    object ClientDataSet1Name: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object ClientDataSet1TypePerson: TIntegerField
      FieldName = 'TypePerson'
    end
    object ClientDataSet1Observation: TStringField
      FieldName = 'Observation'
      Size = 100
    end
    object ClientDataSet1Limit: TFloatField
      FieldName = 'Limit'
      DisplayFormat = ',,0.00'
    end
    object ClientDataSet1Check: TStringField
      FieldName = 'Check'
      Size = 5
    end
    object ClientDataSet1Type: TStringField
      FieldName = 'Type'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 539
    Top = 394
  end
end
