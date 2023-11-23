unit C4D.Validate.Components;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  Vcl.Forms,
  C4D.Validate.Components.Types,
  C4D.Validate.Components.Config,
  C4D.Validate.Components.FieldDisplay,
  C4D.Validate.Components.NotEmpty,
  C4D.Validate.Components.Length,
  C4D.Validate.Components.MinMaxValue,
  C4D.Validate.Components.MinMaxDate;

type
  TLanguageDefault = C4D.Validate.Components.Types.TLanguageDefault;
  FieldDisplay = C4D.Validate.Components.FieldDisplay.FieldDisplay;
  NotEmpty = C4D.Validate.Components.NotEmpty.NotEmpty;
  Length = C4D.Validate.Components.Length.Length;
  MinMaxValue = C4D.Validate.Components.MinMaxValue.MinMaxValue;
  MinMaxDate = C4D.Validate.Components.MinMaxDate.MinMaxDate;

  TC4DValidateComponents = class
  private
  public
    class function Config: TC4DValidateComponentsConfig;
    class procedure Validate(AInstanceClass: TComponentClass; const AForm: TForm);
  end;

implementation

class function TC4DValidateComponents.Config: TC4DValidateComponentsConfig;
begin
  Result := TC4DValidateComponentsConfig.GetInstance;
end;

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

        if(LCustomAttribute is MinMaxDate)then
          MinMaxDate(LCustomAttribute).Validar(LRttiField, AForm);
      end;
    end;
  finally
    LRttiContext.Free;
  end;
end;

end.
