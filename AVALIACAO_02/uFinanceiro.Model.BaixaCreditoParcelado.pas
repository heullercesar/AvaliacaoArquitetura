unit uFinanceiro.Model.BaixaCreditoParcelado;

interface

uses
  uFinanceiro.Model.Interfaces;

type

   TModelBaixaCreditoParcelado = class(TInterfacedObject, iBaixaFinanceira)
   private
      FValorBaixa: Double;
      function ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
      function Processa: string;
   public
      constructor Create;
      destructor Destroy; override;
      class function New: iBaixaFinanceira;
   end;


implementation

uses
  SysUtils;

{ TModelBaixaCreditoParcelado }

constructor TModelBaixaCreditoParcelado.Create;
begin

end;

destructor TModelBaixaCreditoParcelado.Destroy;
begin

  inherited;
end;

class function TModelBaixaCreditoParcelado.New: iBaixaFinanceira;
begin
   Result := Self.Create;
end;

function TModelBaixaCreditoParcelado.Processa: string;
begin
   Result := Format('Efetuando pagamento em "Crédito à vista" no valor de "R$ %s"', [FormatFloat('#,###.00', Self.FValorBaixa)]);
end;

function TModelBaixaCreditoParcelado.ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
begin
   Result := Self;
   FValorBaixa := pValorBaixa;
end;

end.
