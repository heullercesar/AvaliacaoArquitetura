unit uFinanceiro.Model.Interfaces;

interface

type
   iBaixaFinanceira = interface
      ['{4239411B-D013-4773-80E1-EB40CF167E41}']
      function ValorBaixa(pValorPagamento: Double): iBaixaFinanceira;
      function Processa: string;
   end;

   iBaixaFinanceiraFactory = interface
      ['{9F66CF2C-560D-40D2-8FF9-9D6BB1C6F880}']
      function BaixaDinheiro: iBaixaFinanceira;
      function BaixaDebitoEmConta: iBaixaFinanceira;
      function BaixaCreditoAVista: iBaixaFinanceira;
      function BaixaCreditoParcelado: iBaixaFinanceira;
      function BaixaBoleto: iBaixaFinanceira;
      function BaixaDuplicata: iBaixaFinanceira;
      function CriaBaixaPeloNome(pNomeBaixa: string): iBaixaFinanceira;
   end;

implementation

end.
