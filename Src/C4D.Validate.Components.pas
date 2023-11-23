unit C4D.Validate.Components;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  Vcl.Forms,
  C4D.Validate.Components.NotEmpty,
  C4D.Validate.Components.Length,
  C4D.Validate.Components.MinMaxValue,
  C4D.Validate.Components.FieldDisplay;

type
  NotEmpty = C4D.Validate.Components.NotEmpty.NotEmpty;
  Length = C4D.Validate.Components.Length.Length;
  MinMaxValue = C4D.Validate.Components.MinMaxValue.MinMaxValue;
  FieldDisplay = C4D.Validate.Components.FieldDisplay.FieldDisplay;

  TC4DValidateComponents = class
  private
  public
    class procedure Validate(AInstanceClass: TComponentClass; const AForm: TForm);
  end;

implementation

class procedure TC4DValidateComponents.Validate(AInstanceClass: TComponentClass; const AForm: TForm);
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiField: TRttiField;
  LCustomAttribute: TCustomAttribute;
begin
  LRttiContext := TRttiContext.Create;
  try
    LRttiType := LRttiContext.GetType(AInstanceClass);

    for LRttiField in LRttiType.GetFields do
    begin
      if(LRttiField.Parent <> LRttiType)then
        Continue;

      for LCustomAttribute in LRttiField.GetAttributes do
      begin
        if(LCustomAttribute is NotEmpty)then
          NotEmpty(LCustomAttribute).Validar(LRttiField, AForm);

        if(LCustomAttribute is Length)then
          Length(LCustomAttribute).Validar(LRttiField, AForm);

        if(LCustomAttribute is MinMaxValue)then
          MinMaxValue(LCustomAttribute).Validar(LRttiField, AForm);
      end;
    end;
  finally
    LRttiContext.Free;
  end;
end;

end.
