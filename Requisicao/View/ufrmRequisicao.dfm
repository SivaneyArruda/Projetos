inherited frmRequisicao: TfrmRequisicao
  Caption = 'Cadastro de Requisi'#231#227'o'
  ClientWidth = 788
  OnClose = FormClose
  ExplicitWidth = 804
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnControle: TPanel
    Width = 782
    ExplicitWidth = 782
  end
  inherited PageControl1: TPageControl
    Width = 788
    ExplicitWidth = 788
    inherited TabConsulta: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 780
      ExplicitHeight = 417
      inherited pnConsulta: TPanel
        Width = 774
        ExplicitWidth = 774
      end
      inherited DBGrid1: TDBGrid
        Width = 774
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_REQUISICAO'
            Title.Caption = 'C'#243'digo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Title.Caption = 'Estoque'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observa'#231#227'o'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_REQUISICAO'
            Title.Caption = 'Data Registro'
            Width = 110
            Visible = True
          end>
      end
    end
    inherited TabCadastro: TTabSheet
      OnShow = TabCadastroShow
      ExplicitLeft = 4
      ExplicitTop = 27
      ExplicitWidth = 780
      ExplicitHeight = 417
      inherited pnCadastro: TPanel
        Width = 774
        ExplicitWidth = 774
        object pan: TGroupBox
          Left = 40
          Top = 13
          Width = 665
          Height = 185
          Caption = 'Dados Requisi'#231#227'o'
          TabOrder = 0
          object Label2: TLabel
            Left = 18
            Top = 22
            Width = 45
            Height = 16
            Caption = 'Estoque'
          end
          object lbObservacao: TLabel
            Left = 18
            Top = 71
            Width = 67
            Height = 16
            Caption = 'Observa'#231#227'o'
          end
          object Label3: TLabel
            Left = 18
            Top = 122
            Width = 36
            Height = 16
            Caption = 'Status'
          end
          object Label4: TLabel
            Left = 182
            Top = 122
            Width = 77
            Height = 16
            Caption = 'Data Registro'
          end
          object dblooComboxEstoque: TDBLookupComboBox
            Left = 18
            Top = 40
            Width = 415
            Height = 24
            KeyField = 'ID_ESTOQUE'
            ListField = 'ESTOQUE'
            ListSource = dtsEstoque
            TabOrder = 0
          end
          object ComboxStatus: TComboBox
            Left = 18
            Top = 140
            Width = 151
            Height = 24
            TabOrder = 1
            Items.Strings = (
              'A - ABERTO'
              'L - LIBERADO'
              'F - FECHADO'
              'C - CANCELADO')
          end
          object edtObservacao: TEdit
            Left = 18
            Top = 90
            Width = 415
            Height = 24
            Enabled = False
            TabOrder = 2
          end
          object edtDateRegistro: TDateTimePicker
            Left = 182
            Top = 140
            Width = 131
            Height = 24
            Date = 43275.852672303240000000
            Time = 43275.852672303240000000
            Enabled = False
            TabOrder = 3
          end
        end
        object GroupBox2: TGroupBox
          Left = 40
          Top = 200
          Width = 665
          Height = 189
          Caption = 'Itens Requisi'#231#227'o'
          TabOrder = 1
          object DBGrid2: TDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 21
            Width = 655
            Height = 120
            Align = alClient
            DataSource = dtsItens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_REQUISICAO_ITENS'
                Title.Caption = 'C'#243'digo'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_PRODUTO'
                Title.Caption = 'Cod. Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Produto'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UND'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD'
                Width = 110
                Visible = True
              end>
          end
          object Panel1: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 147
            Width = 655
            Height = 37
            Align = alBottom
            TabOrder = 1
            object btnSalvar_Itens: TSpeedButton
              AlignWithMargins = True
              Left = 513
              Top = 4
              Width = 30
              Height = 29
              Action = actSalvarItens
              Align = alRight
              ExplicitLeft = 456
            end
            object btnEditar_Itens: TSpeedButton
              AlignWithMargins = True
              Left = 549
              Top = 4
              Width = 30
              Height = 29
              Action = actEditarItens
              Align = alRight
              ExplicitLeft = 492
            end
            object btnCancelar_Itens: TSpeedButton
              AlignWithMargins = True
              Left = 585
              Top = 4
              Width = 30
              Height = 29
              Action = actCancelarItens
              Align = alRight
              ExplicitLeft = 528
            end
            object btnExcluir_Itens: TSpeedButton
              AlignWithMargins = True
              Left = 621
              Top = 4
              Width = 30
              Height = 29
              Action = actExcluirItens
              Align = alRight
              ExplicitLeft = 564
            end
            object Label5: TLabel
              Left = 12
              Top = 11
              Width = 44
              Height = 16
              Caption = 'Produto'
            end
            object Label6: TLabel
              Left = 389
              Top = 11
              Width = 25
              Height = 16
              Caption = 'QTD'
            end
            object dblookupComboxProduto: TDBLookupComboBox
              Left = 63
              Top = 6
              Width = 290
              Height = 24
              KeyField = 'ID_PRODUTO'
              ListField = 'DESCRICAO'
              ListSource = dtsProduto
              TabOrder = 0
            end
            object edtQTD: TEdit
              Left = 421
              Top = 6
              Width = 74
              Height = 24
              TabOrder = 1
              OnKeyDown = edtQTDKeyDown
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actSalvarItens: TAction
      Category = 'RequisicaoItens'
      OnExecute = actSalvarItensExecute
    end
    object actEditarItens: TAction
      Category = 'RequisicaoItens'
      OnExecute = actEditarItensExecute
    end
    object actCancelarItens: TAction
      Category = 'RequisicaoItens'
      OnExecute = actCancelarItensExecute
    end
    object actExcluirItens: TAction
      Category = 'RequisicaoItens'
      OnExecute = actExcluirItensExecute
    end
    object actNovoItens: TAction
      Category = 'RequisicaoItens'
      Caption = 'actNovoItens'
      OnExecute = actNovoItensExecute
    end
  end
  inherited ImageList: TImageList
    Bitmap = {
      494C010107007800680018001800FFFFFFFF0510FFFFFFFFFFFFFFFF424D7600
      0000000000007600000028000000600000003000000001000400000000000009
      0000000000000000000000000000000000000000000000008000008000000080
      8000800000008000800080800000C0C0C000808080000000FF0000FF000000FF
      FF00FF000000FF00FF00FFFF0000FFFFFF000000000011111111000000000000
      0330000000000000000000000000000000000000000000000000000000000000
      0000000000111111111111000000000033300000000000000000000000000000
      0000000000000000000000000000000000000000011100000000111000000003
      3330000000000000000000000000000000000000000000000000000000000000
      0000000011000000000000110000003333300000000000000000000000000000
      0000000000000000000000000000000000000001100000000000000110003333
      3330000000030000000000000000000000000787000000000000000000000000
      0000001100000000000000001100333333300000000300000000000000000000
      0000773000000000000000000000000000000110000000000000000001103333
      333000000003220000000000000000000007733F000000000000000000000000
      000001100000000000000000011033333330000000032200000000000000F77F
      00F733F000000000000000000000000000001100000000000000000000118333
      33800000002282000000000000F8877777783F00000000000000000000000000
      000011000000000000000000001183338380000002288222222200000787F00F
      7787700000000000000000000000000000001100011111111111111000113333
      888000002288888888820000F8700000F7770000000000000000000000000000
      0000110019999999999999910011333338800002282222238882000077000000
      0F78000000000000000000000000000000001100199999999999999100113333
      383000228822222238820000870000000F787000000000000000000000000000
      0000110001111111111111100011333338300002288888888882000087000000
      FF78700000000000000000000000000000001100000000000000000000113333
      383000002288888887820000870000FF0F787000000000000000000000000000
      00001100000000000000000000113333383000000228822222220000770FFF00
      0F78F00000000000000000000000000000000110000000000000000001103333
      38300000002282000000000077F0000007880000000000000000000000000000
      000001100000000000000000011083333730000000032200000000000777FFFF
      788F000000000000000000000000000000000011000000000000000011008333
      7830000000032200000000000077777778F00000000000000000000000000000
      00000001100000000000000110003337830000000003000000000000000F7777
      7F00000000000000000000000000000000000000110000000000001100003378
      1000000000030000000000000000000000000000000000000000000000000000
      0000000001110000000011100000383000000000000300000000000000000000
      0000000000000000000000000000000000000000001111111111110000003333
      3333333333330000000000000000000000000000000000000000000000000000
      0000000000001111111100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000688888888888888600000468
      8888888888886600000004688888880019100000019100000000000000000000
      0000000666666666666666666000486666666666666668600000486666666600
      9991000019990000000000000000000000000048000000000000000084006600
      0000000000000660000066000000000099991001999100007778888888888777
      7F00006600000000000000006600860000000000000000800000860000000000
      0999911999100008666F788777FFF66668000066000000000000000066008600
      000000000000008000008600000000000099999991000076666FF667777FF666
      6800006600000000000000006600860000000440000000800000860000000000
      00099999100000886660F6677777F66668000066000000000000000066008600
      0000004400000080000086000000000000019999100000886660F66777777666
      6800006600000000000000006600860000000040444000800000860000000000
      00199999910000886660088F7777766668000066000000000000000066008600
      000000044444006000008600000000000199919999100088666000FFF7777666
      6800006600000000000000006600860000000004444440000000860000000000
      1999100999910088888888888888888888000066000000000000000066008600
      0000000044444400000086000000000099910000999900888888888888888888
      8800006600000000000000006600860000000000044444400000860000000000
      991000600991008887FFFFFFFFFFFF7888000066000000000000000066008600
      00000000004444440000860000000000000000800000008887FFFFFFFFFFFF78
      8800006600000000000000006600860000000000000444444000860000000000
      000000800000008887FFFFFFFFFFFF7888000066000000000000000066008600
      0000000000004444440086000000000000000080000000888700000000000078
      8800006600000000000000006600860000000000000004444440860000000000
      0000008000000088870000000000007888000068666666000000000066008866
      6664000000000044444488666664000000000080000000888700000000000078
      8800000688888800000000006600468888860000000000044444468888860000
      0000008000000088870000000000007888000000688888000000000066000068
      8886000000000000444400688886000000000080000000888700000000000078
      8800000006888800000000006600000688860000000000000400000688860000
      0000008000000088877777777777777888000000006888000000000066000000
      6886000000000060000000006886000000000080000000888866666666666688
      8800000000068800000000008400000006860000000006600000000006860000
      0000066000000078888888888888888887000000000068666666666660000000
      0066666666666860000000000066666666666860000000000000000000000000
      0000000000000688888888860000000000468888888866000000000000468888
      888866000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF00000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFF8F000000000000000000FFFF0F000000000000000000FFFE
      0F000000000000000000FF0C1F000000000000000000FC003F00000000000000
      0000F8607F000000000000000000F1F0FF000000000000000000F3F8FF000000
      000000000000F3F87F000000000000000000F3F07F000000000000000000F3C8
      7F000000000000000000F2387F000000000000000000F1F8FF00000000000000
      0000F800FF000000000000000000FC01FF000000000000000000FE03FF000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000000000FFFFFF00000000
      0000000000FFFFFF000000000000000000F00003000000000000000000E00003
      000000000000000000C00003000000000000000000C100030000000000000000
      00C10003000000000000000000C18003000000000000000000C1C00300000000
      0000000000C00003000000000000000000C00003000000000000000000C00003
      000000000000000000C00003000000000000000000C000030000000000000000
      00C3FFC3000000000000000000C3FFC3000000000000000000C3FFC300000000
      0000000000C3FFC3000000000000000000C3FFC3000000000000000000C00003
      000000000000000000C00003000000000000000000C000030000000000000000
      00FFFFFF000000000000000000FFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited mem: TFDMemTable
    object memID_REQUISICAO: TIntegerField
      FieldName = 'ID_REQUISICAO'
      Origin = 'ID_REQUISICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object memID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
      Origin = 'ID_ESTOQUE'
    end
    object memSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object memOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 40
    end
    object memDATA_REQUISICAO: TDateField
      FieldName = 'DATA_REQUISICAO'
      Origin = 'DATA_REQUISICAO'
    end
    object memESTOQUE2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object memItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 536
    Top = 296
    object memItensID_REQUISICAO_ITENS: TIntegerField
      FieldName = 'ID_REQUISICAO_ITENS'
      Origin = 'ID_REQUISICAO_ITENS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object memItensID_REQUISICAO: TIntegerField
      FieldName = 'ID_REQUISICAO'
      Origin = 'ID_REQUISICAO'
    end
    object memItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object memItensQTD: TBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 2
    end
    object memItensDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object memItensUND: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UND'
      Origin = 'UND'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  object dtsItens: TDataSource
    DataSet = memItens
    Left = 572
    Top = 296
  end
  object memEstoque: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 488
    Top = 136
    object memEstoqueID_ESTOQUE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'ID_ESTOQUE'
      Origin = 'ID_ESTOQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object memEstoqueESTOQUE: TStringField
      DisplayLabel = 'Nome do Estoque'
      DisplayWidth = 70
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      Size = 60
    end
    object memEstoqueSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object memEstoqueDATA_REGISTRO: TDateField
      DisplayLabel = 'Data Registro'
      DisplayWidth = 20
      FieldName = 'DATA_REGISTRO'
      Origin = 'DATA_REGISTRO'
    end
  end
  object dtsEstoque: TDataSource
    DataSet = memEstoque
    Left = 520
    Top = 136
  end
  object memProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 103
    Top = 352
    object memProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object memProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object memProdutoUND: TStringField
      FieldName = 'UND'
      Origin = 'UND'
      Size = 10
    end
    object memProdutoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object memProdutoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dtsProduto: TDataSource
    DataSet = memProduto
    Left = 167
    Top = 352
  end
end
