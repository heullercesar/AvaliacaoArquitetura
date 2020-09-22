object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 98
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtValorAPagar: TJvCalcEdit
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 0
    DecimalPlacesAlwaysShown = False
  end
  object JvComboBox1: TJvComboBox
    Left = 264
    Top = 24
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'Dinheiro'
    Items.Strings = (
      'Dinheiro'
      'D'#233'bito em conta'
      'Cr'#233'dito avista'
      'Cr'#233'dito parcelado'
      'Boleto'
      'Duplicata')
    ItemIndex = 0
  end
  object btnRealilzaPagamento: TButton
    Left = 334
    Top = 65
    Width = 75
    Height = 25
    Caption = 'btnRealizaPagamento'
    TabOrder = 2
    OnClick = btnRealilzaPagamentoClick
  end
end
