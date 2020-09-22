program uAPIClientes;

uses
  Forms,
  uAPIClientes.View.ManutencaoClientes in 'uAPIClientes.View.ManutencaoClientes.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
