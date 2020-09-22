unit uFolhaPagamento.Model.LayoutImpressao;

interface


const
   TEXTO_IMPRESSAO =
      ' ____________________________________________________________________________________________________________ ' + sLineBreak +
      '| COMPET�NCIA /*COMPETENCIA*/|'                                                                                 + sLineBreak +
      '|                                                                                                            |' + sLineBreak +
      '| EMPREGADOR                                                                             CPF                 |' + sLineBreak +
      '|   /*NOME_EMPREGADOR*//*CPF_EMPREGADOR*/|'                                                                     + sLineBreak +
      '|                                                                                                            |' + sLineBreak +
      '| EMPREGADO                                                                              CPF                 |' + sLineBreak +
      '|   /*NOME_EMPREGADO*//*CPF_EMPREGADO*/|'                                                                       + sLineBreak +
      '|____________________________________________________________________________________________________________|' + sLineBreak +
      '|                                     DEMONSTRATIVOS DE VALORES DEVIDOS                                      |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| DESCRI��O                                                 BASE                           VALOR A           |' + sLineBreak +
      '|                                                           DE C�LCULO                     RECOLHER          |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| FGTS Mensal /*PERCENTUAL_FGTS_MENSAL*//*BASE_CALC_FGTS_MENSAL*//*VALOR_RECOLHER_FGTS_MENSAL*/|'               + sLineBreak +

      '| FGTS Compensat�rio /*PERCENTUAL_FGTS_COMPENSATORIO*/'                                                         +
                           '/*BASE_CALC_FGTS_COMPENSATORIO*/'                                                          +
                           '/*VALOR_RECOLHER_FGTS_COMPENSATORIO*/|'                                                    + sLineBreak +

      '| Contribui��o Previdenci�ria do Empregador /*PERCENTUAL_CONTRIBUICAO_EMPREGADOR*/'                             +
                                                  '/*BASE_CALC_CONTRIBUICAO_EMPREGADOR*/'                              +
                                                  '/*VALOR_RECOLHER_CONTRIBUICAO_EMPREGADOR*/|'                        + sLineBreak +

      '| Seguro contra Acidentes de Trabalho - GILRAT /*PERCENTUAL_GILRAT*/'                                           +
                                                     '/*BASE_CALC_GILRAT*/'                                            +
                                                     '/*VALOR_RECOLHER_GILRAT*/|'                                      + sLineBreak +

      '| Contribui��o Previdenci�ria do Empregado /*PERCENTUAL_CONTRIBUICAO_EMPREGADO*/'                               +
                                                 '/*BASE_CALC_CONTRIBUICAO_EMPREGADO*/'                                +
                                                 '/*VALOR_RECOLHER_CONTRIBUICAO_EMPREGADO*/|'                          + sLineBreak +

      '|____________________________________________________________________________________________________________|' + sLineBreak +
      '|                                              RECIBO DE SAL�RIO                                             |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| DESCRI��O                                                 VENCIMENTO                     DESCONTO          |' + sLineBreak +
      '|------------------------------------------------------------------------------------------------------------|' + sLineBreak +
      '| Sal�rio                                                   /*VENCIMENTO_SAL�RIO*/|'                            + sLineBreak +
      '| Vale-Transporte - Adiantamento pago em dinheiro           /*VENCIMENTO_VALE_TRANSPORTE*/|'                    + sLineBreak +
      '| Contribui��o previdenci�ria do empregado (INSS)                                          /*DESCONTO_INSS*/|'  + sLineBreak +
      '|                                                                                                            |' + sLineBreak +
      '| TOTAL                                                     /*TOTAL_VENCIMENTO*//*TOTAL_DESCONTO*/|'            + sLineBreak +
      '| TOTAL L�QUIDO: /*TOTAL_L�QUIDO*/|'                                                                            + sLineBreak +
      '|____________________________________________________________________________________________________________|';
implementation

end.
