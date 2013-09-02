{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Verifica_Campo_Null;

interface

uses
  DB, SysUtils, uniEdit, uniDBEdit, uniComboBox, ComboBoxYeni,
  uniGUIForm, Graphics, uniMemo, uniDBMemo, uniGUIDialogs, Vcl.StdCtrls;

function Verifica(DS: TDataSource): Boolean;
function Verifica_Edit(Form: TUniForm): Boolean;

implementation

function Verifica(DS: TDataSource): Boolean;
var
  I: Integer;
begin
  Result:= True;
  for I := 0 to DS.DataSet.FieldCount - 1 do
    begin
      //ShowMessage(DS.DataSet.Fields[i].Name+DS.DataSet.Fields[i].AsString);
      if DS.DataSet.Fields[i].Required then
        begin
          if DS.DataSet.Fields[i].AsString = EmptyStr then
            begin
              ShowMessage('*Campo Obrigatório não Preenchido: '+DS.DataSet.Fields[i].DisplayName+' ');
              Result:= False;
              DS.DataSet.Fields[i].FocusControl;
              Break;
            end;
        end;
    end;
end;

function Verifica_Edit(Form: TUniForm): Boolean;
var
  I: Integer;
begin
  Result:= True;

  With Form do
    begin

      for I := 0 to ComponentCount -1 do
        if (Components[I] is TUniEdit)      or (Components[I] is TUniDBEdit)    or
           (Components[I] is TUniComboBox)  or (Components[I] is TComboBoxYeni) or
           (Components[I] is TUniNumberEdit)or (Components[I] is TUniMemo)      or
           (Components[I] is TUniDBMemo)    or (Components[I] is TUniDBEdit)    or
           (Components[I] is TCustomComboBox) then
          begin
            if Components[I].Tag = 1 then //1 = Não Aceita Campo Nulos
              begin
                if Components[I] is TUniEdit then
                  TUniEdit(Components[I]).Color           := clWhite;
                if Components[I] is TUniDBEdit then
                  TUniDBEdit(Components[I]).Color         := clWhite;
                if Components[I] is TUniComboBox then
                  TUniComboBox(Components[I]).Color       := clWhite;
                if Components[I] is TComboBoxYeni then
                  TComboBoxYeni(Components[I]).Color      := clWhite;
                if Components[I] is TUniNumberEdit then
                  TUniNumberEdit(Components[I]).Color     := clWhite;
                if Components[I] is TUniMemo then
                  TUniMemo(Components[I]).Color           := clWhite;
                if Components[I] is TUniDBMemo then
                  TUniDBMemo(Components[I]).Color         := clWhite;
                if Components[I] is TUniDBEdit then
                  TUniDBEdit(Components[I]).Color         := clWhite;

                if (TUniEdit(Components[I]).Text = EmptyStr) or (TUniDBEdit(Components[I]).Text = EmptyStr) or
                   (TUniComboBox(Components[I]).Text = EmptyStr) or (TComboBoxYeni(Components[I]).Text = EmptyStr) or
                   (TUniNumberEdit(Components[I]).Text = EmptyStr) or (TUniMemo(Components[I]).Text = EmptyStr) or
                   (TUniDBMemo(Components[I]).Text = EmptyStr) or (TUniDBEdit(Components[I]).Text = EmptyStr) then
                  begin
                    uniGUIDialogs.ShowMessage('Campo Obrigatório não Preenchido!');

                    if Components[I] is TUniEdit then
                      TUniEdit(Components[I]).Color           := clYellow;
                    if Components[I] is TUniDBEdit then
                      TUniDBEdit(Components[I]).Color         := clYellow;
                    if Components[I] is TUniComboBox then
                      TUniComboBox(Components[I]).Color       := clYellow;
                    if Components[I] is TComboBoxYeni then
                      TComboBoxYeni(Components[I]).Color      := clYellow;
                    if Components[I] is TUniNumberEdit then
                      TUniNumberEdit(Components[I]).Color     := clYellow;
                    if Components[I] is TUniNumberEdit then
                      TUniMemo(Components[I]).Color           := clYellow;
                    if Components[I] is TUniNumberEdit then
                      TUniDBMemo(Components[I]).Color         := clYellow;
                    if Components[I] is TUniDBEdit then
                      TUniDBEdit(Components[I]).Color         := clYellow;

                    Result:= False;
                    Break;
                  end;
              end;
          end;


    end;
end;

end.
