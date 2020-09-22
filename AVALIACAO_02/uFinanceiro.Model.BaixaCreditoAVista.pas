unit uFinanceiro.Model.BaixaCreditoAVista;

interface

uses
  uFinanceiro.Model.Interfaces, Classes;

type

   TModelBaixaCreditoAVista = class(TInterfacedObject, iBaixaFinanceira)
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

{ TModelBaixaCreditoAVista }

constructor TModelBaixaCreditoAVista.Create;
begin

end;

destructor TModelBaixaCreditoAVista.Destroy;
begin

  inherited;
end;

class function TModelBaixaCreditoAVista.New: iBaixaFinanceira;
begin
   Result := Self.Create;
end;

function TModelBaixaCreditoAVista.Processa: string;
begin
   Result := Format('Efetuando pagamento em "Crédito à vista" no valor de "R$ %s"', [FormatFloat('#,###.00', Self.FValorBaixa)]);
end;

function TModelBaixaCreditoAVista.ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
begin
   Result := Self;
   FValorBaixa := pValorBaixa;
end;

end.
