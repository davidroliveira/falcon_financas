unit U_Mensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniGUIBaseClasses, uniMemo, UniHTMLMemo,
  uniLabel, uniImage, uniButton, uniBitBtn, uniScreenMask, uniGUIFrame,
  uADCompClient;


  type
    TFormMensagem = class(TUniForm)
    UniHTMLMemoMensagem: TUniHTMLMemo;
    pn_mensagem: TUniPanel;
    UniImage1: TUniImage;
    lb_mensagem_principal: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    pn_enviar: TUniPanel;
    bt_enviar: TUniBitBtn;
    UniHTMLMemoErro: TUniHTMLMemo;
    procedure bt_enviarClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    Conexao                                                                     :TADConnection;
    Transaction                                                                 :TADTransaction;
    SQLQuery                                                                    :TADQuery;

    Anexo                                                                       :TStringList;
    Corpo                                                                       :String;
  public
    { Public declarations }
  end;

function FormMensagem: TFormMensagem;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, U_Grava_Email, U_Sessao;

function FormMensagem: TFormMensagem;
begin
  Result := TFormMensagem(ID.GetFormInstance(TFormMensagem));
end;

procedure TFormMensagem.bt_enviarClick(Sender: TObject);
var
  texto, corpo_auxiliar : String;
begin
  try
    if Not(Transaction.Active) then
      Transaction.StartTransaction;

    Anexo := TStringList.Create;

    SQLQuery.SQL.Clear;
    SQLQuery.SQL.Add('SELECT PARAMETRO_LONG FROM PARAMETROS                       '+
                     ' WHERE MODULO = ''GERAL''                                   '+
                     '   AND TITULO = ''HTML - LAYOUT - PADRAO'' ');
    SQLQuery.Open;
    corpo_auxiliar:= SQLQuery.Fields[0].AsString;

    texto := UniHTMLMemoErro.Lines.Text;
    texto := texto + '<br> Usuário: '+id.nome_glo_usuario+
                     '<br> E-mail: '+id.email_glo_usuario+'<br>';
    texto := texto + UniHTMLMemoMensagem.Text;

    Corpo := StringReplace(corpo_auxiliar,'[TEXTO]',texto,[rfIgnoreCase]);

    GravaEmail('Erro Sistema','Falcon Finanças','smart@v-agro.com.br','marlonnardi@hotmail.com','','','Bug - Falcon Finanças',Corpo,Anexo,Conexao);

    Conexao.Commit;

    ShowMessage('E-mail enviado com Sucesso! <br><br> '+
                'Este erro será analisado e corrigido o mais rápido possível.<br><br> '+
                'Obrigado pela colaboração.');

  finally
    FreeAndNil(SQLQuery);
    FreeAndNil(Anexo);
    FormMensagem.Close;
  end;
end;

procedure TFormMensagem.UniFormCreate(Sender: TObject);
begin
  Conexao := TADConnection.Create(Self);
  SessaoFireDac(TUniFrame(Self),Conexao,'utf8');

  Transaction         := TADTransaction.Create(Self);
  SQLQuery            := TADQuery.Create(Self);

  Seta_Conexao_FireDac(TUniFrame(Self), Conexao);

end;

end.
