{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Funcao_Versao;

interface

function getversaoarq: string;

implementation

uses
  Types{dword}, Windows{pvsfixedfileinfo}, SysUtils{inttostr};

{* Função para verificar a versão do Programa}
function getversaoarq: string;
var
  verinfosize: dword;
  verinfo: pointer;
  vervaluesize: dword;
  vervalue: pvsfixedfileinfo;
  dummy: dword;
begin
  verinfosize := getfileversioninfosize(pchar(
  paramstr(0)), dummy);
  getmem(verinfo, verinfosize);
  getfileversioninfo(pchar(paramstr(0)), 0,
  verinfosize, verinfo);
  verqueryvalue(verinfo, '\', pointer(vervalue),
  vervaluesize);
  with vervalue^ do
    begin
      result := inttostr(dwfileversionms shr 16);
      result := result + '.' + inttostr(dwfileversionms and $ffff);
      result := result + '.' + inttostr(dwfileversionls shr 16);
      result := result + '.' + inttostr(dwfileversionls and $ffff);
    end;
  freemem(verinfo, verinfosize);
end;

end.
