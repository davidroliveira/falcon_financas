unit U_Seta_Conexao;

interface

uses
  uniGUIFrame, Uni;

procedure seta_conexao(Frame:TuniFrame; Conexao: TUniConnection; FetchAll: Boolean);

implementation

procedure seta_conexao(Frame:TuniFrame; Conexao: TUniConnection; FetchAll: Boolean);
var
  I: Integer;
begin
  with Frame do
    begin
      for I := 0 to ComponentCount - 1 do
        begin
          if (Components[I] is TUniQuery) then
            begin
              TUniQuery(Components[I]).Connection:= Conexao;
              TUniQuery(Components[I]).SpecificOptions.Values['FetchAll'] := FetchAll;
            end;
          if (Components[I] is TUniStoredProc) then
            TUniStoredProc(Components[I]).Connection:= Conexao;
          if (Components[I] is TUniTransaction) then
            TUniTransaction(Components[I]).DefaultConnection := Conexao;
        end;
    end;
end;

end.
