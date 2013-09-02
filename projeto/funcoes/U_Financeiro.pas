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
  DateUtils, uniGUIDialogs, uADCompClient;

type
  TFinanceiro = record
  private
    { Private declarations }
    id_documento, id_parcela, dia_venc                                          :String;
    venc_aux                                                                    :TDate;
    saldo                                                                       :Real;
    resultado                                                                   :Integer;

  public
    { Public declarations }

    documento, parcela, tipo                                                    :String;
    saldo_parcela                                                               :Real;

    Msg_Erro                                                                    :String;
    Erro, Alerta                                                                :Boolean;


  end;

{:: CONTAS A PAGAR ::}

{Inclui o Documento e Parcela Conforme os Parâmetros passados}
function inclui_ad_ap(des_docum, docum, ser_docum, tipo_docum, periodo, parcelas, id_tip_despesa, id_fornecedor :String; valor: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
{Realiza as Alterações do Documento e Parcela Conforme os Parâmetros passados}
function altera_ad_ap(id_ad, id_ap :Integer; des_docum, docum, tipo_docum, periodo, parcelas, id_tip_despesa, id_fornecedor :String; valor, valor_juros, valor_multa, valor_desconto: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
{Realiza a Baixa da Parcela (Realiza Pagamento)}
function baixa_ap(id_ap, id_contas :Integer; valor, valor_juros, valor_multa, valor_desconto: Real; pagamento :Tdate; Conexao: TADConnection):TFinanceiro;
{Remove a Baixa (Pagamento) da Parcela}
function remove_baixa_ap(id_cap_ap_valores, id_cap_ap :Integer; Conexao: TADConnection):TFinanceiro;
{Realiza a Exclusão da Parcela Conforme os Parâmetros passados}
function exclusao_ap(id_ad, id_ap, tipo_exclusao :Integer; tipo_docum: String; Conexao: TADConnection):TFinanceiro;

{:: CONTAS A RECEBER ::}

{Inclui o Documento e Parcela Conforme os Parâmetros passados}
function inclui_cre_par(des_docum, docum, tipo_docum, periodo, parcelas, id_tip_receita, id_cliente :String; valor: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
{Realiza as Alterações do Documento e Parcela Conforme os Parâmetros passados}
function altera_doc_par(id_cre_doc, id_cre_par :Integer; des_docum, docum, tipo_docum, periodo, parcelas, id_tip_receita, id_cliente :String; valor, valor_juros: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
{Realiza a Baixa da Parcela (Realiza Recebimento)}
function baixa_par(id_cre_par, id_contas :Integer; valor, valor_juros: Real; recebimento :Tdate; Conexao: TADConnection):TFinanceiro;
{Remove a Baixa (Recebimento) da Parcela}
function remove_baixa_par(id_cre_par_valores, id_cre_par :Integer; Conexao: TADConnection):TFinanceiro;
{Realiza a Exclusão da Parcela Conforme os Parâmetros passados}
function exclusao_par(id_cre_doc, id_cre_par, tipo_exclusao :Integer; tipo_docum: String; Conexao: TADConnection):TFinanceiro;

{:: MOVIMENTACAO SALDOS DAS CONTAS ::}

implementation

uses
  SysUtils, MainModule, U_Global, uniGUIApplication;

{:: CONTAS A PAGAR ::}

function inclui_ad_ap(des_docum, docum, ser_docum, tipo_docum, periodo, parcelas, id_tip_despesa, id_fornecedor :String; valor: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
  I                                                                             :Integer;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      Financeiro.dia_venc  := FormatDateTime('dd',vencimento);
      Financeiro.venc_aux  := vencimento;

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
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsString  := des_docum;
      SQLQuery.Params[03].AsString  := docum;
      SQLQuery.Params[04].AsString  := ser_docum;
      SQLQuery.Params[05].AsString  := tipo_docum;
      SQLQuery.Params[06].AsString  := 'A';
      SQLQuery.Params[07].AsString  := periodo;
      SQLQuery.Params[08].AsString  := parcelas;
      SQLQuery.Params[09].AsInteger := ID.id_glo_usuario;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT MAX(ID_CAP_AD) FROM CAP_AD                       '+
                       ' WHERE ID_MASTER  = :P00                                '+
                       '   AND ID_EMPRESA = :P01                                '+
                       '   AND ID_USUARIO = :P02                                ');
      SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger  := ID.id_glo_usuario;
      SQLQuery.Open;

      Financeiro.id_documento  := SQLQuery.Fields[0].AsString;

      if tipo_docum = 'N' then //Normal
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CAP_AP                                  '+
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
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,  '+
                           '            :P07, :P08, :P09, :P10, NULL, SYSDATE(),   '+
                           '            :P11)                                   ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := Financeiro.id_documento;
          SQLQuery.Params[03].AsString  := id_tip_despesa;
          SQLQuery.Params[04].AsString  := id_fornecedor;
          SQLQuery.Params[05].AsFloat   := valor;
          SQLQuery.Params[06].AsFloat   := 0;
          SQLQuery.Params[07].AsFloat   := 0;
          SQLQuery.Params[08].AsFloat   := 0;
          SQLQuery.Params[09].AsString  := 'A';
          SQLQuery.Params[10].AsDate    := vencimento;
          SQLQuery.Params[11].AsInteger := ID.id_glo_usuario;
          SQLQuery.ExecSQL;
        end;

      if tipo_docum = 'P' then //Parcelada
        begin
          {Inclui as Primeira Parcela}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CAP_AP                                  '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CAP_AD,                              '+
                           '            ID_TIPO_DESPESA,                        '+
                           '            ID_F_C,                                 '+
                           '            PARCELA,                                '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_MULTA,                              '+
                           '            VAL_JUROS,                              '+
                           '            VAL_DESCONTO,                           '+
                           '            TIP_PAGAMENTO,                          '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_PAGAMENTO,                          '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,     '+
                           '            :P07, :P08, :P09, :P10, :P11, NULL, SYSDATE(),'+
                           '            :P12)                                   ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := Financeiro.id_documento;
          SQLQuery.Params[03].AsString  := id_tip_despesa;
          SQLQuery.Params[04].AsString  := id_fornecedor;
          SQLQuery.Params[05].AsInteger := 1;
          SQLQuery.Params[06].AsFloat   := valor;
          SQLQuery.Params[07].AsFloat   := 0;
          SQLQuery.Params[08].AsFloat   := 0;
          SQLQuery.Params[09].AsFloat   := 0;
          SQLQuery.Params[10].AsString  := 'A';
          SQLQuery.Params[11].AsDate    := vencimento;
          SQLQuery.Params[12].AsInteger := ID.id_glo_usuario;
          SQLQuery.ExecSQL;

          {Verifica Qual é Periodo e o Nº de Parcelas Para Geração das Parcelas}
          for I := 2 to StrToInt(parcelas) do
            begin
              if periodo = 'Semanal' then
                Financeiro.venc_aux  := IncWeek(Financeiro.venc_aux,1);
              if periodo = 'Quinzenal' then
                Financeiro.venc_aux  := IncDay(Financeiro.venc_aux,15);
              if periodo = 'Mensal' then
                begin
                  Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,1);
                  if Financeiro.dia_venc <> FormatDateTime('dd',Financeiro.venc_aux) then
                    begin
                      if StrToInt(Financeiro.dia_venc) > DaysInMonth(Financeiro.venc_aux) then
                        Financeiro.venc_aux  :=  StrToDate(IntToStr(DaysInMonth(Financeiro.venc_aux))+Copy(DateToStr(Financeiro.venc_aux),3,8))
                      else
                        Financeiro.venc_aux  := StrToDate(Financeiro.dia_venc+Copy(DateToStr(Financeiro.venc_aux),3,8));
                    end;
                end;
              if periodo = 'Trimestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,3);
              if periodo = 'Semestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,6);
              if periodo = 'Anual' then
                Financeiro.venc_aux  := IncYear(Financeiro.venc_aux,1);

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('INSERT INTO CAP_AP                              '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CAP_AD,                              '+
                           '            ID_TIPO_DESPESA,                        '+
                           '            ID_F_C,                                 '+
                           '            PARCELA,                                '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_MULTA,                              '+
                           '            VAL_JUROS,                              '+
                           '            VAL_DESCONTO,                           '+
                           '            TIP_PAGAMENTO,                          '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_PAGAMENTO,                          '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,     '+
                           '            :P07, :P08, :P09, :P10, :P11, NULL, SYSDATE(),'+
                           '            :P12)                                   ');
              SQLQuery.Params[00].AsInteger := ID.id_glo_master;
              SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
              SQLQuery.Params[02].AsString  := Financeiro.id_documento;
              SQLQuery.Params[03].AsString  := id_tip_despesa;
              SQLQuery.Params[04].AsString  := id_fornecedor;
              SQLQuery.Params[05].AsInteger := I;
              SQLQuery.Params[06].AsFloat   := valor;
              SQLQuery.Params[07].AsFloat   := 0;
              SQLQuery.Params[08].AsFloat   := 0;
              SQLQuery.Params[09].AsFloat   := 0;
              SQLQuery.Params[10].AsString  := 'A';
              SQLQuery.Params[11].AsDate    := Financeiro.venc_aux;
              SQLQuery.Params[12].AsInteger := ID.id_glo_usuario;
              SQLQuery.ExecSQL;
            end;
        end;

      if tipo_docum = 'R' then //Recorrente
        begin
          {Inclui as Primeira Parcela}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CAP_AP                                  '+
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
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,  '+
                           '            :P07, :P08, :P09, :P10, NULL, SYSDATE(),   '+
                           '            :P11)                                   ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := Financeiro.id_documento;
          SQLQuery.Params[03].AsString  := id_tip_despesa;
          SQLQuery.Params[04].AsString  := id_fornecedor;
          SQLQuery.Params[05].AsFloat   := valor;
          SQLQuery.Params[06].AsFloat   := 0;
          SQLQuery.Params[07].AsFloat   := 0;
          SQLQuery.Params[08].AsFloat   := 0;
          SQLQuery.Params[09].AsString  := 'A';
          SQLQuery.Params[10].AsDate    := vencimento;
          SQLQuery.Params[11].AsInteger := ID.id_glo_usuario;
          SQLQuery.ExecSQL;

          {Realiza a Inclusão das Parcelas Durante o Periodo de +- 1 Ano (Existe um JOB que ficará executando para geração das Novas Parcelas de Forma Automática)}
          if periodo = 'Semanal' then
            parcelas  := '52';
          if periodo = 'Quinzenal' then
            parcelas  := '24';
          if periodo = 'Mensal' then
            parcelas  := '12';
          if periodo = 'Trimestral' then
            parcelas  := '4';
          if periodo = 'Semestral' then
            parcelas  := '2';
          if periodo = 'Anual' then
            parcelas  := '1';

          for I := 2 to StrToInt(parcelas) do
            begin
              if periodo = 'Semanal' then
                Financeiro.venc_aux  := IncWeek(Financeiro.venc_aux,1);
              if periodo = 'Quinzenal' then
                Financeiro.venc_aux  := IncDay(Financeiro.venc_aux,15);
              if periodo = 'Mensal' then
                begin
                  Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,1);
                  if Financeiro.dia_venc <> FormatDateTime('dd',Financeiro.venc_aux) then
                    begin
                      if StrToInt(Financeiro.dia_venc) > DaysInMonth(Financeiro.venc_aux) then
                        Financeiro.venc_aux  :=  StrToDate(IntToStr(DaysInMonth(Financeiro.venc_aux))+Copy(DateToStr(Financeiro.venc_aux),3,8))
                      else
                        Financeiro.venc_aux  := StrToDate(Financeiro.dia_venc+Copy(DateToStr(Financeiro.venc_aux),3,8));
                    end;
                end;
              if periodo = 'Trimestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,3);
              if periodo = 'Semestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,6);
              if periodo = 'Anual' then
                Financeiro.venc_aux  := IncYear(Financeiro.venc_aux,1);

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('INSERT INTO CAP_AP                                  '+
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
                               '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, :P06,  '+
                               '            :P07, :P08, :P09, :P10, NULL, SYSDATE(),   '+
                               '            :P11)                                   ');
              SQLQuery.Params[00].AsInteger := ID.id_glo_master;
              SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
              SQLQuery.Params[02].AsString  := Financeiro.id_documento;
              SQLQuery.Params[03].AsString  := id_tip_despesa;
              SQLQuery.Params[04].AsString  := id_fornecedor;
              SQLQuery.Params[05].AsFloat   := valor;
              SQLQuery.Params[06].AsFloat   := 0;
              SQLQuery.Params[07].AsFloat   := 0;
              SQLQuery.Params[08].AsFloat   := 0;
              SQLQuery.Params[09].AsString  := 'A';
              SQLQuery.Params[10].AsDate    := Financeiro.venc_aux;
              SQLQuery.Params[11].AsInteger := ID.id_glo_usuario;
              SQLQuery.ExecSQL;
            end;

          {Atualiza o Ultimo Vencimento}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('UPDATE CAP_AD SET DAT_ULTIMO_VENCIMENTO = :P00      '+
                           ' WHERE ID_MASTER  = :P01                            '+
                           '   AND ID_EMPRESA = :P02                            '+
                           '   AND ID_CAP_AD  = :P03                            ');
          SQLQuery.Params[00].AsDate    := Financeiro.venc_aux;
          SQLQuery.Params[01].AsInteger := ID.id_glo_master;
          SQLQuery.Params[02].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[03].AsString  := Financeiro.id_documento;
          SQLQuery.ExecSQL;
        end;


      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT MAX(ID_CAP_AP) FROM CAP_AP                       '+
                       ' WHERE ID_MASTER  = :P00                                '+
                       '   AND ID_EMPRESA = :P01                                '+
                       '   AND ID_USUARIO = :P02                                ');
      SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger  := ID.id_glo_usuario;
      SQLQuery.Open;

      Financeiro.id_parcela   := SQLQuery.Fields[0].AsString;

      Financeiro.documento    := Financeiro.id_documento;
      Financeiro.parcela      := Financeiro.id_parcela;
      Financeiro.Erro         := False;
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

function baixa_ap(id_ap, id_contas :Integer; valor, valor_juros, valor_multa, valor_desconto: Real; pagamento :Tdate; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      if valor <= 0 then
        begin
          ShowMessage('Valor Informado não pode ser menor ou igual a R$ 0,00');
          Exit;
        end;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('    SELECT ( AVG(A.VAL_PARCELA) - IFNULL(SUM(B.VALOR),0) ) SALDO      '+
                       '      FROM CAP_AP                A                                    '+
                       'LEFT OUTER JOIN CAP_AP_VALORES   B  ON A.ID_MASTER    = B.ID_MASTER   '+
                       '                                   AND A.ID_EMPRESA   = B.ID_EMPRESA  '+
                       '                                   AND A.ID_CAP_AP    = B.ID_CAP_AP   '+
                       '    WHERE A.ID_MASTER     = :ID_MASTER                                '+
                       '      AND A.ID_EMPRESA    = :ID_EMPRESA                               '+
                       '      AND A.ID_CAP_AP     = :ID_CAP_AP                                ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_ap;
      SQLQuery.Open;
      Financeiro.saldo := SQLQuery.Fields[0].AsFloat;

      if valor > Financeiro.saldo then
        begin
          ShowMessage('Valor Informado '+FormatFloat('R$ ###,###,##0.00',valor)+
                      ' Ultrapassa o Valor de Saldo '+FormatFloat('R$ ###,###,##0.00',SQLQuery.Fields[0].AsFloat)+'. ');
          Financeiro.Alerta := True;
          Exit;
        end;

      SQLQuery.SQL.Clear;
      if valor < Financeiro.saldo then
      SQLQuery.SQL.Add('UPDATE CAP_AP SET TIP_PAGAMENTO = ''P'',                ');
      if valor = Financeiro.saldo then
      SQLQuery.SQL.Add('UPDATE CAP_AP SET TIP_PAGAMENTO = ''T'',                ');
      SQLQuery.SQL.Add('                  DAT_PAGAMENTO = :P00,                 ');
      SQLQuery.SQL.Add('                  VAL_JUROS     = :P01,                 ');
      SQLQuery.SQL.Add('                  VAL_MULTA     = :P02,                 ');
      SQLQuery.SQL.Add('                  VAL_DESCONTO  = :P03                  ');
      SQLQuery.SQL.Add(' WHERE ID_MASTER     = :P04                             ');
      SQLQuery.SQL.Add('   AND ID_EMPRESA    = :P05                             ');
      SQLQuery.SQL.Add('   AND ID_CAP_AP     = :P06                             ');
      SQLQuery.Params[00].AsDate    := pagamento;
      SQLQuery.Params[01].AsFloat   := valor_juros;
      SQLQuery.Params[02].AsFloat   := valor_multa;
      SQLQuery.Params[03].AsFloat   := valor_desconto;
      SQLQuery.Params[04].AsInteger := ID.id_glo_master;
      SQLQuery.Params[05].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[06].AsInteger := id_ap;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('INSERT INTO CAP_AP_VALORES                              '+
                       '           (ID_MASTER,                                  '+
                       '            ID_EMPRESA,                                 '+
                       '            ID_CAP_AP,                                  '+
                       '            ID_CONTAS,                                  '+
                       '            DAT_PAGAMENTO,                              '+
                       '            VALOR)                                      '+
                       '    VALUES (:P00, :P01, :P02, :P03, :P04, :P05)         ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_ap;
      SQLQuery.Params[03].AsInteger := id_contas;
      SQLQuery.Params[04].AsDate    := pagamento;
      SQLQuery.Params[05].AsFloat   := valor;
      SQLQuery.ExecSQL;

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

function remove_baixa_ap(id_cap_ap_valores, id_cap_ap :Integer; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('DELETE FROM CAP_AP_VALORES                              '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CAP_AP_VALORES  = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cap_ap_valores;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT COUNT(*) FROM CAP_AP_VALORES                     '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CAP_AP          = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cap_ap;
      SQLQuery.Open;
      Financeiro.resultado := SQLQuery.Fields[0].AsInteger;

      if Financeiro.resultado = 0 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('UPDATE CAP_AP SET DAT_PAGAMENTO = NULL,             '+
                           '                  TIP_PAGAMENTO = ''A''             '+
                           ' WHERE ID_MASTER          = :P00                    '+
                           '   AND ID_EMPRESA         = :P01                    '+
                           '   AND ID_CAP_AP          = :P02                    ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsInteger := id_cap_ap;
          SQLQuery.ExecSQL;

          Financeiro.tipo  := 'A';
        end;
      if Financeiro.resultado > 0 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('UPDATE CAP_AP SET TIP_PAGAMENTO = ''P''             '+
                           ' WHERE ID_MASTER          = :P00                    '+
                           '   AND ID_EMPRESA         = :P01                    '+
                           '   AND ID_CAP_AP          = :P02                    ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsInteger := id_cap_ap;
          SQLQuery.ExecSQL;

          Financeiro.tipo  := 'P';
        end;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT SUM(VALOR) FROM CAP_AP_VALORES                   '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CAP_AP          = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cap_ap;
      SQLQuery.Open;

      Financeiro.saldo_parcela := SQLQuery.Fields[0].AsFloat;

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

function altera_ad_ap(id_ad, id_ap :Integer; des_docum, docum, tipo_docum, periodo, parcelas, id_tip_despesa, id_fornecedor :String; valor, valor_juros, valor_multa, valor_desconto: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('UPDATE CAP_AD SET DESCRICAO_DOCUM  =:P00,               '+
                       '                  NUM_DOCUM        =:P01,               '+
                       '                  TIPO_DOCUM       =:P02,               '+
                       '                  PERIODO          =:P03,               '+
                       '                  NUM_PARCELAS     =:P04                '+
                       ' WHERE ID_MASTER                   =:P05                '+
                       '   AND ID_EMPRESA                  =:P06                '+
                       '   AND ID_CAP_AD                   =:P07                ');
      SQLQuery.Params[00].AsString  := des_docum;
      SQLQuery.Params[01].AsString  := docum;
      SQLQuery.Params[02].AsString  := tipo_docum;
      SQLQuery.Params[03].AsString  := periodo;
      SQLQuery.Params[04].AsString  := parcelas;
      SQLQuery.Params[05].AsInteger := ID.id_glo_master;
      SQLQuery.Params[06].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[07].AsInteger := id_ad;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('UPDATE CAP_AP SET ID_TIPO_DESPESA  =:P00,               '+
                       '                  ID_F_C           =:P01,               '+
                       '                  VAL_PARCELA      =:P02,               '+
                       '                  VAL_MULTA        =:P03,               '+
                       '                  VAL_JUROS        =:P04,               '+
                       '                  VAL_DESCONTO     =:P05,               '+
                       '                  DAT_VENCIMENTO   =:P06                '+
                       ' WHERE ID_MASTER                   =:P07                '+
                       '   AND ID_EMPRESA                  =:P08                '+
                       '   AND ID_CAP_AP                   =:P09                ');
      SQLQuery.Params[00].AsString  := id_tip_despesa;
      SQLQuery.Params[01].AsString  := id_fornecedor;
      SQLQuery.Params[02].AsFloat   := valor;
      SQLQuery.Params[03].AsFloat   := valor_multa;
      SQLQuery.Params[04].AsFloat   := valor_juros;
      SQLQuery.Params[05].AsFloat   := valor_desconto;
      SQLQuery.Params[06].AsDate    := vencimento;
      SQLQuery.Params[07].AsInteger := ID.id_glo_master;
      SQLQuery.Params[08].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[09].AsInteger := id_ap;
      SQLQuery.ExecSQL;

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

function exclusao_ap(id_ad, id_ap, tipo_exclusao :Integer; tipo_docum: String; Conexao: TADConnection):TFinanceiro;

  procedure excluir_ap(id_ap:Integer);
  var
    SQLQuery :TADQuery;
  begin
    try
      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('DELETE FROM CAP_AP                                      '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CAP_AP          = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_ap;
      SQLQuery.ExecSQL;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;

  procedure excluir_ad(id_ad:Integer);
  var
    SQLQuery :TADQuery;
  begin
    try
      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('DELETE A FROM CAP_AD A                                      '+
                       ' WHERE A.ID_MASTER          = :P00                          '+
                       '   AND A.ID_EMPRESA         = :P01                          '+
                       '   AND A.ID_CAP_AD          = :P02                          '+
                       '   AND NOT EXISTS (SELECT ''X'' FROM CAP_AP B               '+
                       '                    WHERE A.ID_MASTER       = B.ID_MASTER   '+
                       '                      AND A.ID_EMPRESA      = B.ID_EMPRESA  '+
                       '                      AND A.ID_CAP_AD       = B.ID_CAP_AD)  ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_ad;
      SQLQuery.ExecSQL;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;

  procedure excluir_ap_geral(id_ad, id_ap, tipo_exclusao :Integer);
  var
    SQLQuery, SQLQuery_Aux :TADQuery;
  begin
    try
      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery_Aux  := TADQuery.Create(Nil);
      SQLQuery_Aux.Connection  := Conexao;

      if tipo_exclusao = 1 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT A.ID_CAP_AP FROM CAP_AP A                           ');
          SQLQuery.SQL.Add(' WHERE A.ID_MASTER     = :P00                              ');
          SQLQuery.SQL.Add('   AND A.ID_EMPRESA    = :P01                              ');
          SQLQuery.SQL.Add('   AND A.ID_CAP_AD     = :P02                              ');
          SQLQuery.SQL.Add('   AND A.TIP_PAGAMENTO = ''A''                             ');
          SQLQuery.SQL.Add('   AND EXISTS (SELECT ''X'' FROM CAP_AP B                  ');
          SQLQuery.SQL.Add('              WHERE A.ID_MASTER       =  B.ID_MASTER       ');
          SQLQuery.SQL.Add('                AND A.ID_EMPRESA      =  B.ID_EMPRESA      ');
          SQLQuery.SQL.Add('                AND A.ID_CAP_AD       =  B.ID_CAP_AD       ');
          SQLQuery.SQL.Add('                AND A.TIP_PAGAMENTO   =  B.TIP_PAGAMENTO   ');
          SQLQuery.SQL.Add('                AND A.DAT_VENCIMENTO  >= B.DAT_VENCIMENTO  ');
          SQLQuery.SQL.Add('                AND B.ID_CAP_AP       = :P03)              ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsInteger := id_ad;
          SQLQuery.Params[03].AsInteger := id_ap;
          SQLQuery.Open;
          SQLQuery.First;
          while Not(SQLQuery.Eof) do
            begin
              SQLQuery_Aux.SQL.Clear;
              SQLQuery_Aux.SQL.Add('DELETE A FROM CAP_AP A           ');
              SQLQuery_Aux.SQL.Add(' WHERE A.ID_MASTER     = :P00    ');
              SQLQuery_Aux.SQL.Add('   AND A.ID_EMPRESA    = :P01    ');
              SQLQuery_Aux.SQL.Add('   AND A.ID_CAP_AP     = :P02    ');
              SQLQuery_Aux.SQL.Add('   AND A.TIP_PAGAMENTO = ''A''   ');
              SQLQuery_Aux.Params[00].AsInteger := ID.id_glo_master;
              SQLQuery_Aux.Params[01].AsInteger := ID.id_glo_empresa;
              SQLQuery_Aux.Params[02].AsInteger := SQLQuery.FieldByName('ID_CAP_AP').AsInteger;
              SQLQuery_Aux.ExecSQL;

              SQLQuery.Next;
            end;
        end;

      if tipo_exclusao = 2 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('DELETE A FROM CAP_AP A                                               ');
          SQLQuery.SQL.Add(' WHERE A.ID_MASTER     = '''+IntToStr(ID.id_glo_master)+'''          ');
          SQLQuery.SQL.Add('   AND A.ID_EMPRESA    = '''+IntToStr(ID.id_glo_empresa)+'''         ');
          SQLQuery.SQL.Add('   AND A.ID_CAP_AD     = '''+IntToStr(id_ad)+'''                     ');
          SQLQuery.SQL.Add('   AND A.TIP_PAGAMENTO = ''A''                                       ');
          SQLQuery.ExecSQL;
        end;

    finally
      FreeAndNil(SQLQuery);
      FreeAndNil(SQLQuery_Aux);
    end;
  end;

var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT COUNT(*) FROM CAP_AP_VALORES                     '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CAP_AP          = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_ap;
      SQLQuery.Open;
      if SQLQuery.Fields[0].AsInteger > 0 then
        begin
          ShowMessage('Para Realizar a Exclusâo do Documento é necessário remover o Pagamento Existente.');
          Financeiro.Alerta := True;
          Exit;
        end;

      if tipo_docum = 'N' then // Parcelas Normais
        excluir_ap(id_ap);

      if tipo_docum = 'P' then // Parcelas Parceladas
        excluir_ap(id_ap);

      if tipo_docum = 'R' then // Parcelas Recorrentes
        begin
          if tipo_exclusao = 0 then // Excluir Apenas esta Parcela, e não realizar nenhuma alteração nas demais.
            excluir_ap(id_ap);

          if tipo_exclusao = 1 then // Excluir Esta Parcela, e Todas as Próximas parcelas ainda não pagas.
            excluir_ap_geral(id_ad, id_ap, tipo_exclusao);

          if tipo_exclusao = 2 then // Excluir Todas as Parcelas que ainda não foram pagas.
            excluir_ap_geral(id_ad, id_ap, tipo_exclusao);
        end;

      excluir_ad(id_ad);

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

{:: CONTAS A RECEBER ::}

function inclui_cre_par(des_docum, docum, tipo_docum, periodo, parcelas, id_tip_receita, id_cliente :String; valor: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
  I                                                                             :Integer;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      Financeiro.dia_venc  := FormatDateTime('dd',vencimento);
      Financeiro.venc_aux  := vencimento;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('INSERT INTO CRE_DOC                                     '+
                       '           (ID_MASTER,                                  '+
                       '            ID_EMPRESA,                                 '+
                       '            DESCRICAO_DOCUM,                            '+
                       '            NUM_DOCUM,                                  '+
                       '            TIPO_DOCUM,                                 '+
                       '            TIPO_DOCUM_SITUACAO,                        '+
                       '            PERIODO,                                    '+
                       '            NUM_PARCELAS,                               '+
                       '            DAT_CADASTRO,                               '+
                       '            ID_USUARIO)                                 '+
                       '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05,         '+
                       '            :P06, :P07, SYSDATE(), :P08)                ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsString  := des_docum;
      SQLQuery.Params[03].AsString  := docum;
      SQLQuery.Params[04].AsString  := tipo_docum;
      SQLQuery.Params[05].AsString  := 'A';
      SQLQuery.Params[06].AsString  := periodo;
      SQLQuery.Params[07].AsString  := parcelas;
      SQLQuery.Params[08].AsInteger := ID.id_glo_usuario;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT MAX(ID_CRE_DOC) FROM CRE_DOC                     '+
                       ' WHERE ID_MASTER  = :P00                                '+
                       '   AND ID_EMPRESA = :P01                                '+
                       '   AND ID_USUARIO = :P02                                ');
      SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger  := ID.id_glo_usuario;
      SQLQuery.Open;

      Financeiro.id_documento  := SQLQuery.Fields[0].AsString;

      if tipo_docum = 'N' then //Normal
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CRE_PAR                                 '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CRE_DOC,                             '+
                           '            ID_TIPO_RECEITA,                        '+
                           '            ID_F_C,                                 '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_JUROS,                              '+
                           '            TIP_RECEBIMENTO,                        '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_RECEBIMENTO,                        '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05,     '+
                           '            :P06, :P07, :P08, NULL, SYSDATE(),      '+
                           '            :P09)                                   ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := Financeiro.id_documento;
          SQLQuery.Params[03].AsString  := id_tip_receita;
          SQLQuery.Params[04].AsString  := id_cliente;
          SQLQuery.Params[05].AsFloat   := valor;
          SQLQuery.Params[06].AsFloat   := 0;
          SQLQuery.Params[07].AsString  := 'A';
          SQLQuery.Params[08].AsDate    := vencimento;
          SQLQuery.Params[09].AsInteger := ID.id_glo_usuario;
          SQLQuery.ExecSQL;
        end;

      if tipo_docum = 'P' then //Parcelada
        begin
          {Inclui as Primeira Parcela}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CRE_PAR                                 '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CRE_DOC,                             '+
                           '            ID_TIPO_RECEITA,                        '+
                           '            ID_F_C,                                 '+
                           '            PARCELA,                                '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_JUROS,                              '+
                           '            TIP_RECEBIMENTO,                        '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_RECEBIMENTO,                        '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05,     '+
                           '            :P06, :P07, :P08, :P09, NULL, SYSDATE(),'+
                           '            :P10)                                   ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := Financeiro.id_documento;
          SQLQuery.Params[03].AsString  := id_tip_receita;
          SQLQuery.Params[04].AsString  := id_cliente;
          SQLQuery.Params[05].AsInteger := 1;
          SQLQuery.Params[06].AsFloat   := valor;
          SQLQuery.Params[07].AsFloat   := 0;
          SQLQuery.Params[08].AsString  := 'A';
          SQLQuery.Params[09].AsDate    := vencimento;
          SQLQuery.Params[10].AsInteger := ID.id_glo_usuario;
          SQLQuery.ExecSQL;

          {Verifica Qual é Periodo e o Nº de Parcelas Para Geração das Parcelas}
          for I := 2 to StrToInt(parcelas) do
            begin
              if periodo = 'Semanal' then
                Financeiro.venc_aux  := IncWeek(Financeiro.venc_aux,1);
              if periodo = 'Quinzenal' then
                Financeiro.venc_aux  := IncDay(Financeiro.venc_aux,15);
              if periodo = 'Mensal' then
                begin
                  Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,1);
                  if Financeiro.dia_venc <> FormatDateTime('dd',Financeiro.venc_aux) then
                    begin
                      if StrToInt(Financeiro.dia_venc) > DaysInMonth(Financeiro.venc_aux) then
                        Financeiro.venc_aux  :=  StrToDate(IntToStr(DaysInMonth(Financeiro.venc_aux))+Copy(DateToStr(Financeiro.venc_aux),3,8))
                      else
                        Financeiro.venc_aux  := StrToDate(Financeiro.dia_venc+Copy(DateToStr(Financeiro.venc_aux),3,8));
                    end;
                end;
              if periodo = 'Trimestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,3);
              if periodo = 'Semestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,6);
              if periodo = 'Anual' then
                Financeiro.venc_aux  := IncYear(Financeiro.venc_aux,1);

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('INSERT INTO CRE_PAR                                 '+
                               '           (ID_MASTER,                              '+
                               '            ID_EMPRESA,                             '+
                               '            ID_CRE_DOC,                             '+
                               '            ID_TIPO_RECEITA,                        '+
                               '            ID_F_C,                                 '+
                               '            PARCELA,                                '+
                               '            VAL_PARCELA,                            '+
                               '            VAL_JUROS,                              '+
                               '            TIP_RECEBIMENTO,                        '+
                               '            DAT_VENCIMENTO,                         '+
                               '            DAT_RECEBIMENTO,                        '+
                               '            DAT_CADASTRO,                           '+
                               '            ID_USUARIO)                             '+
                               '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05,     '+
                               '            :P06, :P07, :P08, :P09, NULL, SYSDATE(),'+
                               '            :P10)                                   ');
              SQLQuery.Params[00].AsInteger := ID.id_glo_master;
              SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
              SQLQuery.Params[02].AsString  := Financeiro.id_documento;
              SQLQuery.Params[03].AsString  := id_tip_receita;
              SQLQuery.Params[04].AsString  := id_cliente;
              SQLQuery.Params[05].AsInteger := I;
              SQLQuery.Params[06].AsFloat   := valor;
              SQLQuery.Params[07].AsFloat   := 0;
              SQLQuery.Params[08].AsString  := 'A';
              SQLQuery.Params[09].AsDate    := Financeiro.venc_aux;
              SQLQuery.Params[10].AsInteger := ID.id_glo_usuario;
              SQLQuery.ExecSQL;
            end;
        end;

      if tipo_docum = 'R' then //Recorrente
        begin
          {Inclui as Primeira Parcela}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('INSERT INTO CRE_PAR                                 '+
                           '           (ID_MASTER,                              '+
                           '            ID_EMPRESA,                             '+
                           '            ID_CRE_DOC,                             '+
                           '            ID_TIPO_RECEITA,                        '+
                           '            ID_F_C,                                 '+
                           '            VAL_PARCELA,                            '+
                           '            VAL_JUROS,                              '+
                           '            TIP_RECEBIMENTO,                        '+
                           '            DAT_VENCIMENTO,                         '+
                           '            DAT_RECEBIMENTO,                        '+
                           '            DAT_CADASTRO,                           '+
                           '            ID_USUARIO)                             '+
                           '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05,     '+
                           '            :P06, :P07, :P08, NULL, SYSDATE(),      '+
                           '            :P09)                                   ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsString  := Financeiro.id_documento;
          SQLQuery.Params[03].AsString  := id_tip_receita;
          SQLQuery.Params[04].AsString  := id_cliente;
          SQLQuery.Params[05].AsFloat   := valor;
          SQLQuery.Params[06].AsFloat   := 0;
          SQLQuery.Params[07].AsString  := 'A';
          SQLQuery.Params[08].AsDate    := vencimento;
          SQLQuery.Params[09].AsInteger := ID.id_glo_usuario;
          SQLQuery.ExecSQL;

          {Realiza a Inclusão das Parcelas Durante o Periodo de +- 1 Ano (Existe um JOB que ficará executando para geração das Novas Parcelas de Forma Automática)}
          if periodo = 'Semanal' then
            parcelas  := '52';
          if periodo = 'Quinzenal' then
            parcelas  := '24';
          if periodo = 'Mensal' then
            parcelas  := '12';
          if periodo = 'Trimestral' then
            parcelas  := '4';
          if periodo = 'Semestral' then
            parcelas  := '2';
          if periodo = 'Anual' then
            parcelas  := '1';

          for I := 2 to StrToInt(parcelas) do
            begin
              if periodo = 'Semanal' then
                Financeiro.venc_aux  := IncWeek(Financeiro.venc_aux,1);
              if periodo = 'Quinzenal' then
                Financeiro.venc_aux  := IncDay(Financeiro.venc_aux,15);
              if periodo = 'Mensal' then
                begin
                  Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,1);
                  if Financeiro.dia_venc <> FormatDateTime('dd',Financeiro.venc_aux) then
                    begin
                      if StrToInt(Financeiro.dia_venc) > DaysInMonth(Financeiro.venc_aux) then
                        Financeiro.venc_aux  :=  StrToDate(IntToStr(DaysInMonth(Financeiro.venc_aux))+Copy(DateToStr(Financeiro.venc_aux),3,8))
                      else
                        Financeiro.venc_aux  := StrToDate(Financeiro.dia_venc+Copy(DateToStr(Financeiro.venc_aux),3,8));
                    end;
                end;
              if periodo = 'Trimestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,3);
              if periodo = 'Semestral' then
                Financeiro.venc_aux  := IncMonth(Financeiro.venc_aux,6);
              if periodo = 'Anual' then
                Financeiro.venc_aux  := IncYear(Financeiro.venc_aux,1);

              SQLQuery.SQL.Clear;
              SQLQuery.SQL.Add('INSERT INTO CRE_PAR                             '+
                               '           (ID_MASTER,                          '+
                               '            ID_EMPRESA,                         '+
                               '            ID_CRE_DOC,                         '+
                               '            ID_TIPO_RECEITA,                    '+
                               '            ID_F_C,                             '+
                               '            VAL_PARCELA,                        '+
                               '            VAL_JUROS,                          '+
                               '            TIP_RECEBIMENTO,                    '+
                               '            DAT_VENCIMENTO,                     '+
                               '            DAT_RECEBIMENTO,                    '+
                               '            DAT_CADASTRO,                       '+
                               '            ID_USUARIO)                         '+
                               '     VALUES(:P00, :P01, :P02, :P03, :P04, :P05, '+
                               '            :P06, :P07, :P08, NULL, SYSDATE(),  '+
                               '            :P09)                               ');
              SQLQuery.Params[00].AsInteger := ID.id_glo_master;
              SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
              SQLQuery.Params[02].AsString  := Financeiro.id_documento;
              SQLQuery.Params[03].AsString  := id_tip_receita;
              SQLQuery.Params[04].AsString  := id_cliente;
              SQLQuery.Params[05].AsFloat   := valor;
              SQLQuery.Params[06].AsFloat   := 0;
              SQLQuery.Params[07].AsString  := 'A';
              SQLQuery.Params[08].AsDate    := Financeiro.venc_aux;
              SQLQuery.Params[09].AsInteger := ID.id_glo_usuario;
              SQLQuery.ExecSQL;
            end;

          {Atualiza o Ultimo Vencimento}
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('UPDATE CRE_DOC SET DAT_ULTIMO_VENCIMENTO = :P00     '+
                           ' WHERE ID_MASTER  = :P01                            '+
                           '   AND ID_EMPRESA = :P02                            '+
                           '   AND ID_CRE_DOC = :P03                            ');
          SQLQuery.Params[00].AsDate    := Financeiro.venc_aux;
          SQLQuery.Params[01].AsInteger := ID.id_glo_master;
          SQLQuery.Params[02].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[03].AsString  := Financeiro.id_documento;
          SQLQuery.ExecSQL;
        end;


      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT MAX(ID_CRE_PAR) FROM CRE_PAR                     '+
                       ' WHERE ID_MASTER  = :P00                                '+
                       '   AND ID_EMPRESA = :P01                                '+
                       '   AND ID_USUARIO = :P02                                ');
      SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger  := ID.id_glo_usuario;
      SQLQuery.Open;

      Financeiro.id_parcela   := SQLQuery.Fields[0].AsString;

      Financeiro.documento    := Financeiro.id_documento;
      Financeiro.parcela      := Financeiro.id_parcela;
      Financeiro.Erro         := False;
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

function altera_doc_par(id_cre_doc, id_cre_par :Integer; des_docum, docum, tipo_docum, periodo, parcelas, id_tip_receita, id_cliente :String; valor, valor_juros: Real; vencimento :Tdate; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('UPDATE CRE_DOC SET DESCRICAO_DOCUM  =:P00,              '+
                       '                   NUM_DOCUM        =:P01,              '+
                       '                   TIPO_DOCUM       =:P02,              '+
                       '                   PERIODO          =:P03,              '+
                       '                   NUM_PARCELAS     =:P04               '+
                       ' WHERE ID_MASTER                    =:P05               '+
                       '   AND ID_EMPRESA                   =:P06               '+
                       '   AND ID_CRE_DOC                   =:P07               ');
      SQLQuery.Params[00].AsString  := des_docum;
      SQLQuery.Params[01].AsString  := docum;
      SQLQuery.Params[02].AsString  := tipo_docum;
      SQLQuery.Params[03].AsString  := periodo;
      SQLQuery.Params[04].AsString  := parcelas;
      SQLQuery.Params[05].AsInteger := ID.id_glo_master;
      SQLQuery.Params[06].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[07].AsInteger := id_cre_doc;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('UPDATE CRE_PAR SET ID_TIPO_RECEITA  =:P00,              '+
                       '                   ID_F_C           =:P01,              '+
                       '                   VAL_PARCELA      =:P02,              '+
                       '                   VAL_JUROS        =:P03,              '+
                       '                   DAT_VENCIMENTO   =:P04               '+
                       ' WHERE ID_MASTER                    =:P05               '+
                       '   AND ID_EMPRESA                   =:P06               '+
                       '   AND ID_CRE_PAR                   =:P07               ');
      SQLQuery.Params[00].AsString  := id_tip_receita;
      SQLQuery.Params[01].AsString  := id_cliente;
      SQLQuery.Params[02].AsFloat   := valor;
      SQLQuery.Params[03].AsFloat   := valor_juros;
      SQLQuery.Params[04].AsDate    := vencimento;
      SQLQuery.Params[05].AsInteger := ID.id_glo_master;
      SQLQuery.Params[06].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[07].AsInteger := id_cre_par;
      SQLQuery.ExecSQL;

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

function baixa_par(id_cre_par, id_contas :Integer; valor, valor_juros: Real; recebimento :Tdate; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      if valor <= 0 then
        begin
          ShowMessage('Valor Informado não pode ser menor ou igual a R$ 0,00');
          Exit;
        end;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('    SELECT ( AVG(A.VAL_PARCELA) - IFNULL(SUM(B.VALOR),0) ) SALDO      '+
                       '      FROM CRE_PAR               A                                    '+
                       'LEFT OUTER JOIN CRE_PAR_VALORES  B  ON A.ID_MASTER    = B.ID_MASTER   '+
                       '                                   AND A.ID_EMPRESA   = B.ID_EMPRESA  '+
                       '                                   AND A.ID_CRE_PAR   = B.ID_CRE_PAR  '+
                       '    WHERE A.ID_MASTER     = :ID_MASTER                                '+
                       '      AND A.ID_EMPRESA    = :ID_EMPRESA                               '+
                       '      AND A.ID_CRE_PAR    = :ID_CRE_PAR                               ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par;
      SQLQuery.Open;
      Financeiro.saldo := SQLQuery.Fields[0].AsFloat;

      if valor > Financeiro.saldo then
        begin
          ShowMessage('Valor Informado '+FormatFloat('R$ ###,###,##0.00',valor)+
                      ' Ultrapassa o Valor de Saldo '+FormatFloat('R$ ###,###,##0.00',SQLQuery.Fields[0].AsFloat)+'. ');
          Financeiro.Alerta := True;
          Exit;
        end;

      SQLQuery.SQL.Clear;
      if valor < Financeiro.saldo then
      SQLQuery.SQL.Add('UPDATE CRE_PAR SET TIP_RECEBIMENTO = ''P'',             ');
      if valor = Financeiro.saldo then
      SQLQuery.SQL.Add('UPDATE CRE_PAR SET TIP_RECEBIMENTO = ''T'',             ');
      SQLQuery.SQL.Add('                  DAT_RECEBIMENTO = :P00,               ');
      SQLQuery.SQL.Add('                  VAL_JUROS     = :P01                  ');
      SQLQuery.SQL.Add(' WHERE ID_MASTER     = :P02                             ');
      SQLQuery.SQL.Add('   AND ID_EMPRESA    = :P03                             ');
      SQLQuery.SQL.Add('   AND ID_CRE_PAR    = :P04                             ');
      SQLQuery.Params[00].AsDate    := recebimento;
      SQLQuery.Params[01].AsFloat   := valor_juros;
      SQLQuery.Params[02].AsInteger := ID.id_glo_master;
      SQLQuery.Params[03].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[04].AsInteger := id_cre_par;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('INSERT INTO CRE_PAR_VALORES                             '+
                       '           (ID_MASTER,                                  '+
                       '            ID_EMPRESA,                                 '+
                       '            ID_CRE_PAR,                                 '+
                       '            ID_CONTAS,                                  '+
                       '            DAT_RECEBIMENTO,                            '+
                       '            VALOR)                                      '+
                       '    VALUES (:P00, :P01, :P02, :P03, :P04, :P05)         ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par;
      SQLQuery.Params[03].AsInteger := id_contas;
      SQLQuery.Params[04].AsDate    := recebimento;
      SQLQuery.Params[05].AsFloat   := valor;
      SQLQuery.ExecSQL;

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

function remove_baixa_par(id_cre_par_valores, id_cre_par :Integer; Conexao: TADConnection):TFinanceiro;
var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('DELETE FROM CRE_PAR_VALORES                             '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CRE_PAR_VALORES = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par_valores;
      SQLQuery.ExecSQL;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT COUNT(*) FROM CRE_PAR_VALORES                    '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CRE_PAR         = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par;
      SQLQuery.Open;
      Financeiro.resultado := SQLQuery.Fields[0].AsInteger;

      if Financeiro.resultado = 0 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('UPDATE CRE_PAR SET DAT_RECEBIMENTO = NULL,          '+
                           '                   TIP_RECEBIMENTO = ''A''          '+
                           ' WHERE ID_MASTER          = :P00                    '+
                           '   AND ID_EMPRESA         = :P01                    '+
                           '   AND ID_CRE_PAR         = :P02                    ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsInteger := id_cre_par;
          SQLQuery.ExecSQL;

          Financeiro.tipo  := 'A';
        end;
      if Financeiro.resultado > 0 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('UPDATE CRE_PAR SET TIP_RECEBIMENTO = ''P''          '+
                           ' WHERE ID_MASTER          = :P00                    '+
                           '   AND ID_EMPRESA         = :P01                    '+
                           '   AND ID_CRE_PAR         = :P02                    ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsInteger := id_cre_par;
          SQLQuery.ExecSQL;

          Financeiro.tipo  := 'P';
        end;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT SUM(VALOR) FROM CRE_PAR_VALORES                  '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CRE_PAR          = :P02                       ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par;
      SQLQuery.Open;

      Financeiro.saldo_parcela := SQLQuery.Fields[0].AsFloat;

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

function exclusao_par(id_cre_doc, id_cre_par, tipo_exclusao :Integer; tipo_docum: String; Conexao: TADConnection):TFinanceiro;

  procedure excluir_par(id_cre_par:Integer);
  var
    SQLQuery :TADQuery;
  begin
    try
      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('DELETE FROM CRE_PAR                                     '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CRE_PAR         = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par;
      SQLQuery.ExecSQL;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;

  procedure excluir_doc(id_cre_doc:Integer);
  var
    SQLQuery :TADQuery;
  begin
    try
      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('DELETE A FROM CRE_DOC A                                     '+
                       ' WHERE A.ID_MASTER          = :P00                          '+
                       '   AND A.ID_EMPRESA         = :P01                          '+
                       '   AND A.ID_CRE_DOC         = :P02                          '+
                       '   AND NOT EXISTS (SELECT ''X'' FROM CRE_PAR B              '+
                       '                    WHERE A.ID_MASTER       = B.ID_MASTER   '+
                       '                      AND A.ID_EMPRESA      = B.ID_EMPRESA  '+
                       '                      AND A.ID_CRE_DOC      = B.ID_CRE_DOC) ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_doc;
      SQLQuery.ExecSQL;
    finally
      FreeAndNil(SQLQuery);
    end;
  end;

  procedure excluir_par_geral(id_cre_doc, id_cre_par, tipo_exclusao :Integer);
  var
    SQLQuery, SQLQuery_Aux :TADQuery;
  begin
    try
      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery_Aux  := TADQuery.Create(Nil);
      SQLQuery_Aux.Connection  := Conexao;

      if tipo_exclusao = 1 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('SELECT A.ID_CRE_PAR FROM CRE_PAR A                         ');
          SQLQuery.SQL.Add(' WHERE A.ID_MASTER       = :P00                            ');
          SQLQuery.SQL.Add('   AND A.ID_EMPRESA      = :P01                            ');
          SQLQuery.SQL.Add('   AND A.ID_CRE_DOC      = :P02                            ');
          SQLQuery.SQL.Add('   AND A.TIP_RECEBIMENTO = ''A''                           ');
          SQLQuery.SQL.Add('   AND EXISTS (SELECT ''X'' FROM CRE_PAR B                 ');
          SQLQuery.SQL.Add('              WHERE A.ID_MASTER       =  B.ID_MASTER       ');
          SQLQuery.SQL.Add('                AND A.ID_EMPRESA      =  B.ID_EMPRESA      ');
          SQLQuery.SQL.Add('                AND A.ID_CRE_DOC      =  B.ID_CRE_DOC      ');
          SQLQuery.SQL.Add('                AND A.TIP_RECEBIMENTO =  B.TIP_RECEBIMENTO ');
          SQLQuery.SQL.Add('                AND A.DAT_VENCIMENTO  >= B.DAT_VENCIMENTO  ');
          SQLQuery.SQL.Add('                AND B.ID_CRE_PAR      = :P03)              ');
          SQLQuery.Params[00].AsInteger := ID.id_glo_master;
          SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
          SQLQuery.Params[02].AsInteger := id_cre_doc;
          SQLQuery.Params[03].AsInteger := id_cre_par;
          SQLQuery.Open;
          SQLQuery.First;
          while Not(SQLQuery.Eof) do
            begin
              SQLQuery_Aux.SQL.Clear;
              SQLQuery_Aux.SQL.Add('DELETE A FROM CRE_PAR    A                  ');
              SQLQuery_Aux.SQL.Add(' WHERE A.ID_MASTER       = :P00             ');
              SQLQuery_Aux.SQL.Add('   AND A.ID_EMPRESA      = :P01             ');
              SQLQuery_Aux.SQL.Add('   AND A.ID_CRE_PAR      = :P02             ');
              SQLQuery_Aux.SQL.Add('   AND A.TIP_RECEBIMENTO = ''A''            ');
              SQLQuery_Aux.Params[00].AsInteger := ID.id_glo_master;
              SQLQuery_Aux.Params[01].AsInteger := ID.id_glo_empresa;
              SQLQuery_Aux.Params[02].AsInteger := SQLQuery.FieldByName('ID_CRE_PAR').AsInteger;
              SQLQuery_Aux.ExecSQL;

              SQLQuery.Next;
            end;
        end;

      if tipo_exclusao = 2 then
        begin
          SQLQuery.SQL.Clear;
          SQLQuery.SQL.Add('DELETE A FROM CRE_PAR A                                              ');
          SQLQuery.SQL.Add(' WHERE A.ID_MASTER     = '''+IntToStr(ID.id_glo_master)+'''          ');
          SQLQuery.SQL.Add('   AND A.ID_EMPRESA    = '''+IntToStr(ID.id_glo_empresa)+'''         ');
          SQLQuery.SQL.Add('   AND A.ID_CRE_DOC    = '''+IntToStr(id_cre_doc)+'''                ');
          SQLQuery.SQL.Add('   AND A.TIP_RECEBIMENTO = ''A''                                     ');
          SQLQuery.ExecSQL;
        end;

    finally
      FreeAndNil(SQLQuery);
      FreeAndNil(SQLQuery_Aux);
    end;
  end;

var
  SQLQuery                                                                      :TADQuery;
  Financeiro                                                                    :TFinanceiro;
begin
  try
    try
      Financeiro.Erro      := False;
      Financeiro.Alerta    := False;

      SQLQuery  := TADQuery.Create(Nil);
      SQLQuery.Connection  := Conexao;

      SQLQuery.SQL.Clear;
      SQLQuery.SQL.Add('SELECT COUNT(*) FROM CRE_PAR_VALORES                    '+
                       ' WHERE ID_MASTER          = :P00                        '+
                       '   AND ID_EMPRESA         = :P01                        '+
                       '   AND ID_CRE_PAR         = :P02                        ');
      SQLQuery.Params[00].AsInteger := ID.id_glo_master;
      SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
      SQLQuery.Params[02].AsInteger := id_cre_par;
      SQLQuery.Open;
      if SQLQuery.Fields[0].AsInteger > 0 then
        begin
          ShowMessage('Para Realizar a Exclusâo do Documento é necessário remover o Pagamento Existente.');
          Financeiro.Alerta := True;
          Exit;
        end;

      if tipo_docum = 'N' then // Parcelas Normais
        excluir_par(id_cre_par);

      if tipo_docum = 'P' then // Parcelas Parceladas
        excluir_par(id_cre_par);

      if tipo_docum = 'R' then // Parcelas Recorrentes
        begin
          if tipo_exclusao = 0 then // Excluir Apenas esta Parcela, e não realizar nenhuma alteração nas demais.
            excluir_par(id_cre_par);

          if tipo_exclusao = 1 then // Excluir Esta Parcela, e Todas as Próximas parcelas ainda não pagas.
            excluir_par_geral(id_cre_doc, id_cre_par, tipo_exclusao);

          if tipo_exclusao = 2 then // Excluir Todas as Parcelas que ainda não foram pagas.
            excluir_par_geral(id_cre_doc, id_cre_par, tipo_exclusao);
        end;

      excluir_doc(id_cre_doc);

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
