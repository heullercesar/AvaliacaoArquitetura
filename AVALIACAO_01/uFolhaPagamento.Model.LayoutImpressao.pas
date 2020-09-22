unit uFolhaPagamento.Model.LayoutImpressao;

interface


const
   TEXTO_IMPRESSAO =
      ' ____________________________________________________________________________________________________________ ' + sLineBreak +
      '| COMPETÊNCIA /*COMPETENCIA*/|'                                                                                 + sLineBreak +
      '|                                                                                                            |' + sLineBreak +
      '| EMPREGADOR                                                                             CPF                 |' + sLineBreak +
      '|   /*NOME_EMPREGADOR*//*CPF_EMPREGADOR*/|'                                                                     + sLineBreak +
      '|                                                                                                            |' + sLineBreak +
      '| EMPREGADO                                                                              CPF                 |' + sLineBreak +
      '|   /*NOME_EMPREGADO*//*CPF_EMPREGADO*/|'                                                                       + sLineBreak +
      '|____________________________________________________________________________________________________________|' + sLineBreak +
      '|                                     DEMONSTRATIVOS DE VALORES DEVIDOS                                      |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| DESCRIÇÃO                                                 BASE                           VALOR A           |' + sLineBreak +
      '|                                                           DE CÁLCULO                     RECOLHER          |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| FGTS Mensal /*PERCENTUAL_FGTS_MENSAL*//*BASE_CALC_FGTS_MENSAL*//*VALOR_RECOLHER_FGTS_MENSAL*/|'               + sLineBreak +

      '| FGTS Compensatório /*PERCENTUAL_FGTS_COMPENSATORIO*/'                                                         +
                           '/*BASE_CALC_FGTS_COMPENSATORIO*/'                                                          +
                           '/*VALOR_RECOLHER_FGTS_COMPENSATORIO*/|'                                                    + sLineBreak +

      '| Contribuição Previdenciária do Empregador /*PERCENTUAL_CONTRIBUICAO_EMPREGADOR*/'                             +
                                                  '/*BASE_CALC_CONTRIBUICAO_EMPREGADOR*/'                              +
                                                  '/*VALOR_RECOLHER_CONTRIBUICAO_EMPREGADOR*/|'                        + sLineBreak +

      '| Seguro contra Acidentes de Trabalho - GILRAT /*PERCENTUAL_GILRAT*/'                                           +
                                                     '/*BASE_CALC_GILRAT*/'                                            +
                                                     '/*VALOR_RECOLHER_GILRAT*/|'                                      + sLineBreak +

      '| Contribuição Previdenciária do Empregado /*PERCENTUAL_CONTRIBUICAO_EMPREGADO*/'                               +
                                                 '/*BASE_CALC_CONTRIBUICAO_EMPREGADO*/'                                +
                                                 '/*VALOR_RECOLHER_CONTRIBUICAO_EMPREGADO*/|'                          + sLineBreak +

      '|____________________________________________________________________________________________________________|' + sLineBreak +
      '|                                              RECIBO DE SALÁRIO                                             |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| DESCRIÇÃO                                                 VENCIMENTO                     DESCONTO          |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| Salário                                                   /*VENCIMENTO_SALÁRIO*/|'                            + sLineBreak +
      '| Vale-Transporte - Adiantamento pago em dinheiro           /*VENCIMENTO_VALE_TRANSPORTE*/|'                    + sLineBreak +
      '| Contribuição previdenciária do empregado (INSS)                                          /*DESCONTO_INSS*/|'  + sLineBreak +
      '|                                                                                                            |' + sLineBreak +
      '| TOTAL                                                     /*TOTAL_VENCIMENTO*//*TOTAL_DESCONTO*/|'            + sLineBreak +
      '| TOTAL LÍQUIDO: /*TOTAL_LÍQUIDO*/|'                                                                            + sLineBreak +
      '|____________________________________________________________________________________________________________|';
implementation

end.
