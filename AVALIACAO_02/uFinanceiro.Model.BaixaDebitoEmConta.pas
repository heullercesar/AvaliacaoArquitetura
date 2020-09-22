unit uFinanceiro.Model.BaixaDebitoEmConta;

interface

uses
  uFinanceiro.Model.Interfaces, Classes;

type

   TModelBaixaDebitoEmConta = class(TInterfacedObject, iBaixaFinanceira)
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

{ TModelBaixaDebitoEmConta }

constructor TModelBaixaDebitoEmConta.Create;
begin

end;

destructor TModelBaixaDebitoEmConta.Destroy;
begin

  inherited;
end;

class function TModelBaixaDebitoEmConta.New: iBaixaFinanceira;
begin
   Result := Self.Create;
end;

function TModelBaixaDebitoEmConta.Processa: string;
begin
   Result := Format('Efetuando pagamento em "Débito em conta" no valor de "R$ %s"', [FormatFloat('#,###.00', Self.FValorBaixa)]);
end;

function TModelBaixaDebitoEmConta.ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
begin
   Result := Self;
   FValorBaixa := pValorBaixa;
end;

end.
