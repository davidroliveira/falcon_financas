{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}
unit U_Carrega_Combo;

interface

uses
  uniGUIForm, ComboboxYeni,  uADCompClient;

var
  SQLQuery: TADQuery;

function combo(Form: TUniForm; combo: TComboboxYeni; pesquisa: string; Conexao:TADConnection):string;

implementation

uses U_DM, SysUtils, MainModule;

function combo(Form: TUniForm; combo: TComboboxYeni; pesquisa: string; Conexao :TADConnection):string;
begin
  try
    SQLQuery := TADQuery.Create(Nil);
    SQLQuery.Connection := Conexao;

    with Form do
      begin
        if pesquisa = 'TIPO_RECEITA' then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_TIPO_RECEITA, DESCRICAO_RECEITA FROM TIPO_RECEITAS  '+
                             ' WHERE ID_MASTER  = :P00                                      '+
                             '   AND ID_EMPRESA = :P01                                      '+
                             '   AND ATIVO      = ''S''                                     '+
                             ' ORDER BY 2                                                   ');
            SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
            SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;

          end;

        if pesquisa = 'TIPO_DESPESA' then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_TIPO_DESPESA, DESCRICAO_DESPESA FROM TIPO_DESPESAS  '+
                             ' WHERE ID_MASTER  = :P00                                      '+
                             '   AND ID_EMPRESA = :P01                                      '+
                             '   AND ATIVO      = ''S''                                     '+
                             ' ORDER BY 2                                                   ');
            SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
            SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
          end;

        if pesquisa = 'CONTAS' then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_CONTAS, NOME_CONTA CONTA FROM CONTAS                '+
                             ' WHERE ID_MASTER  = :P00                                      '+
                             '   AND ID_EMPRESA = :P01                                      '+
                             '   AND ATIVO = ''S''                                          '+
                             ' ORDER BY 2                                                   ');
            SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
            SQLQuery.Params[01].AsInteger  := ID.id_glo_empresa;
          end;

        if pesquisa = 'FORNECEDOR' then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_F_C, NOME FROM FORNECEDOR_CLIENTE                   '+
                             ' WHERE ID_MASTER  = :P00                                      '+
                             '   AND FORNECEDOR = ''S''                                     '+
                             '   AND ATIVO      = ''S''                                     '+
                             ' ORDER BY 2                                                   ');
            SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
          end;

        if pesquisa = 'CLIENTE' then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_F_C, NOME FROM FORNECEDOR_CLIENTE                   '+
                             ' WHERE ID_MASTER  = :P00                                      '+
                             '   AND CLIENTE    = ''S''                                     '+
                             '   AND ATIVO      = ''S''                                     '+
                             ' ORDER BY 2                                                   ');
            SQLQuery.Params[00].AsInteger  := ID.id_glo_master;
          end;

        if pesquisa = 'BANCOS' then
          begin
            SQLQuery.SQL.Clear;
            SQLQuery.SQL.Add('SELECT ID_BANCOS,                                             '+
                             '       NOME_BANCO                                             '+
                             '  FROM BANCOS                                                 '+
                             ' WHERE ATIVO = ''S''                                          '+
                             ' ORDER BY 2                                                   ');
          end;

        SQLQuery.Open;
        combo.Clear;
        while not(SQLQuery.Eof) do
          begin
            combo.ValueList.Add(SQLQuery.Fields[0].AsString);
            combo.Items.Add(SQLQuery.Fields[1].AsString);
            SQLQuery.Next;
          end;
      end;
  finally
    FreeAndNil(SQLQuery);
  end;
end;

end.
