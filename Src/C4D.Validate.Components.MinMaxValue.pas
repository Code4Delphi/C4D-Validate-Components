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
    constructor Create(const AMinValue: Integer); overload;
    constructor Create(const AMinValue, AMaxValue: Integer); overload;
    constructor Create(const AMinValue: Integer; const AMsg: string); overload;
    constructor Create(const AMinValue, AMaxValue: Integer; const AMsg: string); overload;
    procedure Validar(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

uses
  C4D.Validate.Components.Helpers,
  C4D.Validate.Components.Components,
  C4D.Validate.Components.Consts,
  C4D.Validate.Components.Language;

constructor MinMaxValue.Create(const AMinValue: Integer);
begin
  Self.Create(AMinValue, 0, '');
end;

constructor MinMaxValue.Create(const AMinValue, AMaxValue: Integer);
begin
  Self.Create(AMinValue, AMaxValue, '');
end;

constructor MinMaxValue.Create(const AMinValue: Integer; const AMsg: string);
begin
  Self.Create(AMinValue, 0, AMsg);
end;

constructor MinMaxValue.Create(const AMinValue, AMaxValue: Integer; const AMsg: string);
begin
  FMinValue := AMinValue;
  FMaxValue := AMaxValue;

  if(not AMsg.Trim.IsEmpty)then
    FMsg := AMsg.Trim
  else if(FMinValue > 0)and(FMaxValue > 0)then
    FMsg := TLanguage.MsgDefaultValue
  else if(FMinValue > 0)then
    FMsg := TLanguage.MsgDefaultValueMin
  else if(FMaxValue > 0)then
    FMsg := TLanguage.MsgDefaultValueMax;
end;

function MinMaxValue.GetMsg: string;
begin
  Result := FMsg
    .Replace(TAG_MIN, FMinValue.ToString, [rfReplaceAll, rfIgnoreCase])
    .Replace(TAG_MAX, FMaxValue.ToString, [rfReplaceAll, rfIgnoreCase]);
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
    raise Exception.Create(ARttiField.FormatMsg(Self.GetMsg));
  end;
end;

end.
