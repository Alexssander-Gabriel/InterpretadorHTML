program InterpretadorHTML;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Frm_Interpretador};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Interpretador, Frm_Interpretador);
  Application.Run;
end.
