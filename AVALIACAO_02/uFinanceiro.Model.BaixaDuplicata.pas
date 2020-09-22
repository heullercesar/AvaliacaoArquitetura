unit uFinanceiro.Model.BaixaDuplicata;

interface

uses
  uFinanceiro.Model.Interfaces;

type

   TModelBaixaDuplicata = class(TInterfacedObject, iBaixaFinanceira)
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

{ TModelBaixaDuplicata }

constructor TModelBaixaDuplicata.Create;
begin

end;

destructor TModelBaixaDuplicata.Destroy;
begin

  inherited;
end;

class function TModelBaixaDuplicata.New: iBaixaFinanceira;
begin
   Result := Self.Create;
end;

function TModelBaixaDuplicata.Processa: string;
begin
   Result := Format('Efetuando pagamento em "Crédito à vista" no valor de "R$ %s"', [FormatFloat('#,###.00', Self.FValorBaixa)]);
end;

function TModelBaixaDuplicata.ValorBaixa(pValorBaixa: Double): iBaixaFinanceira;
begin
   Result := Self;
   FValorBaixa := pValorBaixa;
end;

end.
