unit C4D.Validate.Components.Config;

interface

uses
  System.SysUtils,
  C4D.Validate.Components.Types;

type
  TC4DValidateComponentsConfig = class
  private
    FLanguage: TLanguageDefault;
    FDisplayComponentNameIfNotFieldDisplay: Boolean;
    FShowOneErrorAtATime: Boolean;
    constructor Create;
  public
    class function GetInstance: TC4DValidateComponentsConfig;
    function Language: TLanguageDefault; overload;
    function Language(const Value: TLanguageDefault): TC4DValidateComponentsConfig; overload;
    function DisplayComponentNameIfNotFieldDisplay: Boolean; overload;
    function DisplayComponentNameIfNotFieldDisplay(const Value: Boolean): TC4DValidateComponentsConfig; overload;
    function ShowOneErrorAtATime: Boolean; overload;
    function ShowOneErrorAtATime(const Value: Boolean): TC4DValidateComponentsConfig; overload;
  end;

implementation

var
  Instance: TC4DValidateComponentsConfig;

constructor TC4DValidateComponentsConfig.Create;
begin
  FLanguage := TLanguageDefault.ptBR;
  FDisplayComponentNameIfNotFieldDisplay := True;
  FShowOneErrorAtATime := True;
end;

class function TC4DValidateComponentsConfig.GetInstance: TC4DValidateComponentsConfig;
begin
  if(not Assigned(Instance))then
    Instance := Self.Create;
  Result := Instance;
end;

function TC4DValidateComponentsConfig.Language: TLanguageDefault;
begin
  Result := FLanguage;
end;

function TC4DValidateComponentsConfig.Language(const Value: TLanguageDefault): TC4DValidateComponentsConfig;
begin
  Result := Self;
  FLanguage := Value;
end;

function TC4DValidateComponentsConfig.DisplayComponentNameIfNotFieldDisplay: Boolean;
begin
  Result := FDisplayComponentNameIfNotFieldDisplay;
end;

function TC4DValidateComponentsConfig.DisplayComponentNameIfNotFieldDisplay(const Value: Boolean): TC4DValidateComponentsConfig;
begin
  Result := Self;
  FDisplayComponentNameIfNotFieldDisplay := Value;
end;

function TC4DValidateComponentsConfig.ShowOneErrorAtATime: Boolean;
begin
  Result := FShowOneErrorAtATime;
end;

function TC4DValidateComponentsConfig.ShowOneErrorAtATime(const Value: Boolean): TC4DValidateComponentsConfig;
begin
  Result := Self;
  FShowOneErrorAtATime := Value;
end;

initialization

finalization
  if(Assigned(Instance))then
    FreeAndNil(Instance);

end.
