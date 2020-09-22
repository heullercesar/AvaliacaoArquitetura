unit uFinanceiro.Model.BaixaFinanceira.Factory;

interface

uses
  uFinanceiro.Model.Interfaces, TypInfo;

type
   TFuncaoDeCriacao = function: iBaixaFinanceira of object;

   TModelBaixaFinanceiraFactory = class(TInterfacedObject, iBaixaFinanceiraFactory)
   private
   public
      constructor Create;
      destructor Destroy; override;
      class function New: iBaixaFinanceiraFactory;
      function BaixaDinheiro: iBaixaFinanceira;
      function BaixaDebitoEmConta: iBaixaFinanceira;
      function BaixaCreditoAVista: iBaixaFinanceira;
      function BaixaCreditoParcelado: iBaixaFinanceira;
      function BaixaBoleto: iBaixaFinanceira;
      function BaixaDuplicata: iBaixaFinanceira;
   published
      function CriaBaixaPeloNome(pNomeBaixa: string): iBaixaFinanceira;
   end;


implementation

uses
  uFinanceiro.Model.BaixaBoleto, uFinanceiro.Model.BaixaCreditoAVista, 
  uFinanceiro.Model.BaixaCreditoParcelado, 
  uFinanceiro.Model.BaixaDebitoEmConta, uFinanceiro.Model.BaixaDinheiro,
  uFinanceiro.Model.BaixaDuplicata;

{ TModelBaixaFinanceiraFactory }

function TModelBaixaFinanceiraFactory.BaixaBoleto: iBaixaFinanceira;
begin
   Result := TModelBaixaBoleto.New;
end;

function TModelBaixaFinanceiraFactory.BaixaCreditoAVista: iBaixaFinanceira;
begin
   Result := TModelBaixaCreditoAVista.New;
end;

function TModelBaixaFinanceiraFactory.BaixaCreditoParcelado: iBaixaFinanceira;
begin
   Result := TModelBaixaCreditoParcelado.New;
end;

function TModelBaixaFinanceiraFactory.BaixaDebitoEmConta: iBaixaFinanceira;
begin
   Result := TModelBaixaDebitoEmConta.New;
end;

function TModelBaixaFinanceiraFactory.BaixaDinheiro: iBaixaFinanceira;
begin
   Result := TModelBaixaDinheiro.New;
end;

function TModelBaixaFinanceiraFactory.BaixaDuplicata: iBaixaFinanceira;
begin
   Result := TModelBaixaDuplicata.New;
end;

constructor TModelBaixaFinanceiraFactory.Create;
begin

end;

function TModelBaixaFinanceiraFactory.CriaBaixaPeloNome(pNomeBaixa: string): iBaixaFinanceira;
var
   lRotina: TMethod;
   lExec: TFuncaoDeCriacao;
//   a:TRttiContext;
//   RttiContext: TRttiContext;
//   RttiInstanceType: TRttiInstanceType;
//   RttiMethod: TRttiMethod;
//   Instance: TValue;
begin
//   lRotina.Code := Self.MethodAddress(pNomeBaixa);

//   typeinfo(self.BaixaDinheiro);

   lRotina.Data := Pointer(Self);
   lRotina.Code := TModelBaixaFinanceiraFactory.MethodAddress(pNomeBaixa);
   lExec := TFuncaoDeCriacao(lRotina);
   lExec;


//   if Assigned(lRotina.Code) then
//   begin
//      lExec  := TFuncaoDeCriacao(lRotina);
//      Result := lExec;
//   end;
end;

destructor TModelBaixaFinanceiraFactory.Destroy;
begin

  inherited;
end;

class function TModelBaixaFinanceiraFactory.New: iBaixaFinanceiraFactory;
begin
   Result := Self.Create;
end;

initialization
  TModelBaixaFinanceiraFactory.ClassName;

end.
