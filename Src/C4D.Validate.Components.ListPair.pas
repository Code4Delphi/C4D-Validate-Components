unit C4D.Validate.Components.ListPair;

interface

uses
  System.Types,
  System.SysUtils,
  System.Classes,
  System.Generics.Defaults,
  System.Generics.Collections;

type
  TListPair<TKey, TValue> = class(TList<TPair<TKey, TValue>>)
  protected
    FKeyComparer: IComparer<TKey>;
    FValueComparer: IComparer<TValue>;
    function GetValue(Key: TKey): TValue;
    procedure SetValue(Key: TKey; const Value: TValue);
    function ComparePair(const Left, Right: TPair<TKey, TValue>): Integer;
  public
    constructor Create; overload;
    procedure Add(const AKey: TKey; const aValue: TValue); overload;
    function IndexOfKey(const AKey: TKey): Integer;
    function ContainsKey(const AKey: TKey): Boolean; inline;
    property Values[Key: TKey]: TValue read GetValue write SetValue;
  end;

  TListPairStr = class(TListPair<string, string>);

  TListPairStrHelper = class helper for TListPairStr
    procedure FillStringsWithValues(const AStrings: TStrings);
    function GetStringsValues: string;
  end;

implementation

constructor TListPair<TKey, TValue>.Create;
begin
  if(FKeyComparer = nil)then
    FKeyComparer := TComparer<TKey>.Default;
  if(FValueComparer = nil)then
    FValueComparer := TComparer<TValue>.Default;
  inherited Create(TDelegatedComparer <TPair<TKey, TValue>>.Create(ComparePair));
end;

function TListPair<TKey, TValue>.ComparePair(const Left, Right: TPair<TKey, TValue>): Integer;
begin
  Result := FKeyComparer.Compare(Left.Key, Right.Key);
  if(Result = 0)then
    Result := FValueComparer.Compare(Left.Value, Right.Value);
end;

function TListPair<TKey, TValue>.IndexOfKey(const AKey: TKey): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    if(FKeyComparer.Compare(Items[i].Key, AKey) = 0)then
    begin
      Result := i;
      break;
    end;
  end;
end;

function TListPair<TKey, TValue>.ContainsKey(const AKey: TKey): Boolean;
begin
  Result := IndexOfKey(AKey) >= 0;
end;

function TListPair<TKey, TValue>.GetValue(Key: TKey): TValue;
var
  i: Integer;
begin
  i := IndexOfKey(Key);
  if(i >= 0)then
    Result := Items[i].Value
  else
    Result := default(TValue);
end;

procedure TListPair<TKey, TValue>.Add(const AKey: TKey; const aValue: TValue);
begin
  SetValue(AKey, aValue);
end;

procedure TListPair<TKey, TValue>.SetValue(Key: TKey; const Value: TValue);
begin
  inherited Add(TPair<TKey, TValue>.Create(Key, Value));
end;

{ TListPairStrHelper }
procedure TListPairStrHelper.FillStringsWithValues(const AStrings: TStrings);
var
  LPairErro: TPair<string, string>;
begin
  if(Self.Count > 0)then
    for LPairErro in Self do
      AStrings.Add('* ' + LPairErro.Value);
end;

function TListPairStrHelper.GetStringsValues: string;
var
  LPairErro: TPair<string, string>;
begin
  Result := '';
  if(Self.Count > 0)then
    for LPairErro in Self do
      Result := Result + '* ' + LPairErro.Value + sLineBreak;
end;

end.
