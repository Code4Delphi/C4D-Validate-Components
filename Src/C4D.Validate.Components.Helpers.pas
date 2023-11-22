unit C4D.Validate.Components.Helpers;

interface

uses
  System.SysUtils,
  System.RTTI,
  System.TypInfo;

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
  C4D.Validate.Components.FieldDisplay;

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
  Result := ''; //Name;
  LFieldDisplay := GetCustomAttribute<FieldDisplay>;
  if(LFieldDisplay <> nil)then
    Result := LFieldDisplay.Display; //Format(' [%s]', [LFieldDisplay.Display]) ;
end;

function TRttiFieldyHelper.FormatMsg(const AMsg: string): string;
const
  TAG = '<FieldDisplay>';
var
  LFieldDisplay: string;
begin
  Result := AMsg;
  LFieldDisplay := Self.GetFieldDisplay;

  if(pos(TAG, AMsg) > 0)then
    Result := AMsg.Replace(TAG, LFieldDisplay, [rfReplaceAll, rfIgnoreCase])
  else if(not LFieldDisplay.Trim.IsEmpty)then
    Result := AMsg + Format(' [%s]', [Self.GetFieldDisplay]) ;
end;


end.
