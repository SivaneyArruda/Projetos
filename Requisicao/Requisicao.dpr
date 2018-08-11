program Requisicao;

uses
  Vcl.Forms,
  frmDefault in 'Base\frmDefault.pas' {frmCadDefault},
  ufrmEstoque in 'View\ufrmEstoque.pas' {frmEstoque},
  ufrmMainPrincipal in 'View\ufrmMainPrincipal.pas' {frmMainMenu},
  Conexao in 'Dao\Conexao.pas',
  EstoqueModel in 'Model\EstoqueModel.pas',
  ufrmProduto in 'View\ufrmProduto.pas' {frmProduto},
  ProdutoModel in 'Model\ProdutoModel.pas',
  ufrmRequisicao in 'View\ufrmRequisicao.pas' {frmRequisicao},
  RequisicaoModel in 'Model\RequisicaoModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.Run;
end.
