{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}
{Função utilizada para carregar as Imagens de Todos os meses e o mes selecionado
enviando de retorno o Mes e Ano selecionado}
unit U_Filtro_Calendario;

interface

uses
  uniGUIFrame, uniPanel, uniBitBtn, uniLabel;

type
  TFiltro = record
  private
    { Private declarations }


  public
    { Public declarations }
    mes, ano  :Integer;
  end;

function controles(Form: TuniFrame; Panel :TuniPanel; BitBtn :TUniBitBtn; Label_:TuniLabel):TFiltro;
function controles_remove_filtro(Form: TuniFrame; Panel :TuniPanel):TFiltro;

implementation

uses
  SysUtils;

function controles(Form: TuniFrame; Panel :TuniPanel; BitBtn :TUniBitBtn; Label_:TuniLabel):TFiltro;
var
  I : Integer;
  Filtro  :TFiltro;
begin
  try
    with Form do
      begin
        {Removendo Todos os Controles e deixanodo padrão}
        for I := 0 to Form.ComponentCount -1 do
          begin
             if Form.Components[I] is TUniBitBtn then
              if TUniBitBtn(Form.Components[I]).Parent = Panel then
                begin
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'jan' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/janeiro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'fev' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/fevereiro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'mar' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/marco.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'abr' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/abril.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'mai' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/maio.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'jun' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/junho.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'jul' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/julho.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'ago' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/agosto.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'set' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/setembro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'out' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/outubro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'nov' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/novembro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'dez' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/dezembro.png" />';
                end;
          end;

        {Aplicando as Regras}
        for I := 0 to Form.ComponentCount -1 do
          begin
             if Form.Components[I] is TUniBitBtn then
              if TUniBitBtn(Form.Components[I]).Parent = Panel then
                begin
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'jan') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/janeiro_selecionado.png" />';
                      Filtro.mes  := 01;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'fev') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/fevereiro_selecionado.png" />';
                      Filtro.mes  := 02;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'mar') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/marco_selecionado.png" />';
                      Filtro.mes  := 03;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'abr') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/abril_selecionado.png" />';
                      Filtro.mes  := 04;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'mai') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/maio_selecionado.png" />';
                      Filtro.mes  := 05;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'jun') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/junho_selecionado.png" />';
                      Filtro.mes  := 06;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'jul') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/julho_selecionado.png" />';
                      Filtro.mes  := 07;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'ago') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/agosto_selecionado.png" />';
                      Filtro.mes  := 08;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'set') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/setembro_selecionado.png" />';
                      Filtro.mes  := 09;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'out') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/outubro_selecionado.png" />';
                      Filtro.mes  := 10;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'nov') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/novembro_selecionado.png" />';
                      Filtro.mes  := 11;
                      Break;
                    end;
                  if (Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = Copy(BitBtn.Name,4,3)) and (Copy(BitBtn.Name,4,3) = 'dez') then
                    begin
                      TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/dezembro_selecionado.png" />';
                      Filtro.mes  := 12;
                      Break;
                    end;
                end;
          end;

        Filtro.ano  := StrToInt(Label_.Caption);

      end;
  finally
    Result  := Filtro;
  end;
end;

function controles_remove_filtro(Form: TuniFrame; Panel :TuniPanel):TFiltro;
var
  I : Integer;
  Filtro  :TFiltro;
begin
  try
    with Form do
      begin
        {Removendo Todos os Controles e deixanodo padrão}
        for I := 0 to Form.ComponentCount -1 do
          begin
             if Form.Components[I] is TUniBitBtn then
              if TUniBitBtn(Form.Components[I]).Parent = Panel then
                begin
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'jan' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/janeiro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'fev' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/fevereiro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'mar' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/marco.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'abr' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/abril.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'mai' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/maio.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'jun' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/junho.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'jul' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/julho.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'ago' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/agosto.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'set' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/setembro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'out' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/outubro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'nov' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/novembro.png" />';
                  if Copy(TUniBitBtn(Form.Components[I]).Name,4,3) = 'dez' then
                    TUniBitBtn(Form.Components[I]).Caption  := '<img width="32" height="32" src="../imagens/32/dezembro.png" />';
                end;
          end;
      end;
  finally
    Result  := Filtro;
  end;
end;



end.
