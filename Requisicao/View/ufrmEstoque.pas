
unit ufrmEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmDefault, Data.DB, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.DApt, FireDAC.Phys.IBBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxTextEdit;

type
  TfrmEstoque = class(TfrmCadDefault)
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    memID_ESTOQUE: TIntegerField;
    memESTOQUE: TStringField;
    memSTATUS: TStringField;
    memDATA_REGISTRO: TDateField;
    GroupBox1: TGroupBox;
    edtEstoque: TEdit;
    ComboxStatus: TComboBox;
    edtDateRegistro: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FDQuery1: TFDQuery;
    FDQuery1ID_REQUISICAO_ITENS: TIntegerField;
    FDQuery1ID_REQUISICAO: TIntegerField;
    FDQuery1ID_PRODUTO: TIntegerField;
    FDQuery1QTD: TBCDField;
    FDQuery1DESCRICAO: TStringField;
    FDQuery1UND: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ExibirRegistros;
     procedure NovoRegistro;
     procedure EditarRegistros;
  end;

var
  frmEstoque: TfrmEstoque;

implementation

{$R *.dfm}

uses EstoqueModel;

procedure TfrmEstoque.actCancelarExecute(Sender: TObject);
begin
  ExibirRegistros;
  inherited;

end;

procedure TfrmEstoque.actEditarExecute(Sender: TObject);
begin
  inherited;
   //chamada do procedimento para Exibir todos Registros
  EditarRegistros;
end;

procedure TfrmEstoque.actExcluirExecute(Sender: TObject);
begin
  inherited;
 //chamada do procedimento para Exibir todos Registros
  ExibirRegistros;
end;

procedure TfrmEstoque.actNovoExecute(Sender: TObject);
begin
  inherited;
 //Chamada do procedimento para um novo registro
  NovoRegistro;
end;

procedure TfrmEstoque.actSalvarExecute(Sender: TObject);
 var
  Estoque : TEstoqueModel;
begin

   Estoque := TEstoqueModel.Create;
   try
    Estoque.ESTOQUE   := edtEstoque.Text;
    Estoque.STATUS := Copy(ComboxStatus.Text ,0,1);
 //Verificando o valor da variável----
    if acao = 'NOVO' then
     begin  
       Estoque.DATA_REGISTRO := edtDateRegistro.Date;
       Estoque.InserirEstoque(Estoque);
     end else if acao = 'EDITAR' then
        begin
         Estoque.ID_ESTOQUE := memID_ESTOQUE.AsInteger;
         Estoque.UpdateEstoque(Estoque);
        end; 
   finally
    Estoque.Free;
   end;
 //chamada do procedimento para Exibir todos Registros
  ExibirRegistros; 
  inherited;
     
end;

procedure TfrmEstoque.EditarRegistros;
begin
  //vaviavel criada para receber ação {ex. Novo - Editar}
  acao := 'EDITAR';
   //preparando os campos para serem editados
  edtEstoque.Text         := memESTOQUE.AsString;
  edtEstoque.SetFocus;
  ComboxStatus.Text       := memSTATUS.AsString;
  ComboxStatus.Enabled    := True;
  edtDateRegistro.Date    := memDATA_REGISTRO.AsDateTime;
  edtDateRegistro.Enabled := False;
end;

procedure TfrmEstoque.ExibirRegistros;
 var
  Estoque: TEstoqueModel;
begin
  Estoque := TEstoqueModel.Create;
  try
   mem.Close;
   mem.Data:= Estoque.ExibirEstoque; 
    
  finally
   Estoque.Free;
  end;

end;

procedure TfrmEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(frmEstoque);
end;

procedure TfrmEstoque.FormShow(Sender: TObject);
begin
  inherited;
  //chamada do procedimento para Exibir todos Registros
  ExibirRegistros;
end;

procedure TfrmEstoque.NovoRegistro;
begin
  //vaviavel criada para receber ação {ex. Novo - Editar}
  acao := 'NOVO';
  //preparando os campos para um novo registro
  edtEstoque.Clear;
  edtEstoque.SetFocus;
  ComboxStatus.ItemIndex  := 0;
  ComboxStatus.Enabled    := False;
  edtDateRegistro.Date    := Now;
  edtDateRegistro.Enabled := False;
  
end;

end.
