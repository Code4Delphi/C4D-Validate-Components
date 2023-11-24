unit C4D.Validate.Components.SetFocus;

interface

uses
  System.SysUtils,
  System.RTTI,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.ComCtrls;

type
  TRttiSetFocus = class
  private
    class procedure SetFocusComponent(const AWinControl: TWinControl);
  public
    class procedure SetFocusComponentName(const AForm: TForm; const AComponentName: string);
  end;

implementation

class procedure TRttiSetFocus.SetFocusComponentName(const AForm: TForm; const AComponentName: string);
var
  LComponent: TComponent;
begin
  LComponent := AForm.FindComponent(AComponentName);
  if(LComponent is TWinControl)then
    SetFocusComponent(TWinControl(LComponent));
end;

class procedure TRttiSetFocus.SetFocusComponent(const AWinControl: TWinControl);
var
  LParent: TComponent;
begin
  LParent := TWinControl(AWinControl).Parent;
  while(LParent.ClassParent <> TForm)do
  begin
    if(LParent is TTabSheet)then
      if(not TTabSheet(LParent).Showing)then
        TTabSheet(LParent).Show;

    LParent := TWinControl(LParent).Parent;
  end;

  try
    if(TWinControl(AWinControl).CanFocus)then
      TWinControl(AWinControl).SetFocus;
  except
  end;
end;

end.
