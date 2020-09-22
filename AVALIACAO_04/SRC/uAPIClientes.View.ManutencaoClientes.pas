unit uAPIClientes.View.ManutencaoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uLkJSON, IdHTTP, DB, DBClient, Grids, DBGrids, ComCtrls,
  ExtCtrls;

type
  TIdHTTPAccess = class(TIdHTTP)
  end;

  TForm1 = class(TForm)
    cdsClientes: TClientDataSet;
    dtsClientes: TDataSource;
    cdsClientesNome: TStringField;
    cdsClientesSituacao: TStringField;
    cdsClientesCodigoCliente: TIntegerField;
    cdsTelefones: TClientDataSet;
    dtsTelefones: TDataSource;
    cdsTelefonesCodigo: TIntegerField;
    cdsTelefonesNumero: TStringField;
    cdsTelefonesCodigoCliente: TIntegerField;
    pnlBotoesManutencao: TPanel;
    btnGravarExclusaoCliente: TButton;
    btnGravarExclusaoTelefone: TButton;
    pnlGrids: TPanel;
    dbgrdClientes: TDBGrid;
    pnlDivisaoGrids: TPanel;
    dbgrdTelefones: TDBGrid;
    pnlCabecalho: TPanel;
    btnGravarInclusaoTelefone: TButton;
    btnGravarAlteracao: TButton;
    btnGravarInclusao: TButton;
    btnBuscarClientes: TButton;
    procedure btnGravarExclusaoTelefoneClick(Sender: TObject);
    procedure btnGravarInclusaoTelefoneClick(Sender: TObject);
    procedure btnGravarExclusaoClienteClick(Sender: TObject);
    procedure btnGravarAlteracaoClick(Sender: TObject);
    procedure btnGravarInclusaoClick(Sender: TObject);
    procedure btnBuscarClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure BuscaClientes;
    procedure BuscaTelefonesCliente(pCodigoCliente: Integer);
    function RetornaIndexCampoDBGrid(var pGrid: TDBGrid; const pCampo: string): integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBuscarClientesClick(Sender: TObject);begin
   BuscaClientes;
end;

procedure TForm1.btnGravarAlteracaoClick(Sender: TObject);var   lHttp: TIdHTTP;   lStream: TStringStream;begin
   if btnGravarAlteracao.Caption = 'Cancelar' then
   begin
      cdsClientes.Cancel;
      btnGravarInclusao.Caption         := 'Incluir';
      btnGravarAlteracao.Caption        := 'Alterar';
      btnGravarExclusaoCliente.Enabled  := True;
      btnGravarInclusaoTelefone.Enabled := True;
      btnGravarExclusaoTelefone.Enabled := True;
   end
   else
   begin
      lHttp    := TIdHTTP.Create;
      lHttp.Request.ContentType := 'application/json';
      lStream := TStringStream.Create(
                    '{"nome": "' + cdsClientesNome.AsString +'", ' +
                    '  "status": "' + cdsClientesSituacao.AsString +'"}');

      lHttp.Put('https://avaliacaosiagri.herokuapp.com/clientes/' + cdsClientesCodigoCliente.AsString, lStream);
      ShowMessage('Alteração salva com sucesso!');
   end;
end;

procedure TForm1.btnGravarExclusaoClienteClick(Sender: TObject);var
   lHttp: TIdHTTP;begin   lHttp := TIdHTTP.Create;
   lHttp.Request.ContentType := 'application/json';
   lHttp.Delete('https://avaliacaosiagri.herokuapp.com/clientes/' + cdsClientesCodigoCliente.AsString);
   cdsClientes.Delete;
   ShowMessage('Exclusão realizada com sucesso!');
end;

procedure TForm1.btnGravarExclusaoTelefoneClick(Sender: TObject);var
   lHttp: TIdHTTP;begin   lHttp := TIdHTTP.Create;
   lHttp.Request.ContentType := 'application/json';
   lHttp.Delete('https://avaliacaosiagri.herokuapp.com/clientes/' +
                cdsClientesCodigoCliente.AsString + '/telefones/' +
                cdsTelefonesCodigo.AsString);
   cdsTelefones.Delete;
   ShowMessage('Exclusão realizada com sucesso!');
end;

procedure TForm1.btnGravarInclusaoClick(Sender: TObject);var   lHttp: TIdHTTP;   lRequest: string;   ArrayObjetos{ TODO :  }: TStringList;   lista:TMemoryStream;
begin
   if btnGravarInclusao.Caption = 'Incluir' then
   begin
      cdsClientes.Append;
      dbgrdClientes.SetFocus;
      dbgrdClientes.SelectedField       := dbgrdClientes.Fields[RetornaIndexCampoDBGrid(dbgrdClientes, 'Nome')];
      btnGravarInclusao.Caption         := 'Gravar';
      btnGravarAlteracao.Caption        := 'Cancelar';
      btnGravarExclusaoCliente.Enabled  := False;
      btnGravarInclusaoTelefone.Enabled := False;
      btnGravarExclusaoTelefone.Enabled := False;
   end
   else
   begin
      ArrayObjetos := TStringList.Create;
      lista := TMemoryStream.Create;
      lHttp := TIdHTTP.Create;
      lHttp.Request.ContentType := 'application/json';
      lHttp.Request.Charset     := 'utf-8';

      ArrayObjetos.Text :=
         '{"nome": "' + cdsClientesNome.AsString +'", ' +
         '  "status": "' + cdsClientesSituacao.AsString +'"}';
      ArrayObjetos.SaveToStream(lista);
      lRequest := lHttp.Post('https://avaliacaosiagri.herokuapp.com/clientes', lista);

      ShowMessage('Cliente incluído com sucesso!');

      btnGravarInclusao.Caption         := 'Incluir';
      btnGravarAlteracao.Caption        := 'Alterar';
      btnGravarExclusaoCliente.Enabled  := True;
      btnGravarInclusaoTelefone.Enabled := True;
      btnGravarExclusaoTelefone.Enabled := True;
   end;
end;

procedure TForm1.btnGravarInclusaoTelefoneClick(Sender: TObject);var
   lHttp: TIdHTTP;   lRequest: string;   ArrayObjetos: TStringList;   lista:TMemoryStream;
begin
   if btnGravarInclusaoTelefone.Caption = 'Incluir' then
   begin
      cdsTelefones.Append;
      dbgrdTelefones.SetFocus;
      dbgrdTelefones.SelectedField := dbgrdTelefones.Fields[RetornaIndexCampoDBGrid(dbgrdTelefones, 'Numero')];
      btnGravarInclusaoTelefone.Caption := 'Gravar';
   end
   else
   begin
      ArrayObjetos := TStringList.Create;
      lista := TMemoryStream.Create;
      lHttp := TIdHTTP.Create;
      lHttp.Request.ContentType := 'application/json';
      lHttp.Request.Charset     := 'utf-8';

      ArrayObjetos.Text := '{"numero": "' + cdsTelefonesNumero.AsString +'"}';
      ArrayObjetos.SaveToStream(lista);
      lRequest := lHttp.Post('https://avaliacaosiagri.herokuapp.com/clientes/' +
                             cdsClientesCodigoCliente.AsString + '/telefones', lista);
      ShowMessage('Telefone incluído com sucesso!');
      btnGravarInclusaoTelefone.Caption := 'Incluir';
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   cdsClientes.CreateDataSet;
   cdsClientes.LogChanges := False;
   cdsTelefones.CreateDataSet;
   cdsTelefones.LogChanges := False;
end;

function TForm1.RetornaIndexCampoDBGrid(var pGrid: TDBGrid; const pCampo: string): integer;
var
   lCont: integer;
begin
   Result := 0;

   for lCont := 0 to pGrid.FieldCount - 1 do
   begin
      if pGrid.Fields[lCont].FieldName = trim(pCampo) then
      begin
         Result := lCont;
         break;
      end;
   end;
end;

procedure TForm1.BuscaClientes;
var
  lJsonList: TlkJSONlist;
  lJsonObject: TlkJSONobject;
  lIndex: integer;
  lHttp: TIdHTTP;
  lRetorno: string;
begin
   cdsClientes.EmptyDataSet;
   cdsTelefones.EmptyDataSet;

   lHttp    := TIdHTTP.Create;
   lRetorno := lHttp.get('https://avaliacaosiagri.herokuapp.com/clientes');

   lJsonList := TlkJSON.ParseText(lRetorno) as TlkJSONlist;

   if Assigned(lJsonList) then
   begin
      for lIndex := 0 to lJsonList.Count-1 do
      begin
         lJsonObject := lJsonList.Child[lIndex] as TlkJSONobject;

         cdsClientes.Append;
         cdsClientesCodigoCliente.AsInteger := lJsonObject.Field['id'].Value;
         cdsClientesNome.AsString           := lJsonObject.Field['nome'].Value;
         cdsClientesSituacao.AsString       := lJsonObject.Field['status'].Value;
         cdsClientes.Post;

         BuscaTelefonesCliente(cdsClientesCodigoCliente.AsInteger);
      end;
   end;

   cdsClientes.First;
   ShowMessage('Pesquisa realizada com sucesso!');
end;


procedure TForm1.BuscaTelefonesCliente(pCodigoCliente: Integer);
var
  lJsonList: TlkJSONlist;
  lJsonObject: TlkJSONobject;
  lIndex: integer;
  lHttp: TIdHTTP;
  lRetorno: string;
begin
   lHttp    := TIdHTTP.Create;
   lRetorno := lHttp.get('https://avaliacaosiagri.herokuapp.com/clientes/' +
                         IntToStr(pCodigoCliente) + '/telefones');

   lJsonList := TlkJSON.ParseText(lRetorno) as TlkJSONlist;

   if Assigned(lJsonList) then
   begin
      for lIndex := 0 to lJsonList.Count-1 do
      begin
         lJsonObject := lJsonList.Child[lIndex] as TlkJSONobject;

         cdsTelefones.Append;
         cdsTelefonesCodigoCliente.AsInteger := pCodigoCliente;
         cdsTelefonesCodigo.AsInteger        := lJsonObject.Field['id'].Value;
         cdsTelefonesNumero.AsString         := lJsonObject.Field['numero'].Value;
         cdsTelefones.Post;
      end;
   end;
end;

end.
