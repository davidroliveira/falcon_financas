{*******************************************************}
{                    Falcon Sistemas                    }
{*******************************************************}
{                                                       }
{    Autor: Marlon Nardi -> (marlonnardi@hotmail.com)   }
{                                                       }
{*******************************************************}
{                 www.falconsistemas.com                }
{*******************************************************}

unit U_Global;

interface

uses
  StrUtils, SysUtils, uniImage, uniGUIForm, Graphics,clipbrd, uniEdit, StdCtrls,
  uniGUIDialogs, uniDBEdit, uADCompClient;

{01}function ValidaEmail(const Email: String) : Boolean;                            {Valida se o Texto informado é um  e-mail válido}
{02}function GeraImagem(Form: TUniForm; Img: TUniImage): String;                    {Gera um Captcha}
{03}function GeraSenha:String;                                                      {Gera uma Senha Aleatória}
{04}function SaveClipboard(texto: String ): String;                                 {Salva o Texto informado em Memória}
{05}function gen_id(tabela: string; Conexao: TADConnection): Integer;              {Funçao para pegar o ID da tabela que foi passado como parametro}
{06}function RelatorioErro(form, objeto, unit_, classe_unit_, erro:String): String; {Abre o Formulário para envio de erros e Grava Auditoria do erro}
{07}function data_atual_bd: TDateTime;                                              {Retorna a Data e Hora do Banco de Dados}
{08}function Valida_CPF(numCPF: String): Boolean;                                   {Valida se o CPF é valido.}
{09}function Valida_CNPJ(numCNPJ: String): Boolean;                                 {Valida se o CNPJ é valido.}
{10}function Valida_Cartao(const parStr:String): Boolean;                           {Valida se o Cartão de Crédito/Débito é valido.}
{11}function FormataValor(edit:TuniEdit):String;                                    {Formata o Valor passado como parametro}
{11}function SomenteNumero(edit:TuniEdit):String;                                   {Formata o campo para ter apenas números}
{12}function FormataCPF_CNPJ(edit:TuniEdit): String;                                {Formata o campo de acordo, para CPF ou CNPJ}
{13}function FormataCEP(edit:TuniEdit): String;                                     {Formata o campo de acordo, para CEP}
{14}function FormataTelefone(edit:TuniEdit): String;                                {Formata o campo de acordo, para Telefone}
{15}function RemoveAspas(Form: TUniForm): String;                                   {Remove as Aspas dos Campos "TEXTOS"}


implementation

uses U_DM, U_Mensagem, MainModule;

{01}function ValidaEmail(const Email: string) : Boolean;
const
  InvalidChar = 'àâêôûãõáéíóúçüñýÀÂÊÔÛÃÕÁÉÍÓÚÇÜÑÝ*;:⁄\|#$%&*§!()][{}<>˜ˆ´ªº+¹²³';
var
  I: Integer;
  C: Integer;
begin
  // Não existe email com menos de 8 caracteres.
  if Length(Email) < 8 then
  begin
    Result := False;
    Exit;
  end;

  // Verificando se há somente um @
  if ((Pos( '@', Email) = 0) or
  (PosEx( '@', Email, Pos('@', Email) + 1) > 0)) then
  begin
    Result := False;
    Exit;
  end;

  // Verificando se no minimo há um ponto
  if (Pos('.', Email) = 0) then
  begin
    Result := False;
    Exit;
  end;

  // Não pode começar ou terminar com @ ou ponto
  if (Email[1] in ['@', '.']) or
  (Email[Length(Email)] in ['@', '.']) then
  begin
    Result := False;
    Exit;
  end;

  // O @ e o ponto não podem estar juntos
  if (Email[Pos( '@', Email) + 1] = '.') or
  (Email[Pos( '@', Email) - 1] = '.') then
  begin
    Result := False;
    Exit;
  end;

  // Testa se tem algum caracter inválido.
  for I := 1 to Length(Email) do
  begin
    for C := 0 to Length(InvalidChar) do
      if (Email[I] = InvalidChar[C]) then
      begin
        Result := False;
        Exit;
      end;
  end;

  // Se não encontrou problemas, retorna verdadeiro
  Result := True;
end;

{02}function GeraImagem(Form: TUniForm; Img: TUniImage): string;
const
  f: array [0..4] of string = ('Courier New', 'Impact', 'Times New Roman',
                               'Verdana', 'Arial');
  s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  C: ARRAY [0..14] OF tcOLOR = (clAqua, clBlack, clBlue, clFuchsia, clGray,
                                clGreen, clLime, clMaroon, clNavy, clOlive,
                                clPurple, clRed, clSilver, clTeal, clYellow);
var
  i, x, y : integer;
  r : string;

begin

  With Form do
    begin
      randomize;
      Img.Width := 160;
      Img.Height := 60;
      for i := 0 to 3 do
        r := r + s[Random(length(s)-1)+1];

      with Img.Picture.Bitmap do
      begin
        width := Img.Width;
        Height := Img.Height;
        Canvas.Brush.Color := $00EFEFEF;
        Canvas.FillRect(Img.ClientRect);

        for i := 0 to 3 do
        begin
          Canvas.Font.Size := random(20) + 20;
          Canvas.Font.Name := f[High(f)];
          Canvas.Font.Color := c[random(High(c))];
          Canvas.TextOut(i*40,0,r[i+1]);
        end;

        for i := 0 to 2 do
        begin
          Canvas.Pen.Color := c[random(High(c))];
          Canvas.Pen.Width := 2;
          canvas.MoveTo(random(Width),0);
          Canvas.LineTo(random(Width),Height);
          Canvas.Pen.Width := 1;
          x := random(Width-10);
          y := random(Height-10);
          Canvas.Rectangle(x,y,x+10,y+10);
        end;
      end;
    end;

  Result := r;
end;

{03}function GeraSenha:String;
const
  s = 'abcdefghijklmnopqrstuvwxyz0123456789';
var
  I : integer;
  r : string;

begin
  Randomize;
  for I := 0 to 4 do
    r := r + s[Random(length(s)-1)+1];

  Result:= r;
end;

{04}function SaveClipboard(texto: string ): string;
begin
  Clipboard.AsText :=texto;
end;

{05}function gen_id(tabela: string; Conexao: TADConnection): Integer;
var
  SQLQuery :TADQuery;
begin
  try
    SQLQuery := TADQuery.Create(Nil);
    SQLQuery.Connection  := Conexao;
    with SQLQuery do
      begin
        SQL.Add('SELECT AUTO_INCREMENT  FROM INFORMATION_SCHEMA.TABLES              '+
                 'WHERE TABLE_SCHEMA = '''+Conexao.Params.Values['Database']+'''    '+
                 '  AND TABLE_NAME = '''+tabela+'''                                 ');
        Open;
      end;
      if SQLQuery.Fields[0].AsInteger = 0 then
        Result:= 1
      else
        Result:= SQLQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(SQLQuery);
  end;
end;

{06}function RelatorioErro(form, objeto, unit_, classe_unit_, erro:String): String;
var
  SQLQuery      : TADQuery;
  mensagem_erro : String;
begin
  try
    SQLQuery := TADQuery.Create(Nil);
    SQLQuery.Connection  := DM.ConexaoFiredac;

    SQLQuery.SQL.Clear;
    SQLQuery.SQL.Add('INSERT INTO LOG_ERROS (FORMULARIO,                        '+
                     '                       OBJETO,                            '+
                     '                       UNIT,                              '+
                     '                       CLASSE_UNIT,                       '+
                     '                       MENSAGEM_ERRO,                     '+
                     '                       DAT_ERRO,                          '+
                     '                       IP,                                '+
                     '                       OS,                                '+
                     '                       NAVEGADOR,                         '+
                     '                       ID_USUARIO)                        '+
                     '               VALUES (:P00, :P01, :P02, :P03, :P04, SYSDATE(),'+
                     '                       :P05, :P06, :P07, :P08)            ');
    SQLQuery.Params[00].AsString  := form;
    SQLQuery.Params[01].AsString  := objeto;
    SQLQuery.Params[02].AsString  := unit_;
    SQLQuery.Params[03].AsString  := classe_unit_;
    SQLQuery.Params[04].AsString  := erro;
    SQLQuery.Params[05].AsString  := ID.ip;
    SQLQuery.Params[06].AsString  := ID.os;
    SQLQuery.Params[07].AsString  := ID.navegador;
    SQLQuery.Params[08].AsInteger := ID.id_glo_usuario;

    SQLQuery.ExecSQL;

    mensagem_erro := '<b>'+form+'|->'+objeto+'|->'+unit_+'|->'+classe_unit_+'</b><p>'+erro+'</p>';

    FormMensagem.ShowModal;
    FormMensagem.UniHTMLMemoErro.Text:= mensagem_erro;
    FormMensagem.Caption := 'Relatório de erros';
  finally
    FreeAndNil(SQLQuery);
  end;
end;

{07}function data_atual_bd: TDateTime;
var
  SQLQuery      :TADQuery;
begin
  try
    SQLQuery := TADQuery.Create(Nil);
    SQLQuery.Connection  := DM.ConexaoFiredac;

    SQLQuery.SQL.Add('SELECT SYSDATE() FROM DUAL');
    SQLQuery.Open;
    Result:= SQLQuery.Fields[0].AsDateTime;
  finally
    FreeAndNil(SQLQuery);
  end;
end;

{08}function Valida_CPF(numCPF: String): Boolean;
Var
  d1, d4, xx, nCount, resto, digito1, digito2: Integer;
  Check: String;
Begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length(numCPF) - 2 do
  begin
    if Pos(Copy(numCPF, nCount, 1), '/-.') = 0 then
    begin
      d1 := d1 + (11 - xx) * StrToInt(Copy(numCPF, nCount, 1));
      d4 := d4 + (12 - xx) * StrToInt(Copy(numCPF, nCount, 1));
      xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := IntToStr(digito1) + IntToStr(digito2);
  if Check <> Copy(numCPF, succ(Length(numCPF) - 2), 2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;

  // invalidos
  if (numCPF = '000-000-000-00') or (numCPF = '111-111-111-11') or
     (numCPF = '222-222-222-22') or (numCPF = '333-333-333-33') or
     (numCPF = '444-444-444-44') or (numCPF = '555-555-555-55') or
     (numCPF = '666-666-666-66') or (numCPF = '777-777-777-77') or
     (numCPF = '888-888-888-88') or (numCPF = '999-999-999-99') then
     Result := False;

end;

{09}function Valida_CNPJ(numCNPJ: string): Boolean;
var
  cnpj: string;
  dg1, dg2: Integer;
  x, total: Integer;
  ret: Boolean;
begin
  ret := False;
  cnpj := '';
  // Analisa os formatos
  if Length(numCNPJ) = 18 then
    if (Copy(numCNPJ, 3, 1) + Copy(numCNPJ, 7, 1) + Copy(numCNPJ, 11,
        1) + Copy(numCNPJ, 16, 1) = '../-') then
    begin
      cnpj := Copy(numCNPJ, 1, 2) + Copy(numCNPJ, 4, 3) + Copy(numCNPJ, 8, 3)
        + Copy(numCNPJ, 12, 4) + Copy(numCNPJ, 17, 2);
      ret := True;
    end;
  if Length(numCNPJ) = 14 then
  begin
    cnpj := numCNPJ;
    ret := True;
  end;
  // Verifica
  if ret then
  begin
    try
      // 1° digito
      total := 0;
      for x := 1 to 12 do
      begin
        if x < 5 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
      end;
      dg1 := 11 - (total mod 11);
      if dg1 > 9 then
        dg1 := 0;
      // 2° digito
      total := 0;
      for x := 1 to 13 do
      begin
        if x < 6 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
      end;
      dg2 := 11 - (total mod 11);
      if dg2 > 9 then
        dg2 := 0;
      // Validação final
      if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and
        (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
        ret := True
      else
        ret := False;
    except
      ret := False;
    end;
    // Inválidos
    case AnsiIndexStr(cnpj, ['00000000000000', '11111111111111',
      '22222222222222', '33333333333333', '44444444444444', '55555555555555',
      '66666666666666', '77777777777777', '88888888888888', '99999999999999'])
      of

      0 .. 9:
        ret := False;

    end;
  end;
  Valida_CNPJ := ret;
end;

{10}function Valida_Cartao(const parStr:string): Boolean;
var
  Valor, Soma, Multiplicador, Tamanho, i : Integer;
begin
  Multiplicador := 2;
  Soma := 0;
  Tamanho := Length(parStr);
  for i := 1 to Tamanho - 1 do
    begin
      Valor := StrToInt (Copy (parStr, i, 1)) * Multiplicador;
      Soma := Soma + (Valor div 10) + (Valor mod 10);
      if Multiplicador = 1 then
        Multiplicador := 2
      else
        Multiplicador := 1;
      end;
      if IntToStr ((10 - (Soma mod 10)) mod 10) = Copy (parStr, Tamanho, 1) Then
        Result := False
      else
        Result := True;
end;

{11}function FormataValor(edit:TuniEdit):String;
var
   s : string;
   v : double;
   I : integer;
begin
  try
   if edit.Text = EmptyStr then
      edit.Text := '0';

   {obter o texto do edit, SEM o ponto decimal}
   s := EmptyStr;
   for I := 1 to length(edit.Text) do
   if (edit.Text[I] in ['0'..'9',',','-']) then
      s := s + edit.Text[I];

   if s = EmptyStr then
      s := '0';

   {fazer com que o conteúdo do edit apresente 2 casas decimais}
   v := strtofloat(s);

   {Formata o valor de (V) para aceitar valores do tipo 0,10}
   edit.Text := FormatFloat('0.00',v);

   edit.Color  := clWhite;
   except
    on e: exception do
      begin
        ShowMessage('Este Campo só é permitido números.');
        edit.Text   := EmptyStr;
        edit.Color  := clYellow;
        edit.SetFocus;
      end;
  end;

end;

{11}function SomenteNumero(edit:TuniEdit):String;
var
  s : string;
  I : integer;
begin
  s := EmptyStr;
  for I := 1 to length(edit.Text) do
  if (edit.Text[I] in ['0'..'9']) then
     s := s + edit.Text[I];

  edit.Text  := s;
end;

{12}function FormataCPF_CNPJ(edit:TuniEdit): String;
Var
  vTam, xx : Integer;
  vDoc : String;
begin
  vTam := Length(edit.text);
  For xx := 1 To vTam Do
     If (Copy(edit.text,xx,1) <> '.') And (Copy(edit.text,xx,1) <> '-') And (Copy(edit.text,xx,1) <> '/') Then
        vDoc := vDoc + Copy(edit.text,xx,1);
  edit.text := vDoc;
  vTam := Length(edit.text);
  vDoc := '';
  vDoc := '';
  For xx := 1 To vTam Do
     begin
     vDoc := vDoc + Copy(edit.text,xx,1);
     If vTam <= 11 Then
        begin
        If (xx in [3,6]) Then vDoc := vDoc + '.';
        If xx = 9 Then vDoc := vDoc + '-';
        end;
     If (vTam > 11) and (vTam <= 14) Then
        begin
        If (xx in [2,5]) Then vDoc := vDoc + '.';
        If xx = 8 Then vDoc := vDoc + '/';
        If xx = 12 Then vDoc := vDoc + '-';
        end;
     end;
  edit.text := vDoc;
end;

{13}function FormataCEP(edit:TuniEdit): String;
var
  vTam, I : Integer;
  vDoc : String;
begin
  vTam := Length(edit.text);
  if (vTam <> 8) and (vTam <> 9) and (vTam <> 0) then
    begin
      ShowMessage('CEP Inválido!');
      edit.Text := EmptyStr;
      Exit;
    end;

  for I := 1 to vTam do
    begin
      if (edit.Text[I] in ['0'..'9']) then
        begin
          vDoc  := vDoc + Copy(edit.Text,I,1);
          if I = 5 then
            vDoc  := vDoc + '-';
        end;
    end;

  edit.text := vDoc;

end;

{14}function FormataTelefone(edit:TuniEdit): String;
var
  vTam, I : Integer;
  vDoc, vText : String;
begin
  vTam := Length(edit.text);
  if (vTam <> 11) and (vTam <> 14) and (vTam <> 0) then
    begin
      ShowMessage('Telefone Inválido!');
      edit.Text := EmptyStr;
      Exit;
    end;

   for I := 1 to vTam do
    begin
      if (edit.Text[I] in ['0'..'9']) then
        vDoc  := vDoc + Copy(edit.Text,I,1);
    end;

  vTam  := Length(vDoc);
  VText := vDoc;
  vDoc  := EmptyStr;

  for I := 1 to vTam do
    begin

      if I = 1 then
        vDoc  := '(';
      if I = 4 then
        vDoc  := vDoc + ')';
      if I = 8 then
        vDoc  := vDoc + '-';

      vDoc  := vDoc + Copy(vText,I,1);

    end;

  edit.text := vDoc;

end;

{15}function RemoveAspas(Form: TUniForm): String;
var
  I : Integer;
begin
  with Form do
    begin
      {Remoção de Aspas Simples em todos os TUniEdit Chr(39)' Para Chr(44)´ SQL Inject ;)}
      for I := 0 to ComponentCount - 1 do
        begin
          if Components[I] is TUniEdit then
            TUniEdit(Components[I]).Text := StringReplace(TUniEdit(Components[I]).Text,Chr(39),'´',[rfReplaceAll]);
          if Components[I] is TUniDBEdit then
            TUniDBEdit(Components[I]).Text := StringReplace(TUniDBEdit(Components[I]).Text,Chr(39),'´',[rfReplaceAll]);
        end;
    end;
end;


end.
