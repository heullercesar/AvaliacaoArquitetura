unit uFolhaPagamento.View.Impressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uFolhaPagamento.Model.LayoutImpressao;

type
  TForm1 = class(TForm)
    btnImprimir: TButton;
    edtMesAnoComp: TEdit;
    edtNomeEmpregador: TEdit;
    edtCPFEmpregador: TEdit;
    edtPercFGTSMensal: TEdit;
    edtNomeEmpregado: TEdit;
    edtCPFEmpregado: TEdit;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    function PadL(const S: string; const ComprimentoFinal: integer; const Complemento: string): string;
    function LPad(S: string; Ch: Char; Len: Integer): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnImprimirClick(Sender: TObject);
var
   lArquivo: TextFile; { declarando a variável "arq" do tipo arquivo texto }
   lIndex: integer;
   lImpressao: string;
begin
   try
     { [ 1 ] Associa a variável do programa "arq" ao arquivo externo "tabuada.txt"
            na unidade de disco "d" }
      AssignFile(lArquivo, 'd:\\folhaPagamento.txt');
      Rewrite(lArquivo); { [ 2 ] Cria o arquivo texto "tabuada.txt" na unidade de disco "d" }

      lImpressao := StringReplace(TEXTO_IMPRESSAO, '/*COMPETENCIA*/', LPad(edtMesAnoComp.Text, ' ', 95), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*NOME_EMPREGADOR*/', LPad(edtNomeEmpregador.Text, ' ', 87), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*CPF_EMPREGADOR*/', LPad(edtCPFEmpregador.Text, ' ', 18), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*NOME_EMPREGADO*/', LPad(edtNomeEmpregado.Text, ' ', 87), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*CPF_EMPREGADO*/', LPad(edtCPFEmpregado.Text, ' ', 18), [rfReplaceAll]);

      lImpressao := StringReplace(lImpressao, '/*PERCENTUAL_FGTS_MENSAL*/', LPad('(0,9%)', ' ', 46), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*BASE_CALC_FGTS_MENSAL*/', LPad('R$ 1.000,00', ' ', 31), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*VALOR_RECOLHER_FGTS_MENSAL*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);

      lImpressao := StringReplace(lImpressao, '/*PERCENTUAL_FGTS_COMPENSATORIO*/', LPad('(0,9%)', ' ', 39), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*BASE_CALC_FGTS_COMPENSATORIO*/', LPad('R$ 1.000,00', ' ', 31), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*VALOR_RECOLHER_FGTS_COMPENSATORIO*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);

      lImpressao := StringReplace(lImpressao, '/*PERCENTUAL_CONTRIBUICAO_EMPREGADOR*/', LPad('(0,9%)', ' ', 16), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*BASE_CALC_CONTRIBUICAO_EMPREGADOR*/', LPad('R$ 1.000,00', ' ', 31), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*VALOR_RECOLHER_CONTRIBUICAO_EMPREGADOR*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);

      lImpressao := StringReplace(lImpressao, '/*PERCENTUAL_GILRAT*/', LPad('(0,3%)', ' ', 13), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*BASE_CALC_GILRAT*/', LPad('R$ 1.000,00', ' ', 31), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*VALOR_RECOLHER_GILRAT*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);

      lImpressao := StringReplace(lImpressao, '/*PERCENTUAL_CONTRIBUICAO_EMPREGADO*/', LPad('(0,9%)', ' ', 17), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*BASE_CALC_CONTRIBUICAO_EMPREGADO*/', LPad('R$ 1.000,00', ' ', 31), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*VALOR_RECOLHER_CONTRIBUICAO_EMPREGADO*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);

      lImpressao := StringReplace(lImpressao, '/*VENCIMENTO_SALÁRIO*/', LPad('R$ 1.000,00', ' ', 49), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*VENCIMENTO_VALE_TRANSPORTE*/', LPad('R$ 1.000,00', ' ', 49), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*DESCONTO_INSS*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*TOTAL_VENCIMENTO*/', LPad('R$ 1.000,00', ' ', 31), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*TOTAL_DESCONTO*/', LPad('R$ 1.000,00', ' ', 18), [rfReplaceAll]);
      lImpressao := StringReplace(lImpressao, '/*TOTAL_LÍQUIDO*/', LPad('R$ 1.000,00', ' ', 92), [rfReplaceAll]);

      Writeln(lArquivo, lImpressao); { [ 8 ] Grava uma linha no arquivo }

//      for lIndex:=1 to 10 do
//      begin
//     { [ 8 ] Grava uma linha da tabuada no arquivo }
//        Writeln(lArquivo, '| ', lIndex:2, ' X ', n, ' = ', (lIndex*n):2, ' |');
//      end;
//      Writeln(lArquivo, '+-------------+'); { [ 8 ] Grava uma linha no arquivo }

      CloseFile(lArquivo); { [ 8 ] Fecha o arquivo texto "tabuada.txt". }

      ShowMessage('Tabuada gravada com sucesso em "d:\tabuada.txt".');
   except
   end;
end;

function TForm1.PadL(const S: string; const ComprimentoFinal: integer; const Complemento: string): string;
var
Texto: string;
begin
  Texto := S;
  while Length(Texto) < ComprimentoFinal do
    Texto := Texto + Complemento;
  Result := Copy(Texto, 1, ComprimentoFinal);
end;

function TForm1.LPad(S: string; Ch: Char; Len: Integer): string;
var   RestLen: Integer;
begin   Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

end.
