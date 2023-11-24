unit C4D.Validate.Components.NotEmpty;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI;

type
  NotEmpty = class(TCustomAttribute)
  private
    FMsg: string;
  public
    constructor Create; overload;
    constructor Create(const AMsg: string); overload;
    procedure Validar(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

uses
  C4D.Validate.Components.Helpers,
  C4D.Validate.Components.Components,
  C4D.Validate.Components.Language,
  C4D.Validate.Components.Errors;

constructor NotEmpty.Create;
begin
  FMsg := TLanguage.MsgDefaultNotEmpty;
end;

constructor NotEmpty.Create(const AMsg: string);
begin
  FMsg := AMsg;
end;

procedure NotEmpty.Validar(const ARttiField: TRttiField; const AObject: TObject);
var
  LComponent: TComponent;
  LText: string;
begin
  LComponent := (ARttiField.GetValue(AObject).AsObject as TComponent);
  LText := TC4DValidateComponentsComponents.GetTextFromComponent(LComponent);

  if(LText.Trim.IsEmpty)then
    TErros.GetInstance.Add(LComponent.Name, ARttiField.FormatMsg(FMsg));
end;

end.
