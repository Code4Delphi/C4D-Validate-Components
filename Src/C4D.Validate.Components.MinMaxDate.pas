unit C4D.Validate.Components.MinMaxDate;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI;

type
  MinMaxDate = class(TCustomAttribute)
  private
    FMinDate: TDate;
    FMaxDate: TDate;
    FMsg: string;
    function GetMsg: string;
  public
    constructor Create(const AMinDate, AMaxDate: string; const AMsg: string = '');
    procedure Validar(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

uses
  C4D.Validate.Components.Helpers,
  C4D.Validate.Components.Components,
  C4D.Validate.Components.Consts,
  C4D.Validate.Components.Language;

constructor MinMaxDate.Create(const AMinDate, AMaxDate: string; const AMsg: string = '');
begin
  FMinDate := StrToDateDef(AMinDate, 0);
  FMaxDate := StrToDateDef(AMaxDate, 0);

  if(not AMsg.Trim.IsEmpty)then
    FMsg := AMsg.Trim
  else if(FMinDate > 0)and(FMaxDate > 0)then
    FMsg := TLanguage.MsgDefaultDate
  else if(FMinDate > 0)then
    FMsg := TLanguage.MsgDefaultDateMin
  else if(FMaxDate > 0)then
    FMsg := TLanguage.MsgDefaultDateMax;
end;

function MinMaxDate.GetMsg: string;
begin
  Result := FMsg
    .Replace(TAG_MIN, DateToStr(FMinDate), [rfReplaceAll, rfIgnoreCase])
    .Replace(TAG_MAX, DateToStr(FMaxDate), [rfReplaceAll, rfIgnoreCase]);
end;

procedure MinMaxDate.Validar(const ARttiField: TRttiField; const AObject: TObject);
var
  LComponent: TComponent;
  LText: string;
  LDate: TDate;
begin
  LComponent := (ARttiField.GetValue(AObject).AsObject as TComponent);
  LText := TC4DValidateComponentsComponents.GetTextFromComponent(LComponent);
  LDate := StrToDateDef(LText, 0);
  if(LDate < FMinDate)or((FMaxDate > 0)and(LDate > FMaxDate))then
  begin
    TC4DValidateComponentsComponents.SetFocu(LComponent);
    raise Exception.Create(ARttiField.FormatMsg(Self.GetMsg));
  end;
end;

end.
