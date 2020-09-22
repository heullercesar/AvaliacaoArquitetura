unit uFinanceiro.View.BaixaAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits, JvExStdCtrls,
  JvCombobox, uFinanceiro.Model.Interfaces;

type
  TForm1 = class(TForm)
    edtValorAPagar: TJvCalcEdit;
    JvComboBox1: TJvComboBox;
    btnRealilzaPagamento: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRealilzaPagamentoClick(Sender: TObject);
  private
    { Private declarations }
    lasdf: iBaixaFinanceira;
    FListaFormaPagamento: TStringList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uFinanceiro.Model.BaixaFinanceira, TypInfo, 
  uFinanceiro.Model.BaixaFinanceira.Factory;

{$R *.dfm}

procedure TForm1.btnRealilzaPagamentoClick(Sender: TObject);
var
   lInterface: iBaixaFinanceira;
//   lInterfaceFactory: iBaixaFinanceiraFactory;
   lObjeto: TObject;
   lRotina: TMethod;
   lExec: TFuncaoDeCriacao;
begin
   lInterface := TModelBaixaFinanceiraFactory.New.BaixaCreditoAVista;

//   lRotina.Data := Pointer(lInterfaceFactory);
//   lRotina.Code := TObject(lInterfaceFactory).MethodAddress('BaixaDinheiro');
//   lExec := TFuncaoDeCriacao(lRotina);
//   lExec;

//   lInterface := JvComboBox1.Items.Objects[JvComboBox1.ItemIndex] ;
//
//   (JvComboBox1.Items.Objects[JvComboBox1.ItemIndex] as iBaixaFinanceira);
   
//   lObjeto := JvComboBox1.Items.Objects[JvComboBox1.ItemIndex];
//   Supports(lObjeto, iBaixaFinanceira, lInterface);

//   lObjeto.GetInterface(iBaixaFinanceira, lObjeto);

//   TObject(FindClass(FListaFormaPagamento.ValueFromIndex[JvComboBox1.ItemIndex]));

//   Supports(JvComboBox1.Items.Objects[JvComboBox1.ItemIndex], iBaixaFinanceira, lInterface);

//     lInterface := iBaixaFinanceira(JvComboBox1.Items.Objects[JvComboBox1.ItemIndex].ClassType).New;

//     JvComboBox1.Items.Objects[JvComboBox1.ItemIndex].ClassInfo;
//   JvComboBox1.Items
//   Values

//   TObject(JvComboBox1.Items.Objects[JvComboBox1.ItemIndex]) as iBaixaFinanceira;
//   JvComboBox1.Items.Objects[JvComboBox1.ItemIndex].GetInterface(GetTypeData(TypeInfo(iBaixaFinanceira))^.Guid, lInterface);
//   lInterface := TModelBaixaDinheiro.New;

   MessageDlg(

      lInterface.ValorBaixa(edtValorAPagar.Value).Processa

      , mtInformation, [mbOK], 0
   );
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
//   lasdf := TModelBaixaDinheiro.New;
//   lasdf._AddRef;
//   JvComboBox1.Items.Clear;
//   JvComboBox1.Items.AddObject('Test', TObject(lasdf));

   FListaFormaPagamento := TStringList.Create;
   FListaFormaPagamento.Values['Dinheiro']          := 'TModelBaixaDinheiro';
   FListaFormaPagamento.Values['Débito em conta']   := 'TModelBaixaDebitoEmConta';
   FListaFormaPagamento.Values['Crédito à vista']   := 'TModelBaixaCreditoAVista';
   FListaFormaPagamento.Values['Crédito parcelado'] := 'TModelBaixaCreditoParcelado';
   FListaFormaPagamento.Values['Boleto']            := 'TModelBaixaBoleto';
   FListaFormaPagamento.Values['Duplicata']         := 'TModelBaixaDuplicata';

   JvComboBox1.Items.Clear;

   for I := 0 to FListaFormaPagamento.Count - 1 do
   begin
      JvComboBox1.Items.Add(FListaFormaPagamento.Names[I]);
   end;

   JvComboBox1.ItemIndex := 0;
end;

end.
