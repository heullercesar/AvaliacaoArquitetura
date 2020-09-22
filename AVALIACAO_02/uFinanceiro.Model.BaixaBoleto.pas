unit uFinanceiro.Model.BaixaBoleto;

interface

uses
  uFinanceiro.Model.Interfaces;

type

   TModelBaixaBoleto = class(TInterfacedObject, iBaixaFinanceira)
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

{ TModelBaixaBoleto }

constructor TModelBaixaBoleto.Create;
begin

end;

destructor TModelBaixaBoleto.Destroy;
begin

  inherited;
end;

class function TModelBaixaBoleto.New: iBaixaFinanceira;
begin
   Result := Self.Create;
end;

function TModelBaixaBoleto.Processa: string;
begin
   Result := Format('Efetuando pagamento em "Crédito à vista" no valor de "R$ %s"', [FormatFloat('#,###.00', Self.FValorBaixa)]);
end;

function TModelBaixaBoleto.ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
begin
   Result := Self;
   FValorBaixa := pValorBaixa;
end;

end.
