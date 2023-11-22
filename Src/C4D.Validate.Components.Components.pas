unit C4D.Validate.Components.Components;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.ComCtrls,
  Vcl.Forms;

type
  TC4DValidateComponentsComponents = class
  private
  public
    class function GetTextFromComponent(const AComponent: TComponent): string;
    class procedure SetFocu(const AComponent: TComponent);
  end;

implementation

class function TC4DValidateComponentsComponents.GetTextFromComponent(const AComponent: TComponent): string;
begin
  Result := '';
  if(AComponent is TEdit)then
    Result := Trim((AComponent as TEdit).Text)
  else if(AComponent is TComboBox)then
    Result := Trim((AComponent as TComboBox).Text)
  else if(AComponent is TMemo)then
    Result := Trim((AComponent as TMemo).Text)
  else if(AComponent is TRadioGroup)then
  begin
    if(TRadioGroup(AComponent).ItemIndex >= 0)then
      Result := TRadioGroup(AComponent).Items[TRadioGroup(AComponent).ItemIndex];
  end;
end;

class procedure TC4DValidateComponentsComponents.SetFocu(const AComponent: TComponent);
var
  LParent: TComponent;
begin
  if not(AComponent is TWinControl)then
    Exit;

  LParent := TWinControl(AComponent).Parent;
  while(LParent <> nil)and(LParent.ClassParent <> TForm)do
  begin
    if(LParent is TTabSheet)then
      if(not TTabSheet(LParent).Showing)then
        TTabSheet(LParent).Show;
    LParent := TWinControl(LParent).Parent;
  end;

  if(TWinControl(AComponent).CanFocus)then
    TWinControl(AComponent).SetFocus;
end;

end.
