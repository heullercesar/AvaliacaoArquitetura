object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Avalia'#231#227'o 03'
  ClientHeight = 355
  ClientWidth = 739
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
  object grdDisposicaoNos: TDBGrid
    Left = 0
    Top = 0
    Width = 739
    Height = 193
    Align = alTop
    DataSource = dtsConversaoNos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = grdDisposicaoNosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoNo'
        ReadOnly = True
        Title.Caption = 'C'#243'digo N'#243
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoNoPai'
        Title.Caption = 'C'#243'digo N'#243' Pai'
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 217
        Visible = True
      end>
  end
  object btnConverter: TButton
    Left = 0
    Top = 193
    Width = 739
    Height = 33
    Align = alTop
    Caption = 'Converter para TreeView'
    TabOrder = 1
    OnClick = btnConverterClick
  end
  object trvNosConvertidos: TTreeView
    Left = 0
    Top = 226
    Width = 739
    Height = 129
    Align = alClient
    Indent = 19
    TabOrder = 2
  end
  object cdsConversaoNos: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsConversaoNosNewRecord
    Left = 360
    Top = 184
    object cdsConversaoNosCodigoNo: TIntegerField
      FieldName = 'CodigoNo'
    end
    object cdsConversaoNosCodigoNoPai: TIntegerField
      FieldName = 'CodigoNoPai'
      OnSetText = cdsConversaoNosCodigoNoPaiSetText
    end
    object cdsConversaoNosDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object dtsConversaoNos: TDataSource
    DataSet = cdsConversaoNos
    Left = 408
    Top = 184
  end
end
