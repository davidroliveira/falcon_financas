unit U_Cookies;

interface

uses
  SysUtils, DateUtils, uniGUIApplication, Classes, uniComboBox, uniGUIFrame;

function gravar_cookie(titulo,valor: String; dias_expira: Integer):String;
function ler_cookie(titulo: String): String;
function ler_cookie_combo(titulo: String; Frame: TUniFrame; combo: TUniComboBox):String;

implementation

function gravar_cookie(titulo,valor: String; dias_expira: Integer):String;
var
  data :TdateTime;
begin
  data  := IncDay(Now,dias_expira);

  if UniApplication.Cookies.Values[titulo] <> valor then
    UniApplication.Cookies.SetCookie(titulo, valor, data);
end;

function ler_cookie(titulo: String):String;
begin
  Result  := UniApplication.Cookies.Values[titulo];
end;

function ler_cookie_combo(titulo: String; Frame: TUniFrame; combo: TUniComboBox):String;
var
  I : Integer;
begin
  combo.Items.Clear;

  if UniApplication.Cookies.Count > 0 then
    begin
      for I := 0 to UniApplication.Cookies.Count - 1 do
        begin
          with Frame  do
            combo.Items.Add(UniApplication.Cookies.Values[titulo])
        end;
    end;
end;


end.
