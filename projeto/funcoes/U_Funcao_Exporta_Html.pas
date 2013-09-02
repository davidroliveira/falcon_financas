unit U_Funcao_Exporta_Html;

interface

uses
  uniGUIApplication, UniGuiDialogs, Data.DB, System.SysUtils;

procedure ExportaHtml(DS:TDataSource; nome_relatorio :String);

implementation

uses ServerModule;

procedure ExportaHtml(DS:TDataSource; nome_relatorio :String);
var
  i, j, w: integer;
  linha, dir_export, dir_relatorio, dir_destino, relatorio: string;
  htmlfile: textfile;
const
  wrap=#13+#10; {estamos declarando esta constante com o valor da tecla enter ...}
begin
  try
    dir_export      := ID_ALL.LocalCachePath;
    relatorio       := nome_relatorio+'.xls';
    dir_relatorio   := dir_export+relatorio;

    DS.DataSet.DisableControls;

    AssignFile(htmlfile, dir_relatorio);{salva o arquivo no diretorio selecionado}
    Rewrite(htmlfile);
    Writeln(htmlfile, '<html><head>' + wrap + {estamos gerando o inicio do arquivo html}
      '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">' + wrap + {Definindo Charset}
      '<title>'+ DS.DataSet.Name + '</title>' + wrap +
      '</head>' + wrap + '<body bgcolor="#FFFFFF">' +
      wrap + '<table border =1>' + wrap); {nesse ponto iremos gerar a tabela html}

    {Crias os titulos das colunas}
    with DS.DataSet do
    begin
      for w:=0 to FieldCount - 1 do
        if Fields[w].Visible then
          Writeln(htmlfile, '<td bgcolor ="#ADD8E6"><b> ' + (fields[w].DisplayLabel) + '</b></td>');

      {Cria toda a estrutura do HTML que esta sendo gerado}
      DS.DataSet.First;
      for i:=0 to RecordCount -1 do
      begin
        linha:='<tr>'+wrap;
        for j:=0 to FieldCount -1 do
          if Fields[j].Visible then
            linha:= linha + '<td>' + fields[j].asstring + '</td>';

        Writeln(htmlfile, linha);
        Writeln(htmlfile, '</tr>');
        Next;
      end;
    end;

    writeln(htmlfile, '</body></html>'); {finaliza o arquivo html}
    closefile(htmlfile);

    DS.DataSet.EnableControls;

    dir_destino        := ID_ALL.LocalCachePath;

    UniSession.SendFile(dir_destino+relatorio);
  except
    on e: Exception do
    ShowMessage('Erro na exportação dos dados!'+
                'verifique se o arquivo já está aberto'+#13+'Mensagem Original:'+ e.Message);
  end;

end;

end.
