unit uFinanceiro.Model.BaixaDinheiro;

interface

uses
  uFinanceiro.Model.Interfaces, Classes;

type

   TModelBaixaDinheiro = class(TInterfacedPersistent, iBaixaFinanceira)
   private
      FValorBaixa: Double;
   public
      constructor Create;
      destructor Destroy; override;
      class function New: iBaixaFinanceira;
      function ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
      function Processa: string;
   end;


implementation

uses
  SysUtils;

{ TModelBaixaDinheiro }

constructor TModelBaixaDinheiro.Create;
begin

end;

destructor TModelBaixaDinheiro.Destroy;
begin

  inherited;
end;

class function TModelBaixaDinheiro.New: iBaixaFinanceira;
begin
   Result := Self.Create;
end;

function TModelBaixaDinheiro.Processa: string;
begin
   Result := Format('Efetuando pagamento em "Dinheiro" no valor de "R$ %s"', [FormatFloat('#,###.00', Self.FValorBaixa)]);
end;

function TModelBaixaDinheiro.ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
begin
   Result := Self;
   FValorBaixa := pValorBaixa;
end;

end.
