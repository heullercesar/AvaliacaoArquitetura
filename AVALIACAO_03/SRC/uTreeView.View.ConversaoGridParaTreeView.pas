unit uTreeView.View.ConversaoGridParaTreeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, DB, DBClient;

type
  TForm1 = class(TForm)
    grdDisposicaoNos: TDBGrid;
    btnConverter: TButton;
    trvNosConvertidos: TTreeView;
    cdsConversaoNos: TClientDataSet;
    cdsConversaoNosCodigoNo: TIntegerField;
    cdsConversaoNosCodigoNoPai: TIntegerField;
    cdsConversaoNosDescricao: TStringField;
    dtsConversaoNos: TDataSource;
    procedure grdDisposicaoNosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdsConversaoNosCodigoNoPaiSetText(Sender: TField; const Text: string);
    procedure cdsConversaoNosNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnConverterClick(Sender: TObject);
  private
    { Private declarations }
    function GetNodeFromObject(pIndice: Integer; const pNodes: TTreeNodes; pObject: TObject): TTreeNode;
    function AchaRegistro(const pCampo: string; const pValor: Variant): Boolean;
    procedure ConverteParaTreeView;
    procedure PreencheCds;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.AchaRegistro(const pCampo: string; const pValor: Variant): Boolean;
var
   lCdsClone: TClientDataSet;
begin
   lCdsClone := TClientDataSet.Create(nil);
   try
      lCdsClone.CloneCursor(cdsConversaoNos, False);
      Result := lCdsClone.Locate(pCampo, pValor, []);
   finally
      FreeAndNil(lCdsClone);
   end;
end;

procedure TForm1.btnConverterClick(Sender: TObject);
begin
   trvNosConvertidos.Items.Clear;
   cdsConversaoNos.First;
   ConverteParaTreeView;
end;

procedure TForm1.cdsConversaoNosCodigoNoPaiSetText(Sender: TField; const Text: string);
var
   lValorInteiro: Integer;
begin
   if Text = EmptyStr then
   begin
      Exit;
   end;

   lValorInteiro := StrToIntDef(Text, 0);

   if (lValorInteiro <= 0) then
   begin
      ShowMessage('Valor informado inválido!');
      Abort;
   end;

   if (not AchaRegistro('CodigoNo', lValorInteiro)) then
   begin
      ShowMessage('Código nó informado não existe. Verifique!');
      Abort;
   end;

   Sender.AsString := Text;
end;

procedure TForm1.cdsConversaoNosNewRecord(DataSet: TDataSet);
begin
   cdsConversaoNosCodigoNo.AsInteger := cdsConversaoNos.RecordCount + 1;
end;

procedure TForm1.ConverteParaTreeView;
var
   lNode: TTreeNode;
begin
   if cdsConversaoNos.Eof then
   begin
      Exit;
   end;

   if cdsConversaoNosCodigoNoPai.IsNull { TODO : empty }then
   begin
      trvNosConvertidos.Items.AddChildObject(nil, cdsConversaoNosDescricao.AsString, Pointer(cdsConversaoNosCodigoNo.AsInteger));
      cdsConversaoNos.Next;
      ConverteParaTreeView;
      Exit;
   end;

   lNode := GetNodeFromObject(0, trvNosConvertidos.Items, Pointer(cdsConversaoNosCodigoNoPai.AsInteger));

   if Assigned(lNode) then
   begin
      trvNosConvertidos.Items.AddChildObject(lNode, cdsConversaoNosDescricao.AsString, Pointer(cdsConversaoNosCodigoNo.AsInteger));
   end;

   cdsConversaoNos.Next;
   ConverteParaTreeView;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   ReportMemoryLeaksOnShutdown := True{ TODO :  };

   cdsConversaoNos.CreateDataSet;
   cdsConversaoNos.LogChanges := False;

   PreencheCds;
end;

function TForm1.GetNodeFromObject(pIndice: Integer; const pNodes: TTreeNodes; pObject: TObject): TTreeNode;
begin
   if (pNodes.Count <= 0) or
      (pIndice > pNodes.Count - 1) then
   begin
      Result := nil;
      Exit;
   end;

   Result := pNodes.Item[pIndice];

   if (Result.Data = pObject) then
   begin
      Exit;
   end;

   Result := GetNodeFromObject(pIndice + 1, pNodes, pObject);
end;

procedure TForm1.grdDisposicaoNosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if (ssCtrl in Shift) and (Key = VK_DELETE) then
   begin
      if AchaRegistro('CodigoNoPai', cdsConversaoNosCodigoNo.Value) then
      begin
         ShowMessage('Não é permitida a exclusão de um item que seja nó pai de outro item. Verifique!');
         Key := 0;
      end;
   end;
end;

procedure TForm1.PreencheCds;
begin
   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 1;
   cdsConversaoNosDescricao.Value   := '1.0';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 2;
   cdsConversaoNosCodigoNoPai.Value := 1;
   cdsConversaoNosDescricao.Value   := '1.1';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 3;
   cdsConversaoNosCodigoNoPai.Value := 1;
   cdsConversaoNosDescricao.Value   := '1.2';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 4;
   cdsConversaoNosDescricao.Value   := '2.0';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 5;
   cdsConversaoNosCodigoNoPai.Value := 4;
   cdsConversaoNosDescricao.Value   := '2.1';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 6;
   cdsConversaoNosCodigoNoPai.Value := 4;
   cdsConversaoNosDescricao.Value   := '2.2';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 7;
   cdsConversaoNosCodigoNoPai.Value := 1;
   cdsConversaoNosDescricao.Value   := '1.3';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 8;
   cdsConversaoNosCodigoNoPai.Value := 7;
   cdsConversaoNosDescricao.Value   := '1.3.1';
   cdsConversaoNos.Post;

   cdsConversaoNos.Append;
   cdsConversaoNosCodigoNo.Value    := 9;
   cdsConversaoNosCodigoNoPai.Value := 5;
   cdsConversaoNosDescricao.Value   := '2.1.1';
   cdsConversaoNos.Post;

end;

end.
