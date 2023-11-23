unit C4D.Validate.Components.Length;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI;

type
  Length = class(TCustomAttribute)
  private
    FMinLength: Integer;
    FMaxLength: Integer;
    FMsg: string;
    function GetMsg: string;
  public
    constructor Create(const AMinLength, AMaxLength: Integer; const AMsg: string = '');
    procedure Validar(const ARttiField: TRttiField; const AObject: TObject);
  end;

implementation

uses
  C4D.Validate.Components.Helpers,
  C4D.Validate.Components.Components,
  C4D.Validate.Components.Consts,
  C4D.Validate.Components.Language;

constructor Length.Create(const AMinLength, AMaxLength: Integer; const AMsg: string = '');
begin
  FMinLength := AMinLength;
  FMaxLength := AMaxLength;

  if(not AMsg.Trim.IsEmpty)then
    FMsg := AMsg.Trim
  else if(FMinLength > 0)and(FMaxLength > 0)then
    FMsg := TLanguage.MsgDefaultLength
  else if(FMinLength > 0)then
    FMsg := TLanguage.MsgDefaultLengthMin
  else if(FMaxLength > 0)then
    FMsg := TLanguage.MsgDefaultLengthMax;
end;

function Length.GetMsg: string;
begin
  Result := FMsg
    .Replace(TAG_MIN, FMinLength.ToString, [rfReplaceAll, rfIgnoreCase])
    .Replace(TAG_MAX, FMaxLength.ToString, [rfReplaceAll, rfIgnoreCase]);
end;

procedure Length.Validar(const ARttiField: TRttiField; const AObject: TObject);
var
  LComponent: TComponent;
  LText: string;
  LLength: Integer;
begin
  LComponent := (ARttiField.GetValue(AObject).AsObject as TComponent);
  LText := TC4DValidateComponentsComponents.GetTextFromComponent(LComponent);
  LLength := LText.Length;
  if(LLength < FMinLength)or((FMaxLength > 0)and(LLength > FMaxLength))then
  begin
    TC4DValidateComponentsComponents.SetFocu(LComponent);
    raise Exception.Create(ARttiField.FormatMsg(Self.GetMsg));
  end;
end;

end.
