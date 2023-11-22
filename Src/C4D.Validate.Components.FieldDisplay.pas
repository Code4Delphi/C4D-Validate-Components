unit C4D.Validate.Components.FieldDisplay;

interface

uses
  System.SysUtils;

type
  FieldDisplay = class(TCustomAttribute)
  private
    FDisplay: String;
  public
    constructor Create(const ADisplay: String);
    property Display: String read FDisplay;
  end;

implementation

constructor FieldDisplay.Create(const ADisplay: String);
begin
  FDisplay := ADisplay;
end;

end.
