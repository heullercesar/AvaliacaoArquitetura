program Financeiro;

uses
  Forms,
  uFinanceiro.View.BaixaAPagar in 'uFinanceiro.View.BaixaAPagar.pas' {Form1},
  uFinanceiro.Controller.FormaPagamento in 'uFinanceiro.Controller.FormaPagamento.pas',
  uFinanceiro.Controller.Interfaces in 'uFinanceiro.Controller.Interfaces.pas',
  uFinanceiro.Model.Interfaces in 'uFinanceiro.Model.Interfaces.pas',
  uFinanceiro.Model.BaixaFinanceira in 'uFinanceiro.Model.BaixaFinanceira.pas',
  uFinanceiro.Model.BaixaDebitoEmConta in 'uFinanceiro.Model.BaixaDebitoEmConta.pas',
  uFinanceiro.Model.BaixaCreditoAVista in 'uFinanceiro.Model.BaixaCreditoAVista.pas',
  uFinanceiro.Model.BaixaCreditoParcelado in 'uFinanceiro.Model.BaixaCreditoParcelado.pas',
  uFinanceiro.Model.BaixaBoleto in 'uFinanceiro.Model.BaixaBoleto.pas',
  uFinanceiro.Model.BaixaDuplicata in 'uFinanceiro.Model.BaixaDuplicata.pas',
  uFinanceiro.Model.BaixaFinanceira.Factory in 'uFinanceiro.Model.BaixaFinanceira.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
