program C4DValidateComponentsDemo01;

uses
  Vcl.Forms,
  C4D.ValidateComponents.Demo01.View.Main in 'Src\View\C4D.ValidateComponents.Demo01.View.Main.pas' {C4DValidateComponentsDemo01ViewMain},
  C4D.Validate.Components.Components in '..\..\Src\C4D.Validate.Components.Components.pas',
  C4D.Validate.Components.NotEmpty in '..\..\Src\C4D.Validate.Components.NotEmpty.pas',
  C4D.Validate.Components.Length in '..\..\Src\C4D.Validate.Components.Length.pas',
  C4D.Validate.Components.MinMaxValue in '..\..\Src\C4D.Validate.Components.MinMaxValue.pas',
  C4D.Validate.Components in '..\..\Src\C4D.Validate.Components.pas',
  C4D.Validate.Components.FieldDisplay in '..\..\Src\C4D.Validate.Components.FieldDisplay.pas',
  C4D.Validate.Components.Helpers in '..\..\Src\C4D.Validate.Components.Helpers.pas',
  C4D.ValidateComponents.Demo01.Utils in 'Src\Utils\C4D.ValidateComponents.Demo01.Utils.pas',
  C4D.Validate.Components.MinMaxDate in '..\..\Src\C4D.Validate.Components.MinMaxDate.pas',
  C4D.Validate.Components.Consts in '..\..\Src\C4D.Validate.Components.Consts.pas',
  C4D.Validate.Components.Language in '..\..\Src\C4D.Validate.Components.Language.pas',
  C4D.Validate.Components.Config in '..\..\Src\C4D.Validate.Components.Config.pas',
  C4D.Validate.Components.Types in '..\..\Src\C4D.Validate.Components.Types.pas',
  C4D.Validate.Components.Errors in '..\..\Src\C4D.Validate.Components.Errors.pas',
  C4D.Validate.Components.ListPair in '..\..\Src\C4D.Validate.Components.ListPair.pas',
  C4D.Validate.Components.SetFocus in '..\..\Src\C4D.Validate.Components.SetFocus.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TC4DValidateComponentsDemo01ViewMain, C4DValidateComponentsDemo01ViewMain);
  Application.Run;

end.
