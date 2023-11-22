unit C4D.Validate.Components.NotEmpty;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  C4D.Validate.Components.Components;

type
  NotEmpty = class(TCustomAttribute)
  private
  public
    procedure Validar(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

const
  MSG_OBG = 'Campo obrigatório sem preenchimento';

procedure NotEmpty.Validar(const ARttiField: TRttiField; const AObject: TObject);
var
  LComponent: TComponent;
  LText: string;
begin
  LComponent := (ARttiField.GetValue(AObject).AsObject as TComponent);
  LText := TC4DValidateComponentsComponents.GetTextFromComponent(LComponent);

  if(LText.Trim.IsEmpty)then
  begin
    TC4DValidateComponentsComponents.SetFocu(LComponent);
    raise Exception.Create(MSG_OBG);
  end;
end;

end.
