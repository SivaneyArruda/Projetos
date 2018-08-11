unit frmDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadDefault = class(TForm)
    pnControle: TPanel;
    PageControl1: TPageControl;
    TabConsulta: TTabSheet;
    TabCadastro: TTabSheet;
    pnConsulta: TPanel;
    DBGrid1: TDBGrid;
    pnCadastro: TPanel;
    ActionList: TActionList;
    actNovo: TAction;
    actEditar: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    ImageList: TImageList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnNovo: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btnPesquisar: TButtonedEdit;
    Label1: TLabel;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    actSair: TAction;
    dts: TDataSource;
    mem: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
      acao: string;
      procedure HabilitarButtons(Status: Boolean);
  end;

var
  frmCadDefault: TfrmCadDefault;

implementation

{$R *.dfm}

procedure TfrmCadDefault.actCancelarExecute(Sender: TObject);
begin
   HabilitarButtons(True);
   TabConsulta.Show;
end;

procedure TfrmCadDefault.actEditarExecute(Sender: TObject);
begin
  HabilitarButtons(False);
  TabCadastro.Show;
end;

procedure TfrmCadDefault.actExcluirExecute(Sender: TObject);
begin
   TabConsulta.Show;
end;

procedure TfrmCadDefault.actNovoExecute(Sender: TObject);
begin
  HabilitarButtons(False);
  TabCadastro.Show;
end;

procedure TfrmCadDefault.actSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadDefault.actSalvarExecute(Sender: TObject);
begin
  HabilitarButtons(True);
  TabConsulta.Show;
end;

procedure TfrmCadDefault.btnExcluirClick(Sender: TObject);
begin
  HabilitarButtons(true);
end;

procedure TfrmCadDefault.DBGrid1DblClick(Sender: TObject);
begin
  actEditar.Execute;
end;

procedure TfrmCadDefault.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =13 then
   begin
     actEditar.Execute;
   end;
end;

procedure TfrmCadDefault.FormCreate(Sender: TObject);
begin
   TabConsulta.TabVisible:=False;
   TabCadastro.TabVisible:=False;
end;

procedure TfrmCadDefault.FormShow(Sender: TObject);
begin
  TabConsulta.Show;
  HabilitarButtons(True);
end;

procedure TfrmCadDefault.HabilitarButtons(Status: Boolean);
begin
   actNovo.Enabled     := Status;
   actEditar.Enabled   := Status;
   actCancelar.Enabled := not Status;
   actSalvar.Enabled   := not Status;
   actExcluir.Enabled  := Status;
   actSair.Enabled     := Status;
end;

end.
