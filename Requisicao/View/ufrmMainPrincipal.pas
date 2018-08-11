unit ufrmMainPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.CategoryButtons, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmMainMenu = class(TForm)
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    ActionListMenu: TActionList;
    actEstoque: TAction;
    actProduto: TAction;
    actRequisicao: TAction;
    imlIcons: TImageList;
    procedure imgMenuClick(Sender: TObject);
    procedure actEstoqueExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure actRequisicaoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

uses ufrmEstoque, ufrmProduto, ufrmRequisicao;

procedure TfrmMainMenu.actEstoqueExecute(Sender: TObject);
begin
   if not Assigned(frmEstoque) then
    begin
      frmEstoque := TfrmEstoque.Create(Self);
    end;
    frmEstoque.Show;

end;

procedure TfrmMainMenu.actProdutoExecute(Sender: TObject);
begin
   if not Assigned(frmProduto) then
    begin
      frmProduto := TfrmProduto.Create(Self);
    end;
    frmProduto.Show

end;

procedure TfrmMainMenu.actRequisicaoExecute(Sender: TObject);
begin
  if not Assigned(frmRequisicao) then
   begin
     frmRequisicao := TfrmRequisicao.Create(Self);
   end;
   frmRequisicao.Show;

end;

procedure TfrmMainMenu.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

end.
