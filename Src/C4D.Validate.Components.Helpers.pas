unit C4D.Validate.Components.Helpers;

interface

uses
  System.SysUtils,
  System.RTTI;

type
  TRttiFieldyHelper = class helper for TRttiField
  private
    function GetCustomAttribute<T: TCustomAttribute>: T;
  public
    function GetFieldDisplay: string;
    function FormatMsg(const AMsg: string): string;
  end;

implementation

uses
  C4D.Validate.Components.FieldDisplay,
  C4D.Validate.Components.Consts,
  C4D.Validate.Components.Config;

function TRttiFieldyHelper.GetCustomAttribute<T>: T;
var
  LCustomAttribute: TCustomAttribute;
begin
  Result := nil;
  for LCustomAttribute in GetAttributes do
    if LCustomAttribute is T then
      Exit((LCustomAttribute as T));
end;

function TRttiFieldyHelper.GetFieldDisplay: string;
var
  LFieldDisplay: FieldDisplay;
begin
  Result := '';
  if(TC4DValidateComponentsConfig.GetInstance.DisplayComponentNameIfNotFieldDisplay)then
    Result := Self.Name;

  LFieldDisplay := GetCustomAttribute<FieldDisplay>;
  if(LFieldDisplay <> nil)then
    Result := LFieldDisplay.Display;
end;

function TRttiFieldyHelper.FormatMsg(const AMsg: string): string;
var
  LFieldDisplay: string;
begin
  Result := AMsg;
  LFieldDisplay := Self.GetFieldDisplay;

  if(pos(TAG_FIELD_DISPLAY, AMsg) > 0)then
    Result := AMsg.Replace(TAG_FIELD_DISPLAY, LFieldDisplay, [rfReplaceAll, rfIgnoreCase])
  else if(not LFieldDisplay.Trim.IsEmpty)then
    Result := AMsg + Format(' [%s]', [Self.GetFieldDisplay]) ;
end;


end.
