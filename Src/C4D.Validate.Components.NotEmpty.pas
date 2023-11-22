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
  C4D.Validate.Components.Components;

const
  MSG_PADRAO = 'Campo obrigatório sem preenchimento';

constructor NotEmpty.Create;
begin
  FMsg := MSG_PADRAO;
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
  begin
    TC4DValidateComponentsComponents.SetFocu(LComponent);
    //raise Exception.Create(FMsg + ARttiField.GetFieldDisplay);
    raise Exception.Create(ARttiField.FormatMsg(FMsg));
  end;
end;

end.
