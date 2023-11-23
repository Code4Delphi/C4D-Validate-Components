unit C4D.Validate.Components.Language;

interface

uses
  System.SysUtils;

type
  TLanguage = class
  private
    class function IsEnUS: Boolean; static;
  public
    class function MsgDefaultNotEmpty: string;
    class function MsgDefaultLength: string;
    class function MsgDefaultLengthMin: string;
    class function MsgDefaultLengthMax: string;
    class function MsgDefaultValue: string;
    class function MsgDefaultValueMin: string;
    class function MsgDefaultValueMax: string;
    class function MsgDefaultDate: string;
    class function MsgDefaultDateMin: string;
    class function MsgDefaultDateMax: string;

    class function ComponentNotSuported: string;
  end;

implementation

uses
  C4D.Validate.Components.Consts,
  C4D.Validate.Components.Config,
  C4D.Validate.Components.Types;

class function TLanguage.IsEnUS: Boolean;
begin
  Result := TC4DValidateComponentsConfig.GetInstance.Language = TLanguageDefault.enUS;
end;

class function TLanguage.MsgDefaultNotEmpty: string;
begin
  Result := MSG_DEFAULT_NOT_EMPTY_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_NOT_EMPTY_enUS;
end;

class function TLanguage.MsgDefaultLength: string;
begin
  Result := MSG_DEFAULT_LENGTH_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_LENGTH_enUS;
end;

class function TLanguage.MsgDefaultLengthMin: string;
begin
  Result := MSG_DEFAULT_LENGTH_MIN_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_LENGTH_MIN_enUS;
end;

class function TLanguage.MsgDefaultLengthMax: string;
begin
  Result := MSG_DEFAULT_LENGTH_MAX_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_LENGTH_MAX_enUS;
end;

class function TLanguage.MsgDefaultValue: string;
begin
  Result := MSG_DEFAULT_VALUE_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_VALUE_enUS;
end;

class function TLanguage.MsgDefaultValueMin: string;
begin
  Result := MSG_DEFAULT_VALUE_MIN_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_VALUE_MIN_enUS;
end;

class function TLanguage.MsgDefaultValueMax: string;
begin
  Result := MSG_DEFAULT_VALUE_MAX_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_VALUE_MAX_enUS;
end;

class function TLanguage.MsgDefaultDate: string;
begin
  Result := MSG_DEFAULT_DATE_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_DATE_enUS;
end;

class function TLanguage.MsgDefaultDateMin: string;
begin
  Result := MSG_DEFAULT_DATE_MIN_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_DATE_MIN_enUS;
end;

class function TLanguage.MsgDefaultDateMax: string;
begin
  Result := MSG_DEFAULT_DATE_MAX_ptBR;
  if(Self.IsEnUS)then
    Result := MSG_DEFAULT_DATE_MAX_enUS;
end;

class function TLanguage.ComponentNotSuported: string;
begin
  Result := 'Componente não suportado pelo C4D Validate-Components';
  if(Self.IsEnUS)then
    Result := 'Component not supported by C4D Validate-Components';
end;

end.
