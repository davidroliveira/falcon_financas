unit U_Graficos;

interface

uses
  uniGUIFrame, uniPanel,uADCompClient, uniLabel, uniImage, Data.DB, System.Classes,
  Vcl.Imaging.pngimage, Vcl.Controls, Vcl.Graphics, uniGUITypes,
  System.SysUtils;

procedure atualiza_saldos (Frame :TuniFrame; Panel: TuniPanel; lb_total: TUniLabel);

implementation

uses U_DM;

procedure atualiza_saldos (Frame :TuniFrame; Panel: TuniPanel; lb_total: TUniLabel);
var
  SQLQuery  : TADQuery;

  procedure cria_objetos;
  var
    var_panel     : TUniPanel;
    var_label     : TUniLabel;
    var_imagem    : TUniImage;
    BField        : TBlobField;
    Stream        : TStream;
    Png           : TPNGImage;
    saldo_total   : Real;
  begin
    with Frame do
      begin
        SQLQuery.SQL.Clear;
        SQLQuery.SQL.Add('SELECT A.NOME_CONTA,                                     '+
                          '       A.TIPO,                                           '+
                          '       A.SALDO,                                          '+
                          '       B.LOGO                                            '+
                          '  FROM CONTAS               A,                           '+
                          '       BANCOS               B                            '+
                          ' WHERE A.ID_BANCOS          =  B.ID_BANCOS               '+
                          '   AND A.TIPO               = ''BANCO''                  '+
                          '   AND A.VISIVEL_GRAFICOS   = ''S''                      '+
                          '   AND A.ATIVO              = ''S''                      '+
                          ' UNION                                                   '+
                          'SELECT A.NOME_CONTA,                                     '+
                          '       A.TIPO,                                           '+
                          '       A.SALDO,                                          '+
                          '       B.PARAMETRO_BLOB                                  '+
                          '  FROM CONTAS              A,                            '+
                          '       PARAMETROS          B                             '+
                          ' WHERE A.TIPO              = ''CARTEIRA''                '+
                          '   AND B.MODULO            = ''CONTAS''                  '+
                          '   AND B.TITULO            = ''IMAGEM PADRAO CARTEIRA''  '+
                          '   AND A.VISIVEL_GRAFICOS  = ''S''                       '+
                          '   AND A.ATIVO             = ''S''                       '+
                          ' ORDER BY 2 ASC                                          ');
        SQLQuery.Open;
        SQLQuery.First;

        saldo_total := 0;

        while Not(SQLQuery.Eof) do
          begin
            {Saldo das Contas}
            var_panel := TUniPanel.Create(Frame);
            with var_panel do
              begin
                Parent        := Panel;
                Align         := alTop;
                Height        := 50;
                Width         := 190;
                Tag           := 1;
                Color         := clWhite;
                BorderStyle   := ubsNone;
                Hint          := SQLQuery.FieldByName('NOME_CONTA').AsString;
                ShowHint      := True;

                var_imagem  := TUniImage.Create(Frame);
                with var_imagem do
                  begin
                    Parent  := var_panel;
                    Top     := 7;
                    Left    := 10;
                    Height  := 35;
                    Width   := 35;

                    BField  := TBlobField(SQLQuery.FieldByName('LOGO'));
                    Stream  := SQLQuery.CreateBlobStream(BField, bmRead);
                    Png     := TPNGImage.Create;
                    Visible := True;


                    try
                      Png.LoadFromStream(Stream);
                      Picture.Graphic := Png;
                    finally
                      Stream.Free;
                      FreeAndNil(Png);
                    end;
                  end;

                var_label  := TUniLabel.Create(Frame);
                with var_label do
                  begin
                    Parent      := var_panel;
                    Top         := 17;
                    Left        := 63;
                    Font.Size   := 10;
                    Font.Color  := clMedGray;
                    Caption     := FormatFloat('R$ ###,##,0.00',SQLQuery.FieldByName('SALDO').AsFloat);
                  end;
              end;
            saldo_total := saldo_total + SQLQuery.FieldByName('SALDO').AsFloat;
            SQLQuery.Next;
          end;

        lb_total.Caption  :=  FormatFloat('R$ ###,##,0.00', saldo_total);
      end;
  end;

  procedure remove_objetos;
  var
    I : Integer;
  begin
    //for I := 1 to Frame.ComponentCount do
    for I := Frame.ComponentCount -1 downto 1 do
      if Frame.Components[I] is TUniPanel then
        if (TUniPanel(Frame.Components[I]).Parent = Panel) and (TUniPanel(Frame.Components[I]).Tag = 1) then
          begin
            TUniPanel(Frame.Components[I]).Free;
          end;
  end;

begin
  try
    SQLQuery  := TADQuery.Create(Nil);
    SQLQuery.Connection := DM.ConexaoFiredac;

    remove_objetos;

    cria_objetos;

  finally
    FreeAndNil(SQLQuery);
  end;
end;

end.
