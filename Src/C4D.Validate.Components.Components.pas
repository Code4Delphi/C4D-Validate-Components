unit C4D.Validate.Components.Components;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.ComCtrls,
  Vcl.Forms,
  Vcl.DBCtrls;

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
  try
    if(AComponent is TEdit)then
      Exit(TEdit(AComponent).Text);

    if(AComponent is TMemo)then
      Exit(TMemo(AComponent).Text);

    if(AComponent is TComboBox)then
      Exit(TComboBox(AComponent).Text);

    if(AComponent is TRadioGroup)then
    begin
      if(TRadioGroup(AComponent).ItemIndex >= 0)then
        Result := TRadioGroup(AComponent).Items[TRadioGroup(AComponent).ItemIndex];

      Exit;
    end;

    if(AComponent is TDateTimePicker)then
      Exit(FloatToStr(TDateTimePicker(AComponent).Date));

    //DBWARE
    if(AComponent is TDBEdit)then
      Exit(TDBEdit(AComponent).Field.AsString);

    if(AComponent is TDBMemo)then
      Exit(TDBMemo(AComponent).Field.AsString);

    if(AComponent is TDBComboBox)then
      Exit(TDBComboBox(AComponent).Field.AsString);

    if(AComponent is TDBRadioGroup)then
    begin
      if(TDBRadioGroup(AComponent).ItemIndex >= 0)then
        Result := TDBRadioGroup(AComponent).Items[TDBRadioGroup(AComponent).ItemIndex];

      Exit;
    end;

    raise Exception.Create('Componente não suportado pelo C4D.Validate.Components');
  finally
    Result := Result.Trim;
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
