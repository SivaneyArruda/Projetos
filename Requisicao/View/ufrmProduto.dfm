inherited frmProduto: TfrmProduto
  Caption = 'Cadastro de Produto'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 735
      ExplicitHeight = 417
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UND'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 735
      ExplicitHeight = 417
      inherited pnCadastro: TPanel
        object GroupBox1: TGroupBox
          Left = 32
          Top = 32
          Width = 513
          Height = 225
          Caption = 'Dados do Produto'
          TabOrder = 0
          object Label2: TLabel
            Left = 24
            Top = 35
            Width = 44
            Height = 16
            Caption = 'Produto'
          end
          object Label3: TLabel
            Left = 24
            Top = 92
            Width = 24
            Height = 16
            Caption = 'UND'
          end
          object Label4: TLabel
            Left = 160
            Top = 92
            Width = 30
            Height = 16
            Caption = 'Valor'
          end
          object Label5: TLabel
            Left = 312
            Top = 92
            Width = 36
            Height = 16
            Caption = 'Status'
          end
          object edtProduto: TEdit
            Left = 24
            Top = 54
            Width = 400
            Height = 24
            TabOrder = 0
          end
          object ComboxUND: TComboBox
            Left = 24
            Top = 110
            Width = 121
            Height = 24
            TabOrder = 1
            Items.Strings = (
              'UN'
              'CX'
              'PC'
              'DZ'
              'FR'
              'GL'
              'GM'
              'MG'
              'KG'
              'LT'
              'PT'
              'RS'
              'RL'
              'AP'
              'MT'
              'JG'
              'FD'
              'CT'
              'FL'
              'KT'
              'LA'
              'PO'
              'CS'
              'VD'
              '')
          end
          object edtValor: TEdit
            Left = 160
            Top = 110
            Width = 121
            Height = 24
            TabOrder = 2
            OnExit = edtValorExit
            OnKeyPress = edtValorKeyPress
          end
          object ComboxStatus: TComboBox
            Left = 296
            Top = 110
            Width = 128
            Height = 24
            TabOrder = 3
            Items.Strings = (
              'A - ATIVO'
              'D - DESATIVADO')
          end
        end
      end
    end
  end
  inherited mem: TFDMemTable
    object memID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object memDESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 250
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object memUND: TStringField
      DisplayWidth = 20
      FieldName = 'UND'
      Origin = 'UND'
      Size = 10
    end
    object memVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = '###,###,#.00'
      Precision = 18
      Size = 2
    end
    object memSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
end
