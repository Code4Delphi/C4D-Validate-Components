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
  C4D.Validate.Components.Components;

const
  MSG_PADRAO = 'Campo deve ter entre <min> e <max> caracteres';
  MSG_PADRAO_MIN = 'Campo deve ter ao menos <min> caracteres';
  MSG_PADARO_MAX = 'Campo deve ter no máximo <max> caracteres';

constructor Length.Create(const AMinLength, AMaxLength: Integer; const AMsg: string = '');
begin
  FMinLength := AMinLength;
  FMaxLength := AMaxLength;

  if(not AMsg.Trim.IsEmpty)then
    FMsg := AMsg.Trim
  else if(FMinLength > 0)and(FMaxLength > 0)then
    FMsg := MSG_PADRAO
  else if(FMinLength > 0)then
    FMsg := MSG_PADRAO_MIN
  else if(FMaxLength > 0)then
    FMsg := MSG_PADARO_MAX;
end;

function Length.GetMsg: string;
begin
  Result := FMsg
    .Replace('<min>', FMinLength.ToString, [rfReplaceAll, rfIgnoreCase])
    .Replace('<max>', FMaxLength.ToString, [rfReplaceAll, rfIgnoreCase]);
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
