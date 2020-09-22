program FolhaPagamento;

uses
  Forms,
  uFolhaPagamento.View.Impressao in 'uFolhaPagamento.View.Impressao.pas' {Form1},
  uFolhaPagamento.Model.LayoutImpressao in 'uFolhaPagamento.Model.LayoutImpressao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
