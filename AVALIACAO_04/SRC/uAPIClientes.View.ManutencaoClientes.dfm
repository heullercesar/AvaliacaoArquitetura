object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Painel de Clientes'
  ClientHeight = 396
  ClientWidth = 719
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
  object pnlBotoesManutencao: TPanel
    Left = 609
    Top = 0
    Width = 110
    Height = 396
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 622
    object btnGravarExclusaoCliente: TButton
      Left = 6
      Top = 152
      Width = 100
      Height = 35
      Caption = 'Excluir'
      TabOrder = 0
      OnClick = btnGravarExclusaoClienteClick
    end
    object btnGravarExclusaoTelefone: TButton
      Left = 6
      Top = 322
      Width = 100
      Height = 35
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnGravarExclusaoTelefoneClick
    end
    object btnGravarInclusaoTelefone: TButton
      Left = 6
      Top = 281
      Width = 100
      Height = 35
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = btnGravarInclusaoTelefoneClick
    end
    object btnGravarAlteracao: TButton
      Left = 5
      Top = 111
      Width = 100
      Height = 35
      Align = alCustom
      Caption = 'Alterar'
      TabOrder = 3
      OnClick = btnGravarAlteracaoClick
    end
    object btnGravarInclusao: TButton
      Left = 6
      Top = 70
      Width = 100
      Height = 35
      Align = alCustom
      Caption = 'Incluir'
      TabOrder = 4
      OnClick = btnGravarInclusaoClick
    end
  end
  object pnlGrids: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 396
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 49
    ExplicitWidth = 537
    ExplicitHeight = 308
    object dbgrdClientes: TDBGrid
      Left = 0
      Top = 49
      Width = 609
      Height = 158
      Align = alTop
      DataSource = dtsClientes
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CodigoCliente'
          Title.Caption = 'C'#243'digo'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 348
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Situacao'
          Title.Caption = 'Situa'#231#227'o'
          Width = 108
          Visible = True
        end>
    end
    object pnlDivisaoGrids: TPanel
      Left = 0
      Top = 207
      Width = 609
      Height = 41
      Align = alTop
      Caption = 'T E L E F O N E S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 200
      ExplicitTop = 136
      ExplicitWidth = 185
    end
    object dbgrdTelefones: TDBGrid
      Left = 0
      Top = 248
      Width = 609
      Height = 148
      Align = alClient
      DataSource = dtsTelefones
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Title.Caption = 'C'#243'digo'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Numero'
          Title.Caption = 'N'#250'mero Telefone'
          Width = 458
          Visible = True
        end>
    end
    object pnlCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 609
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Caption = 'C L I E N T E S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ExplicitWidth = 722
      object btnBuscarClientes: TButton
        Left = 524
        Top = 13
        Width = 74
        Height = 25
        Caption = 'Buscar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnBuscarClientesClick
      end
    end
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'CodigoCliente'
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 72
    object cdsClientesCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object cdsClientesNome: TStringField
      FieldName = 'Nome'
      Size = 250
    end
    object cdsClientesSituacao: TStringField
      FieldName = 'Situacao'
      FixedChar = True
      Size = 1
    end
  end
  object dtsClientes: TDataSource
    DataSet = cdsClientes
    Left = 352
    Top = 72
  end
  object cdsTelefones: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CodigoCliente'
    MasterFields = 'CodigoCliente'
    MasterSource = dtsClientes
    PacketRecords = 0
    Params = <>
    Left = 304
    Top = 192
    object cdsTelefonesCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object cdsTelefonesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsTelefonesNumero: TStringField
      FieldName = 'Numero'
      Size = 50
    end
  end
  object dtsTelefones: TDataSource
    DataSet = cdsTelefones
    Left = 360
    Top = 192
  end
end
