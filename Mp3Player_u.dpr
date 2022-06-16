program Mp3Player_u;

uses
  Vcl.Forms,
  Mp3Player_p in 'Mp3Player_p.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
