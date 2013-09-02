{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}
unit U_Imagens;

interface

uses
  uniGUIForm, DB, SysUtils, uniImage;

function carrega_dir_img(Form: TUniForm; FieldBlod: TBlobField; Nome, Retorno:String ):String;   {Carrega o Caminho da Imagem Salva (Local ou Web)}
procedure carrega_img(Form: TUniForm; FieldBlod: TBlobField; image: TUniImage; tipo: String);

implementation

uses ServerModule;

function carrega_dir_img(Form: TUniForm; FieldBlod: TBlobField; Nome, Retorno:String ):String;
var
  local_path, nome_img, url_web, url_local: string;
begin
  if Nome <> EmptyStr then
    begin
      local_path  := ID_ALL.LocalCachePath;
      nome_img    := Form.Name+'_'+Nome+'.png';

      url_web     := ID_ALL.LocalCacheURL+nome_img;
      url_local   := ID_ALL.LocalCachePath+nome_img;

      if Not(FileExists(local_path+nome_img)) then
        FieldBlod.SaveToFile(local_path+nome_img);

      if Retorno = 'url_web' then
        Result  := url_web;
      if Retorno = 'url_local' then
        Result  := url_local;
    end
  else
    Result  := EmptyStr;
end;

procedure carrega_img(Form: TUniForm; FieldBlod: TBlobField; image: TUniImage; tipo: String);
begin

end;

end.
