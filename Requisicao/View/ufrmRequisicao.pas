unit ufrmRequisicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmDefault, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls;

type
  TfrmRequisicao = class(TfrmCadDefault)
    pan: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    dblookupComboxProduto: TDBLookupComboBox;
    edtQTD: TEdit;
    btnSalvar_Itens: TSpeedButton;
    btnEditar_Itens: TSpeedButton;
    btnCancelar_Itens: TSpeedButton;
    btnExcluir_Itens: TSpeedButton;
    memItens: TFDMemTable;
    dtsItens: TDataSource;
    actSalvarItens: TAction;
    actEditarItens: TAction;
    actCancelarItens: TAction;
    actExcluirItens: TAction;
    dblooComboxEstoque: TDBLookupComboBox;
    ComboxStatus: TComboBox;
    edtObservacao: TEdit;
    edtDateRegistro: TDateTimePicker;
    Label2: TLabel;
    lbObservacao: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    memEstoque: TFDMemTable;
    dtsEstoque: TDataSource;
    memEstoqueID_ESTOQUE: TIntegerField;
    memEstoqueESTOQUE: TStringField;
    memEstoqueSTATUS: TStringField;
    memEstoqueDATA_REGISTRO: TDateField;
    memID_REQUISICAO: TIntegerField;
    memSTATUS: TStringField;
    memOBSERVACAO: TStringField;
    memDATA_REQUISICAO: TDateField;
    memESTOQUE2: TStringField;
    memID_ESTOQUE: TIntegerField;
    actNovoItens: TAction;
    memProduto: TFDMemTable;
    dtsProduto: TDataSource;
    memProdutoID_PRODUTO: TIntegerField;
    memProdutoDESCRICAO: TStringField;
    memProdutoUND: TStringField;
    memProdutoVALOR: TBCDField;
    memProdutoSTATUS: TStringField;
    memItensID_REQUISICAO_ITENS: TIntegerField;
    memItensID_REQUISICAO: TIntegerField;
    memItensID_PRODUTO: TIntegerField;
    memItensQTD: TBCDField;
    memItensDESCRICAO: TStringField;
    memItensUND: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabCadastroShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarItensExecute(Sender: TObject);
    procedure actNovoItensExecute(Sender: TObject);
    procedure edtQTDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actEditarItensExecute(Sender: TObject);
    procedure actCancelarItensExecute(Sender: TObject);
    procedure actExcluirItensExecute(Sender: TObject);
  private
    { Private declarations }
    vID_Requisicao: Integer;
  public
    { Public declarations }
    procedure ExibirEstoque;
    procedure ExibirProduto;
    procedure ExibirRequisicao;
    procedure ExibirItensRequisicao;
    procedure HabilitarButtonRequisicao(Status: Boolean);

  end;

var
  frmRequisicao: TfrmRequisicao;

implementation

{$R *.dfm}

uses EstoqueModel, RequisicaoModel, ProdutoModel;

procedure TfrmRequisicao.actCancelarExecute(Sender: TObject);
 var
  Requisicao: TRequisicaoModel;
begin
  Requisicao := TRequisicaoModel.Create;

  try

   if ((memID_ESTOQUE.IsNull) and (memItens.IsEmpty)) then
   begin
    Requisicao.ID_REQUISICAO := vID_Requisicao;
    Requisicao.ExcluirRequisicao(Requisicao);
   end;

  finally
    Requisicao.Free;
  end;

  inherited;
  //chamada do procedimento para Exibir todos Registros
  ExibirRequisicao;

end;

procedure TfrmRequisicao.actCancelarItensExecute(Sender: TObject);
begin
  inherited;
  dblookupComboxProduto.KeyValue := -1;
  edtQTD.Clear;
  dblookupComboxProduto.SetFocus;
  HabilitarButtonRequisicao(True);
end;

procedure TfrmRequisicao.actEditarExecute(Sender: TObject);
begin
  inherited;
  //Setando valor para variável
  acao := 'EDITAR';
  //Setando valor da Tag 1 pra procedimento de Inserção dos itens da requisição
  btnSalvar_Itens.Tag := 1;
  dblooComboxEstoque.KeyValue := memID_ESTOQUE.AsInteger;
  edtObservacao.Text   := memOBSERVACAO.AsString;
  ComboxStatus.Text    := memSTATUS.AsString;
  ComboxStatus.Enabled := True;
  edtDateRegistro.Date := memDATA_REQUISICAO.AsDateTime;
  vID_Requisicao := memID_REQUISICAO.AsInteger;
  ExibirItensRequisicao;
  HabilitarButtonRequisicao(True);
end;

procedure TfrmRequisicao.actEditarItensExecute(Sender: TObject);
begin
  inherited;
  //Setando valor da tag para informar que é alteração dos itens da requisição
  btnSalvar_Itens.Tag := 2;
  dblookupComboxProduto.KeyValue := memItensID_PRODUTO.AsInteger;
  edtQTD.Text := FloatToStr(memItensQTD.AsFloat);
  edtQTD.SetFocus;
  HabilitarButtonRequisicao(True);
end;

procedure TfrmRequisicao.actExcluirExecute(Sender: TObject);
begin
  inherited;
  ExibirRequisicao;
end;

procedure TfrmRequisicao.actExcluirItensExecute(Sender: TObject);
 var
  Requisicao : TRequisicaoModel;
begin
  Requisicao := TRequisicaoModel.Create;
  try
    Requisicao.ID_REQUISICAO_ITENS := memItensID_REQUISICAO_ITENS.AsInteger;
    Requisicao.ExcluirItensRequisicao(Requisicao);
    HabilitarButtonRequisicao(True);
    ExibirItensRequisicao;
  finally
    Requisicao.Free;
  end;

end;

procedure TfrmRequisicao.actNovoExecute(Sender: TObject);
 var
   Requisicao : TRequisicaoModel;
begin
   Requisicao := TRequisicaoModel.Create;
  //Setando valor para variável
   acao := 'NOVO';
   //Setando valor da Tag 1 pra procedimento de Inserção dos itens da requisição
   btnSalvar_Itens.Tag := 1;
   try
     Requisicao.STATUS := 'A';
     Requisicao.DATA_REQUISICAO := Now;
     Requisicao.InserirRequisicao(Requisicao);

     vID_Requisicao := Requisicao.MaxID_Requisicao;
     Requisicao.ID_REQUISICAO := vID_Requisicao;
     mem.Close;
     mem.Data:= Requisicao.ExibirRequisicaoPorID(Requisicao);
     ComboxStatus.Text := memSTATUS.AsString;
     ComboxStatus.Enabled := False;
     edtDateRegistro.Date := memDATA_REQUISICAO.AsDateTime;
     ExibirItensRequisicao;
     HabilitarButtonRequisicao(True);
   finally
    Requisicao.Free;
   end;
  inherited;
end;

procedure TfrmRequisicao.actNovoItensExecute(Sender: TObject);
begin
  inherited;
  dblooComboxEstoque.KeyValue := -1;end;

procedure TfrmRequisicao.actSalvarExecute(Sender: TObject);
 var
  Requisicao : TRequisicaoModel;
begin
  Requisicao := TRequisicaoModel.Create;

  try
   Requisicao.ID_ESTOQUE    := memEstoqueID_ESTOQUE.AsInteger;
   Requisicao.ID_REQUISICAO := vID_Requisicao;
   Requisicao.UpdateRequisicao(Requisicao);
  finally
   Requisicao.Free;
  end;

  ExibirRequisicao;
  inherited;

end;

procedure TfrmRequisicao.actSalvarItensExecute(Sender: TObject);
 var
  Requisicao : TRequisicaoModel;
begin
  inherited;
   Requisicao := TRequisicaoModel.Create;

   try
     Requisicao.ID_REQUISICAO := vID_Requisicao;
     Requisicao.ID_PRODUTO    := memProdutoID_PRODUTO.AsInteger;
     Requisicao.QTD           := StrToFloat(edtQTD.Text);
   //verificando valor da Tag
    if btnSalvar_Itens.Tag = 1 then
     begin
      Requisicao.InserirItensRequisicao(Requisicao);
   //verificando valor da Tag
     end else if btnSalvar_Itens.Tag = 2 then
        begin
         Requisicao.ID_REQUISICAO_ITENS := memItensID_REQUISICAO_ITENS.AsInteger;
         Requisicao.UpdateItensRequisicao(Requisicao);
        end;
     ExibirItensRequisicao;
     HabilitarButtonRequisicao(True);
   finally
    dblookupComboxProduto.KeyValue := -1;
    edtQTD.Clear;
    dblookupComboxProduto.SetFocus;
    Requisicao.Free;
   end;


end;

procedure TfrmRequisicao.edtQTDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key =13 then
    begin
      btnSalvar_Itens.Click;
    end;
end;

procedure TfrmRequisicao.ExibirEstoque;
 var
  Estoque: TEstoqueModel;
begin
  Estoque := TEstoqueModel.Create;
  try
   memEstoque.Close;
   memEstoque.Data:= Estoque.ExibirEstoque;

  finally
   Estoque.Free;
  end;
end;

procedure TfrmRequisicao.ExibirItensRequisicao;
 var
   Requisicao : TRequisicaoModel;
begin
   Requisicao := TRequisicaoModel.Create;

   try
     Requisicao.ID_REQUISICAO := vID_Requisicao;
     memItens.Close;
     memItens.Data := Requisicao.ExibirItensRequisicao(Requisicao);
   finally
     Requisicao.Free;
   end;

end;

procedure TfrmRequisicao.ExibirProduto;
 var
  Produto : TProdutoModel;
begin
  Produto := TProdutoModel.Create;

   try
    memProduto.Close;
    memProduto.Data := Produto.ExibirProduto;
   finally
    Produto.Free;
   end;

end;

procedure TfrmRequisicao.ExibirRequisicao;
 var
  Requisicao: TRequisicaoModel;
begin
  Requisicao := TRequisicaoModel.Create;
  try
   mem.Close;
   mem.Data:= Requisicao.ExibirRequisicao; 
  finally
   Requisicao.Free;
  end;

end;

procedure TfrmRequisicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(frmRequisicao);
end;

procedure TfrmRequisicao.FormShow(Sender: TObject);
begin
  inherited;
  //chamada do procedimento para Exibir todos Registros
   ExibirRequisicao;
end;

procedure TfrmRequisicao.HabilitarButtonRequisicao(Status: Boolean);
begin
   btnSalvar_Itens.Enabled := Status;
   if memItens.IsEmpty then
     begin
      btnEditar_Itens.Enabled   := not Status;
      btnCancelar_Itens.Enabled := not Status;
      btnExcluir_Itens.Enabled  := not Status;
     end else
        begin
         btnEditar_Itens.Enabled  := Status;
         btnExcluir_Itens.Enabled := Status;
        end;
     if btnSalvar_Itens.Tag = 2 then
      begin
        btnCancelar_Itens.Enabled := Status;
        btnExcluir_Itens.Enabled  := Status;
      end;
     btnCancelar_Itens.Enabled := not Status;
end;

procedure TfrmRequisicao.TabCadastroShow(Sender: TObject);
begin

   inherited;
   ExibirEstoque;
   ExibirProduto;

end;

end.
