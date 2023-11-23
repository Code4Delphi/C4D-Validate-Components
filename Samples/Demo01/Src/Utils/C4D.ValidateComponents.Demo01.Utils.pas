unit C4D.ValidateComponents.Demo01.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.DBCtrls;

type
  TUtils = class
  public
    class procedure ClearAllFieldsForm(const AForm: TForm);
  end;

implementation

class procedure TUtils.ClearAllFieldsForm(const AForm: TForm);
var
  i: Integer;
  LComponent: TComponent;
begin
  for i := 0 to Pred(AForm.ComponentCount) do
  begin
    LComponent := AForm.Components[i];
    if(LComponent is TEdit)then
      TEdit(LComponent).Clear
    else if(LComponent is TMemo)then
      TMemo(LComponent).Lines.Clear
    else if(LComponent is TComboBox)then
      TComboBox(LComponent).ItemIndex := -1
    else if(LComponent is TRadioGroup)then
      TRadioGroup(LComponent).ItemIndex := -1
    else if(LComponent is TCheckBox)then
      TCheckBox(LComponent).Checked := False
    //DBWARE
    else if(LComponent is TDBEdit)then
      TDBEdit(LComponent).Field.Clear
    else if(LComponent is TDBMemo)then
      TDBMemo(LComponent).Field.Clear
    else if(LComponent is TDBComboBox)then
      TDBComboBox(LComponent).Field.Clear
    else if(LComponent is TDBRadioGroup)then
      TDBRadioGroup(LComponent).Field.Clear;
  end;
end;

end.
