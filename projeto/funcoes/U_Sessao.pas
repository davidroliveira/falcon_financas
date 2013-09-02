{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Sessao;

interface

uses
  uniGUIFrame, uADCompClient;

procedure SessaoFireDac(Frame:TUniFrame; Conexao:TADConnection; charset:String);
procedure Seta_Conexao_FireDac(Frame:TuniFrame; Conexao: TADConnection);

implementation

procedure SessaoFireDac(Frame:TUniFrame; Conexao:TADConnection; charset:String);
begin
  with Frame do
    begin
      with Conexao do
        begin
          //ConnectionName                := 'Falcon Financas';
          DriverName                    := 'MYSQL';
          LoginPrompt                   := False;
          Params.Values['Database']     := 'falcon';
          Params.Values['User_Name']    := 'falcon';
          Params.Values['Password']     := 'v8n1g2a1';
          Params.Values['Server']       := 'localhost';
          Params.Values['CharacterSet'] := charset;
          Params.Values['DriverID']     := 'MySQL';
        end;
    end;
end;

procedure Seta_Conexao_FireDac(Frame:TuniFrame; Conexao: TADConnection);
var
  I: Integer;
begin
  with Frame do
    begin
      for I := 0 to ComponentCount - 1 do
        begin
          if (Components[I] is TADQuery) then
            begin
              TadQuery(Components[I]).Connection:= Conexao;
              //TUniQuery(Components[I]).SpecificOptions.Values['FetchAll'] := FetchAll;
            end;
          if (Components[I] is TADStoredProc) then
            TADStoredProc(Components[I]).Connection:= Conexao;
          if (Components[I] is TADTransaction) then
            TADTransaction(Components[I]).Connection := Conexao;
        end;
    end;
end;

end.
