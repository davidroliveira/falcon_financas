{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module'

{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  Financas;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {ID_ALL: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {ID: TUniGUIMainModule},
  Main in 'Main.pas' {FormLogin: TUniForm},
  U_Principal in 'U_Principal.pas' {FormPrincipal: TUniForm},
  U_Cadastro in 'U_Cadastro.pas' {FormCadastro: TUniForm},
  U_DM in 'U_DM.pas' {DM: TDataModule},
  U_Global in 'funcoes\U_Global.pas',
  U_Funcao_valida_senha in 'funcoes\U_Funcao_valida_senha.pas',
  U_Funcao_Versao in 'funcoes\U_Funcao_Versao.pas',
  U_Cad_Heranca in 'U_Cad_Heranca.pas' {FormCad_Heranca: TUniForm},
  U_Cad_Heranca_Frame in 'U_Cad_Heranca_Frame.pas' {FrameCad_Heranca_Frame: TUniFrame},
  U_Verifica_Campo_Null in 'funcoes\U_Verifica_Campo_Null.pas',
  U_Esqueci_Minha_Senha in 'U_Esqueci_Minha_Senha.pas' {FormEsqueci_Minha_Senha: TUniForm},
  U_Sessao in 'funcoes\U_Sessao.pas',
  U_Cad_Tipo_Receita in 'U_Cad_Tipo_Receita.pas' {FormCad_Tipo_Receita: TUniForm},
  U_Empresa_Conectar in 'U_Empresa_Conectar.pas' {FormEmpresa_Conectar: TUniForm},
  U_Contas_a_Pagar in 'U_Contas_a_Pagar.pas' {FrameContas_a_Pagar: TUniFrame},
  U_Graficos_Tela_Principal in 'U_Graficos_Tela_Principal.pas' {FrameGraficos_Tela_Principal: TUniFrame},
  U_Mensagem in 'U_Mensagem.pas' {FormMensagem: TUniForm},
  U_Contas in 'U_Contas.pas' {FormCad_Contas: TUniForm},
  U_Cad_Tipo_Despesa in 'U_Cad_Tipo_Despesa.pas' {FormCad_Tipo_Despesa: TUniForm},
  U_Cad_Cliente_Fornecedor in 'U_Cad_Cliente_Fornecedor.pas' {FormCad_Cliente_Fornecedor: TUniForm},
  U_Grava_Email in 'funcoes\U_Grava_Email.pas',
  U_Pagina_Web in 'U_Pagina_Web.pas' {FormPagina_Web: TUniForm},
  U_Cookies in 'funcoes\U_Cookies.pas',
  U_Financeiro in 'funcoes\U_Financeiro.pas',
  U_Confirmacao_Pagamento_Recebimento in 'U_Confirmacao_Pagamento_Recebimento.pas' {FormConfirmacao_Pagamento_Recebimento: TUniForm},
  U_Carrega_Combo in 'funcoes\U_Carrega_Combo.pas',
  U_Confirmacao_Exclusao in 'U_Confirmacao_Exclusao.pas' {FormConfirmacao_Exclusao: TUniForm},
  U_Imagens in 'funcoes\U_Imagens.pas',
  U_JS_Humane in 'funcoes\U_JS_Humane.pas',
  U_Filtro_Calendario in 'funcoes\U_Filtro_Calendario.pas',
  U_Anexos in 'funcoes\U_Anexos.pas',
  U_Funcao_Exporta_Html in 'funcoes\U_Funcao_Exporta_Html.pas',
  U_Contas_a_Receber in 'U_Contas_a_Receber.pas' {FrameContas_a_Receber: TUniFrame},
  U_DM_Imagens in 'U_DM_Imagens.pas' {DM_Imagens: TDataModule},
  U_Transferencia_Saldo in 'U_Transferencia_Saldo.pas' {FormTransferencia_Saldo: TUniForm},
  U_Graficos in 'funcoes\U_Graficos.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

{$ifdef UNIGUI_VCL}
  Application.Initialize;
  TID_ALL.Create(Application);
  Application.Title := 'Falcon Financas - Gerenciador Financeiro';
  Application.Run;
{$endif}
end.
