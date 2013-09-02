{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}
unit U_Financeiro;

interface

uses
  SqlExpr;

type
  TFinanceiro = record
  private
    { Private declarations }
  public
    { Public declarations }
    AD      : String;
    AP      : String;
    Erro    : Boolean;
    Msg_Erro: String;
  end;


function inclui_ad_ap(des_docum, docum, ser_docum, tipo, periodo, parcelas, id_tip_despesa, id_fornecedor :String; valor: Real; vencimento :Tdate; Conexao: TSQLConnection):TFinanceiro;

implementation

uses
  SysUtils, MainModule;

function inclui_ad_ap(des_docum, docum, ser_docum, tipo, periodo, parcelas, id_tip_despesa, id_fornecedor :String; valor: Real; vencimento :Tdate; Conexao: TSQLConnection):TFinanceiro;
var
  SQLQuery                                                                      :TSQLQuery;
  Financeiro                                                                    :TFinanceiro;
  ad, ap                                                                        :String;
begin
  try
    try
      Financeiro.Erro      := False;

      SQLQuery  := TSQLQuery.Create(Nil);
      SQLQuery.SQLConnection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('INSERT INTO CAP_AD                                      '+
                       '           (ID_MASTER,                                  '+
                       '            ID_EMPRESA,                                 '+
                       '            DESCRICAO_DOCUM,                            '+
                       '            NUM_DOCUM,                                  '+
                       '            SERIE_DOCUM,                                '+
                       '            TIPO_DOCUM,                                 '+
                       '            TIPO_DOCUM_SITUACAO,                        '+
                       '            PERIODO,                                    '+
                       '            NUM_PARCELAS,                               '+
                       '            DAT_CADASTRO,                               '+
                       '            ID_USUARIO)                                 '+
                       '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,  '+
                       '            :P07, :P08, SYSDATE(), :P09)                ');
      SQLQuery.Params[00].AsString  := ID.id_glo_master;
      SQLQuery.Params[01].AsString  := ID.id_glo_empresa;
      SQLQuery.Params[02].AsString  := des_docum;
      SQLQuery.Params[03].AsString  := docum;
      SQLQuery.Params[04].AsString  := ser_docum;
      SQLQuery.Params[05].AsString  := tipo;
      SQLQuery.Params[06].AsString  := 'A';
      SQLQuery.Params[07].AsString  := periodo;
      SQLQuery.Params[08].AsString  := parcelas;
      SQLQuery.Params[09].AsString  := ID.id_glo_usuario;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT MAX(ID_CAP_AD) FROM CAP_AD                       '+
                       ' WHERE ID_MASTER  = :P00                                '+
                       '   AND ID_EMPRESA = :P01                                '+
                       '   AND ID_USUARIO = :P02                                ');
      SQLQuery.Params[00].AsString  := ID.id_glo_master;
      SQLQuery.Params[01].AsString  := ID.id_glo_empresa;
      SQLQuery.Params[02].AsString  := ID.id_glo_usuario;
      SQLQuery.Open;

      ad  := SQLQuery.Fields[0].AsString;

      if tipo = 'N' then //Normal
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CAP_AD                                  '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CAP_AD,                              '+
                           '            ID_TIPO_DESPESA,                        '+
                           '            ID_F_C,                                 '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_MULTA,                              '+
                           '            VAL_JUROS,                              '+
                           '            VAL_DESCONTO,                           '+
                           '            TIP_PAGAMENTO,                          '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_PAGAMENTO,                          '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,      '+
                           '            :P07, :P07, :P08, :P09, :P10, :P11, SYSDATE(), '+
                           '            :P12)                                   ');
          SQLQuery.Params[00].AsString  := ID.id_glo_master;
          SQLQuery.Params[01].AsString  := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := ad;
          SQLQuery.Params[03].AsString  := id_tip_despesa;
          SQLQuery.Params[04].AsString  := id_fornecedor;
          SQLQuery.Params[05].AsFloat   := valor;
          SQLQuery.Params[06].AsFloat   := 0;
          SQLQuery.Params[07].AsFloat   := 0;
          SQLQuery.Params[08].AsFloat   := 0;
          SQLQuery.Params[09].AsString  := 'A';
          SQLQuery.Params[10].AsDate    := FormatDateTime('yyyy-mm-dd',vencimento);
          SQLQuery.Params[11].AsString  := EmptyStr;
          SQLQuery.Params[12].AsString  := ID.id_glo_usuario;
          SQLQuery.ExecSQL;
        end;

      if tipo = 'P' then //Parcelada
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CAP_AD                                  '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CAP_AD,                              '+
                           '            ID_TIPO_DESPESA,                        '+
                           '            ID_F_C,                                 '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_MULTA,                              '+
                           '            VAL_JUROS,                              '+
                           '            VAL_DESCONTO,                           '+
                           '            TIP_PAGAMENTO,                          '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_PAGAMENTO,                          '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,      '+
                           '            :P07, :P07, :P08, :P09, :P10, :P11, SYSDATE(), '+
                           '            :P12)                                   ');
          SQLQuery.Params[00].AsString  := ID.id_glo_master;
          SQLQuery.Params[01].AsString  := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := ad;
          SQLQuery.Params[03].AsString  := id_tip_despesa;
          SQLQuery.Params[04].AsString  := id_fornecedor;
          SQLQuery.Params[05].AsFloat   := valor;
          SQLQuery.Params[06].AsFloat   := 0;
          SQLQuery.Params[07].AsFloat   := 0;
          SQLQuery.Params[08].AsFloat   := 0;
          SQLQuery.Params[09].AsString  := 'A';
          SQLQuery.Params[10].AsString  := FormatDateTime('yyyy-mm-dd',vencimento);
          SQLQuery.Params[11].AsString  := EmptyStr;
          SQLQuery.Params[12].AsString  := ID.id_glo_usuario;
          SQLQuery.ExecSQL;
        end;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT MAX(ID_CAP_AP) FROM CAP_AP                       '+
                       ' WHERE ID_MASTER  :P00                                  '+
                       '   AND ID_EMPRESA :P01                                  '+
                       '   AND ID_USUARIO :P02                                  ');
      SQLQuery.Params[00].AsString  := ID.id_glo_master;
      SQLQuery.Params[01].AsString  := ID.id_glo_empresa;
      SQLQuery.Params[01].AsString  := ID.id_glo_usuario;
      SQLQuery.Open;

      ap  := SQLQuery.Fields[0].AsString;

      Financeiro.AD   := ad;
      Financeiro.AP   := ap;
      Financeiro.Erro := False;
    except
      on e: exception do
        begin
          Financeiro.Msg_Erro := e.Message;
          Financeiro.Erro     := True;
        end;
    end;
  finally
    Result  := Financeiro;
    FreeAndNil(SQLQuery);
  end;
end;



end.
