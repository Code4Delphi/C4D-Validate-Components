unit C4D.Validate.Components.MinMaxValue;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI;

type
  MinMaxValue = class(TCustomAttribute)
  private
    FMinValue: Integer;
    FMaxValue: Integer;
    FMsg: string;
    function GetMsg: string;
  public
    constructor Create(const AMinValue, AMaxValue: Integer; const AMsg: string = '');
    procedure Validar(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

uses
  C4D.Validate.Components.Helpers,
  C4D.Validate.Components.Components;

const
  MSG_PADRAO = 'Campo deve ter um valor entre <min> e <max>';
  MSG_PADRAO_MIN = 'Campo deve ter um valor mínimo de <min>';
  MSG_PADARO_MAX = 'Campo deve ter um valor máximo de <max>';

constructor MinMaxValue.Create(const AMinValue, AMaxValue: Integer; const AMsg: string = '');
begin
  FMinValue := AMinValue;
  FMaxValue := AMaxValue;

  if(not AMsg.Trim.IsEmpty)then
    FMsg := AMsg.Trim
  else if(FMinValue > 0)and(FMaxValue > 0)then
    FMsg := MSG_PADRAO
  else if(FMinValue > 0)then
    FMsg := MSG_PADRAO_MIN
  else if(FMaxValue > 0)then
    FMsg := MSG_PADARO_MAX;
end;

function MinMaxValue.GetMsg: string;
begin
  Result := FMsg
    .Replace('<min>', FMinValue.ToString, [rfReplaceAll, rfIgnoreCase])
    .Replace('<max>', FMaxValue.ToString, [rfReplaceAll, rfIgnoreCase]);
end;

procedure MinMaxValue.Validar(const ARttiField: TRttiField; const AObject: TObject);
var
  LComponent: TComponent;
  LText: string;
  LValue: Double;
begin
  LComponent := (ARttiField.GetValue(AObject).AsObject as TComponent);
  LText := TC4DValidateComponentsComponents.GetTextFromComponent(LComponent);
  LValue := StrToFloatDef(LText, 0);
  if(LValue < FMinValue)or((FMaxValue > 0)and(LValue > FMaxValue))then
  begin
    TC4DValidateComponentsComponents.SetFocu(LComponent);
    raise Exception.Create(Self.GetMsg + ARttiField.GetFieldDisplay);
  end;
end;

end.
