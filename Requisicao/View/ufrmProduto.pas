unit ufrmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmDefault, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmProduto = class(TfrmCadDefault)
    GroupBox1: TGroupBox;
    edtProduto: TEdit;
    ComboxUND: TComboBox;
    edtValor: TEdit;
    ComboxStatus: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    memID_PRODUTO: TIntegerField;
    memDESCRICAO: TStringField;
    memUND: TStringField;
    memVALOR: TBCDField;
    memSTATUS: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ExibirRegistros;
     procedure NovoRegistro;
     procedure EditarRegistros;
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses ProdutoModel;

procedure TfrmProduto.actCancelarExecute(Sender: TObject);
begin
  inherited;
  //chamada do procedimento para Exibir todos Registros
   ExibirRegistros;
end;

procedure TfrmProduto.actEditarExecute(Sender: TObject);
begin
  inherited;
  //chamada do procedimento para Exibir todos Registros
  EditarRegistros;
end;

procedure TfrmProduto.actNovoExecute(Sender: TObject);
begin
  inherited;
  //Chamada do procedimento preparando os campos para um novo registros
  NovoRegistro;
end;

procedure TfrmProduto.actSairExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmProduto.actSalvarExecute(Sender: TObject);
 var
  Produto : TProdutoModel;
begin

   Produto := TProdutoModel.Create;
   try
    Produto.DESCRICAO := edtProduto.Text;
    Produto.UND       := ComboxUND.Text;
    Produto.VALOR     := StrToFloat(edtValor.Text);
    Produto.STATUS    := Copy(ComboxStatus.Text,0,1);
    //Verificando o valor da variável----
    if acao = 'NOVO' then
     begin
       Produto.InserirProduto(Produto);
     end else if acao = 'EDITAR' then
        begin
         Produto.ID_PRODUTO := memID_PRODUTO.AsInteger;
         Produto.UpdateProduto(Produto);
        end;
   finally
    Produto.Free;
   end;
   //chamada do procedimento para Exibir todos Registros
  ExibirRegistros;
  inherited;

end;

procedure TfrmProduto.EditarRegistros;
begin
   //vaviavel criada para receber ação {ex. Novo - Editar}
    acao := 'EDITAR';
   //preparando os campos para serem editados
    edtProduto.Text      := memDESCRICAO.AsString;
    edtProduto.SetFocus;
    ComboxUND.Text       := memUND.AsString;
    edtValor.Text        := FormatFloat('###,###,#.00',memVALOR.AsFloat);
    ComboxStatus.Text    := memSTATUS.AsString;
end;

procedure TfrmProduto.edtValorExit(Sender: TObject);
 var
  Valor: Double;
begin
  Valor := StrToFloat(edtValor.Text);
  edtValor.Text := FormatFloat('###,###,0.00',Valor);
  inherited;

end;

procedure TfrmProduto.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in['0'..'9',',','.',#8]) then
   key :=#0;
end;

procedure TfrmProduto.ExibirRegistros;
 var
  Produto: TProdutoModel;
begin
  Produto := TProdutoModel.Create;
  try
   mem.Close;
   mem.Data:= Produto.ExibirProduto;

  finally
   Produto.Free;
  end;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(frmProduto);
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  inherited;
  //chamada do procedimento para Exibir todos Registros
  ExibirRegistros;
end;

procedure TfrmProduto.NovoRegistro;
begin
 //vaviavel criada para receber ação {ex. Novo - Editar}
    acao := 'NOVO';
   //preparando os campos para um novo registro
    edtProduto.Clear;
    edtProduto.SetFocus;
    ComboxUND.ItemIndex   := -1;
    edtValor.Text := FormatFloat('###,###,0.00',0);
    ComboxStatus.ItemIndex := -1;
end;

end.
