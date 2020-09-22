unit uFinanceiro.Controller.Interfaces;

interface

type
   TFormaPagamento = (fpDinheiro, fpDebitoEmConta, fpCreditoAVista, fpCreditoParcelado, fpBoleto, fpDuplicata);

   iControllerFormaPagamento = interface
      ['{2EA634EE-F3D5-4CB5-9D39-26A61BF04673}']

//      function FormaPagamento(pFormaPagamento: TFormaPagamento): iFormaPagamento;
   end;


implementation

end.
