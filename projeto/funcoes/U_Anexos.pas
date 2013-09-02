unit U_Anexos;

interface

uses
  SysUtils, DB, MainModule, uADCompClient;

//function insere_anexo(tabela, col_nome: String; id: Integer; DS: TDataSource; Conexao: TSQLConnection): String;
function baixa_anexo(tabela, col_nome, col_anexo, col_id_anexo, nome_anexo: String; id: Integer; Conexao: TADConnection): String;

implementation

uses ServerModule, uniGUIApplication, U_Global;

//function insere_anexo(tabela, col_nome: String; id: Integer; DS: TDataSource; Conexao: TSQLConnection): String;
//var
//  SQLQuery: TSQLQuery;
//begin
//  try
//    SQLQuery  := TSQLQuery.Create(Nil);
//    SQLQuery.SQLConnection  := Conexao;
//
//    TDataSet(DS).First;
//    while Not(TDataSet(DS).Eof) do
//      begin
//        if TDataSet(DS).FieldByName('TEMP_DIR_ANEXO').AsString <> EmptyStr then
//          begin
//            SQLQuery.SQL.Clear;
//            SQLQuery.SQL.Add('INSERT INTO CAP_AD_ANEXO                    '+
//                             '           (ID_MASTER,                      '+
//                             '            ID_EMPRESA,                     '+
//                             '            ID_CAP_AD,                      '+
//                             '            NOME_ANEXO,                     '+
//                             '            ANEXO)                          '+
//                             '    VALUES (:P00, :P01, :P02, :P03, :P04)   ');
//            SQLQuery.Params[00].AsInteger := ID.id_glo_master;
//            SQLQuery.Params[01].AsInteger := ID.id_glo_empresa;
//            SQLQuery.Params[02].AsInteger := id;
//            SQLQuery.Params[03].AsString  := TDataSet(DS).FieldByName('NOME_ANEXO').AsString;
//            SQLQuery.Params[04].LoadFromFile(TDataSet(DS).FieldByName('ANEXO').AsString, ftBlob);
//            SQLQuery.ExecSQL;
//          end;
//
//          TDataSet(DS).Next;
//      end;
//  finally
//    FreeAndNil(SQLQuery);
//  end;
//end;

function baixa_anexo(tabela, col_nome, col_anexo, col_id_anexo, nome_anexo: String; id: Integer; Conexao: TADConnection): String;
var
  dir_destino, nome_arquivo :String;
  SQLQuery: TADQuery;
begin
  try
    dir_destino        := ID_ALL.LocalCachePath;

    SQLQuery  := TADQuery.Create(Nil);
    SQLQuery.Connection  := Conexao;

    if id > 0 then
      begin
        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT '+col_nome+', '+col_anexo+' FROM '+tabela+'    '+
                         ' WHERE '+col_id_anexo+' = '+IntToStr(id)+'            ');
        SQLQuery.Open;

        nome_arquivo  := SQLQuery.FieldByName(col_nome).AsString;

        if Not(FileExists(dir_destino+nome_arquivo)) then
          begin
            TBlobField(SQLQuery.FieldByName(col_anexo)).SaveToFile(dir_destino+nome_arquivo);
          end;
      end
    else
      nome_arquivo  := nome_anexo;

    {Verificando se a extensão é do Tipo DOCX ou XLSX e alterando}
    nome_anexo  := StringReplace(nome_anexo,'.xlsx','.xls',[rfIgnoreCase]);
    nome_anexo  := StringReplace(nome_anexo,'.docx','.doc',[rfIgnoreCase]);

    UniSession.SendFile(dir_destino+nome_arquivo,nome_anexo);
  finally
    FreeAndNil(SQLQuery);
  end;
end;

end.

