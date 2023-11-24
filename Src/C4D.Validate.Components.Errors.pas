unit C4D.Validate.Components.Errors;

interface

uses
  System.SysUtils,
  System.Classes,
  C4D.Validate.Components.ListPair;

type
  TErros = class
  private
    FListPairErros: TListPairStr;
    constructor Create;
  public
    class function GetInstance: TErros;
    destructor Destroy; override;
    procedure Clear;
    procedure Add(const AComponentName, AMsg: string);
    function GetMessages: string;
    function HasErros: Boolean;
    function Count: Integer;
    function GetNameFirstComponent: string;
  end;

implementation

var
  Instance: TErros;

class function TErros.GetInstance: TErros;
begin
  if(not Assigned(Instance))then
    Instance := Self.Create;
  Result := Instance;
end;

constructor TErros.Create;
begin
  FListPairErros := TListPairStr.Create;
end;

destructor TErros.Destroy;
begin
  FListPairErros.Free;
  inherited;
end;

procedure TErros.Clear;
begin
  FListPairErros.Clear;
end;

procedure TErros.Add(const AComponentName, AMsg: string);
begin
  FListPairErros.Add(AComponentName, AMsg);
end;

function TErros.GetMessages: string;
begin
  Result := FListPairErros.GetStringsValues;
end;

function TErros.HasErros: Boolean;
begin
  Result := FListPairErros.Count > 0;
end;

function TErros.Count: Integer;
begin
  Result := FListPairErros.Count;
end;

function TErros.GetNameFirstComponent: string;
begin
  Result := '';

  if(FListPairErros.Count > 0)then
    Result := FListPairErros.Items[0].Key;
end;

initialization

finalization
  if(Assigned(Instance))then
    FreeAndNil(Instance);

end.
