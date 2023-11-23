object C4DValidateComponentsDemo01ViewMain: TC4DValidateComponentsDemo01ViewMain
  Left = 0
  Top = 0
  Caption = 'C4D-validate-components - Demo01'
  ClientHeight = 588
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnTudo: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 588
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnTopo: TPanel
      Left = 0
      Top = 0
      Width = 662
      Height = 543
      Align = alClient
      TabOrder = 0
      ExplicitTop = -2
      object Label1: TLabel
        Left = 24
        Top = 11
        Width = 60
        Height = 13
        Caption = 'Code (TEdit)'
      end
      object Label2: TLabel
        Left = 24
        Top = 51
        Width = 62
        Height = 13
        Caption = 'Name (TEdit)'
      end
      object Label3: TLabel
        Left = 24
        Top = 91
        Width = 65
        Height = 13
        Caption = 'Limit $ (TEdit)'
      end
      object Label4: TLabel
        Left = 24
        Top = 134
        Width = 92
        Height = 13
        Caption = 'Type (TComboBox)'
      end
      object Label6: TLabel
        Left = 24
        Top = 258
        Width = 104
        Height = 13
        Caption = 'Observation (TMemo)'
      end
      object edtCode: TEdit
        Left = 24
        Top = 27
        Width = 601
        Height = 21
        TabOrder = 0
        Text = '10'
      end
      object edtName: TEdit
        Left = 24
        Top = 67
        Width = 601
        Height = 21
        TabOrder = 1
        Text = 'C'#233'sar Cardoso'
      end
      object edtLimit: TEdit
        Left = 24
        Top = 106
        Width = 601
        Height = 21
        TabOrder = 2
        Text = '10,00'
      end
      object cBoxType: TComboBox
        Left = 24
        Top = 152
        Width = 601
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Pessoa F'#237'sica'
          'Pessoa Jur'#237'dica')
      end
      object ckCheck: TCheckBox
        Left = 24
        Top = 179
        Width = 97
        Height = 17
        Caption = 'TCheckBox'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object rdGroupTypePerson: TRadioGroup
        Left = 24
        Top = 202
        Width = 265
        Height = 39
        Caption = ' Type person (TRadioGroup) '
        Columns = 2
        Items.Strings = (
          'Client'
          'Provider')
        TabOrder = 5
      end
      object Memo1: TMemo
        Left = 24
        Top = 276
        Width = 601
        Height = 34
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object PageControl1: TPageControl
        Left = 24
        Top = 318
        Width = 553
        Height = 131
        ActivePage = TabSheet2
        TabOrder = 7
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
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
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 545
            Height = 103
            ActivePage = TabSheet4
            Align = alClient
            TabOrder = 0
            object TabSheet3: TTabSheet
              Caption = 'TabSheet3'
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
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 537
                Height = 75
                Align = alClient
                BevelInner = bvLowered
                TabOrder = 0
                object GroupBox1: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 533
                  Height = 71
                  Align = alClient
                  Caption = 'GroupBox1'
                  TabOrder = 0
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
                  end
                end
              end
            end
          end
        end
      end
      object btnClearAllFields: TButton
        Left = 28
        Top = 489
        Width = 75
        Height = 25
        Caption = 'Clear all fields'
        TabOrder = 8
        OnClick = btnClearAllFieldsClick
      end
    end
    object pnBotoes: TPanel
      Left = 0
      Top = 543
      Width = 662
      Height = 45
      Align = alBottom
      Padding.Left = 3
      Padding.Top = 3
      Padding.Right = 3
      Padding.Bottom = 3
      TabOrder = 1
      object btnValidar: TButton
        Left = 4
        Top = 4
        Width = 168
        Height = 37
        Align = alLeft
        Caption = 'Validate'
        TabOrder = 0
        OnClick = btnValidarClick
      end
    end
  end
end
