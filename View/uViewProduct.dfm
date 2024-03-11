object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    Color = 9524837
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 628
      Height = 49
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 622
      DesignSize = (
        628
        49)
      object SpeedButton1: TSpeedButton
        Left = 527
        Top = 9
        Width = 57
        Height = 28
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Fechar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitLeft = 551
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 49
      Width = 628
      Height = 393
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 622
      ExplicitHeight = 384
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 628
        Height = 393
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 622
        ExplicitHeight = 384
        object TabSheet1: TTabSheet
          Cursor = crHandPoint
          BorderWidth = 1
          Caption = 'INCLUIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 618
            Height = 361
            Align = alClient
            BevelOuter = bvNone
            Color = 9524837
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 612
            ExplicitHeight = 352
            object Panel5: TPanel
              Left = 0
              Top = 320
              Width = 618
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              TabOrder = 0
              ExplicitTop = 311
              ExplicitWidth = 612
              object SpeedButton2: TSpeedButton
                Left = 1
                Top = 1
                Width = 616
                Height = 39
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Incluir'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton2Click
                ExplicitLeft = 21
                ExplicitWidth = 92
                ExplicitHeight = 55
              end
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 618
              Height = 320
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              ExplicitWidth = 612
              ExplicitHeight = 311
              object Label1: TLabel
                Left = 16
                Top = 8
                Width = 71
                Height = 20
                Caption = '*Descri'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 16
                Top = 64
                Width = 55
                Height = 20
                Caption = '*C'#243'digo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 16
                Top = 121
                Width = 43
                Height = 20
                Caption = '*Pre'#231'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label9: TLabel
                Left = 312
                Top = 68
                Width = 71
                Height = 20
                Caption = '*Categoria'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 240
                Top = 181
                Width = 51
                Height = 20
                Caption = '*Qte. cx'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 240
                Top = 231
                Width = 157
                Height = 15
                Caption = 'Quando a entrada '#233' por caixa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentFont = False
              end
              object Label6: TLabel
                Left = 240
                Top = 245
                Width = 174
                Height = 15
                Caption = 'e a venda '#233' por unidade, informe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 240
                Top = 258
                Width = 165
                Height = 15
                Caption = 'neste campo quantas unidades'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 240
                Top = 274
                Width = 88
                Height = 15
                Caption = 'cont'#233'm na caixa.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentFont = False
              end
              object Label10: TLabel
                Left = 16
                Top = 180
                Width = 186
                Height = 20
                Caption = '*Unidade de venda/estoque'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label11: TLabel
                Left = 312
                Top = 180
                Width = 138
                Height = 20
                Caption = '*Unidade de compra'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object EditNameProduct: TEdit
                Left = 16
                Top = 34
                Width = 505
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 60
                ParentFont = False
                TabOrder = 0
                TextHint = 'Descri'#231#227'o do produto'
              end
              object EditCode: TEdit
                Left = 16
                Top = 90
                Width = 209
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 14
                ParentFont = False
                TabOrder = 1
                TextHint = 'C'#243'digo'
              end
              object EditPrice: TEdit
                Left = 16
                Top = 147
                Width = 209
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 7
                ParentFont = False
                TabOrder = 3
                TextHint = 'Pre'#231'o'
                OnKeyPress = EditPriceKeyPress
              end
              object ComboBox1: TComboBox
                Left = 312
                Top = 90
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                TabOrder = 2
                Items.Strings = (
                  'Alimentos'
                  'Eletr'#244'nicos'
                  'Vestu'#225'rio'
                  'Outros')
              end
              object EditPackageQuantity: TEdit
                Left = 240
                Top = 202
                Width = 57
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 4
                NumbersOnly = True
                ParentFont = False
                TabOrder = 5
                Text = '1'
              end
              object ComboBox2: TComboBox
                Left = 16
                Top = 202
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                TabOrder = 4
                Items.Strings = (
                  'Unidade'
                  'Barril'
                  'Balde'
                  'Carteira'
                  'Caixeta'
                  'Caixa'
                  'Dose'
                  'Fardo'
                  'Gramas'
                  'Garrafa'
                  'Galao'
                  'Kilo'
                  'Litro'
                  'Lata'
                  'Milheiro'
                  'Mililitro'
                  'Molho'
                  'Pacote'
                  'Porcao'
                  'Prato'
                  'Saco')
              end
              object ComboBox3: TComboBox
                Left = 312
                Top = 202
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                TabOrder = 6
                Items.Strings = (
                  'Unidade'
                  'Barril'
                  'Balde'
                  'Carteira'
                  'Caixeta'
                  'Caixa'
                  'Dose'
                  'Fardo'
                  'Gramas'
                  'Garrafa'
                  'Galao'
                  'Kilo'
                  'Litro'
                  'Lata'
                  'Milheiro'
                  'Mililitro'
                  'Molho'
                  'Pacote'
                  'Porcao'
                  'Prato'
                  'Saco')
              end
            end
          end
        end
        object TabSheet2: TTabSheet
          BorderWidth = 1
          Caption = 'ALTERAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9528662
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 618
            Height = 361
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 618
              Height = 320
              Align = alClient
              BevelOuter = bvNone
              Color = clGrayText
              ParentBackground = False
              TabOrder = 0
              object Label12: TLabel
                Left = 16
                Top = 64
                Width = 71
                Height = 20
                Caption = '*Descri'#231#227'o'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label13: TLabel
                Left = 16
                Top = 8
                Width = 55
                Height = 20
                Caption = '*C'#243'digo'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label14: TLabel
                Left = 16
                Top = 121
                Width = 43
                Height = 20
                Caption = '*Pre'#231'o'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label15: TLabel
                Left = 312
                Top = 12
                Width = 71
                Height = 20
                Caption = '*Categoria'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label16: TLabel
                Left = 240
                Top = 181
                Width = 55
                Height = 20
                Caption = '* Qte. cx'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label17: TLabel
                Left = 240
                Top = 231
                Width = 157
                Height = 15
                Caption = 'Quando a entrada '#233' por caixa'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label18: TLabel
                Left = 240
                Top = 245
                Width = 174
                Height = 15
                Caption = 'e a venda '#233' por unidade, informe'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label19: TLabel
                Left = 240
                Top = 258
                Width = 165
                Height = 15
                Caption = 'neste campo quantas unidades'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label20: TLabel
                Left = 240
                Top = 274
                Width = 88
                Height = 15
                Caption = 'cont'#233'm na caixa.'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label21: TLabel
                Left = 16
                Top = 180
                Width = 186
                Height = 20
                Caption = '*Unidade de venda/estoque'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label22: TLabel
                Left = 312
                Top = 180
                Width = 138
                Height = 20
                Caption = '*Unidade de compra'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Image1: TImage
                Left = 225
                Top = 33
                Width = 33
                Height = 30
                Cursor = crHandPoint
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
                  002408040000004B095013000001FC4944415478DAED954B48D4511487BF8901
                  0D37319194A80945BACB4DCF8DAF228BA04C7213E5C64DD803A28C40F0118248
                  A430510B3745BA49A845A981082951606EA430B0455852442282600D64F59B3B
                  53CAF4BFDEFFCCB4ABB338E7DECBE1E3DC73CF3937C05F92C0BF070A51C646D6
                  31C3242F5205EDA2850A82BFF71FB8C57516930305E9A2DEC36F8663AB471648
                  C03CE280592DF19497CCB385523699932F1C61C82FE8463C9A3E2E311D3F5BC3
                  09AE91ADD53C3B79E307B49B6766DF446B82D7669E50203BC8213FA0C7E65A7D
                  D478F86D67DCA47F2FCF5DA0109FE4BAA4AC4C7B7A765327DDC90517E8280FA4
                  4729B1C45ECEB0F404C52ED019C2D261CE5940EB99959E65830B749976E976AE
                  5840992A0088C83A40B5DC96EEE1A405B4D53CFD7BF25DA01D8C497F2497EF9E
                  9EA7B929DDCF611728A036C8913DC55D0FBF20AF2894AD37B85541D0C855E9CF
                  8AEDCF02E850ADC39CCA72C10DCAE23579B26FA9D233AF8CA68D06B33AAB26C2
                  0D8AE66984B5B2DFB8436FBC69CB396F2E055314F1C31F08F6734FE3CC4BA6D8
                  46B48DAAF8EA07147DE6309509677334EB3416CDA050113FA0A8ECE138FB3487
                  42BCD3A87DA86B2E1844A51D95CCF0CFE43E076DA8E47E910C35B60595EC77B4
                  8C1AD0148FA40EB2A252F9203394ABD8C86D54A9A601FA85EAA73ABD8862A88B
                  FA5BD2CA9145FE83DCF21381C97525E57779780000000049454E44AE426082}
                OnClick = Image1Click
              end
              object Edit1: TEdit
                Left = 16
                Top = 90
                Width = 505
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 60
                ParentFont = False
                TabOrder = 2
                TextHint = 'Descri'#231#227'o do produto'
              end
              object Edit2: TEdit
                Left = 16
                Top = 34
                Width = 209
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 14
                ParentFont = False
                TabOrder = 0
                TextHint = 'C'#243'digo'
              end
              object Edit3: TEdit
                Left = 16
                Top = 147
                Width = 209
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 7
                ParentFont = False
                TabOrder = 3
                TextHint = 'Pre'#231'o'
                OnKeyPress = EditPriceKeyPress
              end
              object ComboBox4: TComboBox
                Left = 312
                Top = 34
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                TabOrder = 1
                Items.Strings = (
                  'Alimentos'
                  'Eletr'#244'nicos'
                  'Vestu'#225'rio'
                  'Outros')
              end
              object Edit4: TEdit
                Left = 240
                Top = 202
                Width = 57
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 4
                NumbersOnly = True
                ParentFont = False
                TabOrder = 5
                Text = '1'
              end
              object ComboBox5: TComboBox
                Left = 16
                Top = 202
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                TabOrder = 4
                Items.Strings = (
                  'Unidade'
                  'Barril'
                  'Balde'
                  'Carteira'
                  'Caixeta'
                  'Caixa'
                  'Dose'
                  'Fardo'
                  'Gramas'
                  'Garrafa'
                  'Galao'
                  'Kilo'
                  'Litro'
                  'Lata'
                  'Milheiro'
                  'Mililitro'
                  'Molho'
                  'Pacote'
                  'Porcao'
                  'Prato'
                  'Saco')
              end
              object ComboBox6: TComboBox
                Left = 312
                Top = 202
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                TabOrder = 6
                Items.Strings = (
                  'Unidade'
                  'Barril'
                  'Balde'
                  'Carteira'
                  'Caixeta'
                  'Caixa'
                  'Dose'
                  'Fardo'
                  'Gramas'
                  'Garrafa'
                  'Galao'
                  'Kilo'
                  'Litro'
                  'Lata'
                  'Milheiro'
                  'Mililitro'
                  'Molho'
                  'Pacote'
                  'Porcao'
                  'Prato'
                  'Saco')
              end
              object Edit9: TEdit
                Left = 16
                Top = 290
                Width = 312
                Height = 28
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 60
                ParentFont = False
                TabOrder = 7
              end
            end
            object Panel10: TPanel
              Left = 0
              Top = 320
              Width = 618
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              Color = 9528662
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              object SpeedButton3: TSpeedButton
                Left = 1
                Top = 1
                Width = 616
                Height = 39
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Alterar'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton3Click
                ExplicitLeft = 21
                ExplicitWidth = 92
                ExplicitHeight = 55
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Cursor = crHandPoint
          BorderWidth = 1
          Caption = 'EXCLUIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 9528662
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImageIndex = 2
          ParentFont = False
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 618
            Height = 361
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 618
              Height = 320
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Label23: TLabel
                Left = 16
                Top = 64
                Width = 65
                Height = 20
                Caption = 'Descri'#231#227'o'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label24: TLabel
                Left = 16
                Top = 8
                Width = 49
                Height = 20
                Caption = 'C'#243'digo'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label25: TLabel
                Left = 16
                Top = 121
                Width = 37
                Height = 20
                Caption = 'Pre'#231'o'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label26: TLabel
                Left = 312
                Top = 12
                Width = 65
                Height = 20
                Caption = 'Categoria'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label27: TLabel
                Left = 240
                Top = 181
                Width = 45
                Height = 20
                Caption = 'Qte. cx'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label28: TLabel
                Left = 240
                Top = 231
                Width = 157
                Height = 15
                Caption = 'Quando a entrada '#233' por caixa'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label29: TLabel
                Left = 240
                Top = 245
                Width = 174
                Height = 15
                Caption = 'e a venda '#233' por unidade, informe'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label30: TLabel
                Left = 240
                Top = 258
                Width = 165
                Height = 15
                Caption = 'neste campo quantas unidades'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label31: TLabel
                Left = 240
                Top = 274
                Width = 88
                Height = 15
                Caption = 'cont'#233'm na caixa.'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsItalic]
                ParentColor = False
                ParentFont = False
              end
              object Label32: TLabel
                Left = 16
                Top = 180
                Width = 180
                Height = 20
                Caption = 'Unidade de venda/estoque'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label33: TLabel
                Left = 312
                Top = 180
                Width = 132
                Height = 20
                Caption = 'Unidade de compra'
                Color = clGrayText
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Image2: TImage
                Left = 225
                Top = 33
                Width = 33
                Height = 30
                Cursor = crHandPoint
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000000240000
                  002408040000004B095013000001FC4944415478DAED954B48D4511487BF8901
                  0D37319194A80945BACB4DCF8DAF228BA04C7213E5C64DD803A28C40F0118248
                  A430510B3745BA49A845A981082951606EA430B0455852442282600D64F59B3B
                  53CAF4BFDEFFCCB4ABB338E7DECBE1E3DC73CF3937C05F92C0BF070A51C646D6
                  31C3242F5205EDA2850A82BFF71FB8C57516930305E9A2DEC36F8663AB471648
                  C03CE280592DF19497CCB385523699932F1C61C82FE8463C9A3E2E311D3F5BC3
                  09AE91ADD53C3B79E307B49B6766DF446B82D7669E50203BC8213FA0C7E65A7D
                  D478F86D67DCA47F2FCF5DA0109FE4BAA4AC4C7B7A765327DDC90517E8280FA4
                  4729B1C45ECEB0F404C52ED019C2D261CE5940EB99959E65830B749976E976AE
                  5840992A0088C83A40B5DC96EEE1A405B4D53CFD7BF25DA01D8C497F2497EF9E
                  9EA7B929DDCF611728A036C8913DC55D0FBF20AF2894AD37B85541D0C855E9CF
                  8AEDCF02E850ADC39CCA72C10DCAE23579B26FA9D233AF8CA68D06B33AAB26C2
                  0D8AE66984B5B2DFB8436FBC69CB396F2E055314F1C31F08F6734FE3CC4BA6D8
                  46B48DAAF8EA07147DE6309509677334EB3416CDA050113FA0A8ECE138FB3487
                  42BCD3A87DA86B2E1844A51D95CCF0CFE43E076DA8E47E910C35B60595EC77B4
                  8C1AD0148FA40EB2A252F9203394ABD8C86D54A9A601FA85EAA73ABD8862A88B
                  FA5BD2CA9145FE83DCF21381C97525E57779780000000049454E44AE426082}
                OnClick = Image2Click
              end
              object Edit5: TEdit
                Left = 16
                Top = 90
                Width = 505
                Height = 28
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 60
                ParentFont = False
                TabOrder = 2
                TextHint = 'Descri'#231#227'o do produto'
              end
              object Edit6: TEdit
                Left = 16
                Top = 34
                Width = 209
                Height = 28
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 14
                ParentFont = False
                TabOrder = 0
                TextHint = 'C'#243'digo'
              end
              object Edit7: TEdit
                Left = 16
                Top = 147
                Width = 209
                Height = 28
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 7
                ParentFont = False
                TabOrder = 3
                TextHint = 'Pre'#231'o'
                OnKeyPress = EditPriceKeyPress
              end
              object ComboBox7: TComboBox
                Left = 312
                Top = 34
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                Enabled = False
                TabOrder = 1
                Items.Strings = (
                  'Alimentos'
                  'Eletr'#244'nicos'
                  'Vestu'#225'rio'
                  'Outros')
              end
              object Edit8: TEdit
                Left = 240
                Top = 202
                Width = 57
                Height = 28
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 4
                NumbersOnly = True
                ParentFont = False
                TabOrder = 5
                Text = '1'
              end
              object ComboBox8: TComboBox
                Left = 16
                Top = 202
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                Enabled = False
                TabOrder = 4
                Items.Strings = (
                  'Unidade'
                  'Barril'
                  'Balde'
                  'Carteira'
                  'Caixeta'
                  'Caixa'
                  'Dose'
                  'Fardo'
                  'Gramas'
                  'Garrafa'
                  'Galao'
                  'Kilo'
                  'Litro'
                  'Lata'
                  'Milheiro'
                  'Mililitro'
                  'Molho'
                  'Pacote'
                  'Porcao'
                  'Prato'
                  'Saco')
              end
              object ComboBox9: TComboBox
                Left = 312
                Top = 202
                Width = 209
                Height = 28
                BevelInner = bvNone
                BevelOuter = bvNone
                Style = csDropDownList
                Enabled = False
                TabOrder = 6
                Items.Strings = (
                  'Unidade'
                  'Barril'
                  'Balde'
                  'Carteira'
                  'Caixeta'
                  'Caixa'
                  'Dose'
                  'Fardo'
                  'Gramas'
                  'Garrafa'
                  'Galao'
                  'Kilo'
                  'Litro'
                  'Lata'
                  'Milheiro'
                  'Mililitro'
                  'Molho'
                  'Pacote'
                  'Porcao'
                  'Prato'
                  'Saco')
              end
              object Edit10: TEdit
                Left = 16
                Top = 289
                Width = 312
                Height = 28
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 60
                ParentFont = False
                TabOrder = 7
              end
            end
            object Panel12: TPanel
              Left = 0
              Top = 320
              Width = 618
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 1
              Color = 9528662
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              object SpeedButton4: TSpeedButton
                Left = 1
                Top = 1
                Width = 616
                Height = 39
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Excluir'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton4Click
                ExplicitLeft = 21
                ExplicitWidth = 92
                ExplicitHeight = 55
              end
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'LISTAR'
          ImageIndex = 3
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 620
            Height = 363
            Align = alClient
            BevelOuter = bvNone
            Color = 9524837
            ParentBackground = False
            TabOrder = 0
            object Panel14: TPanel
              Left = 0
              Top = 322
              Width = 620
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              Color = 9524837
              ParentBackground = False
              TabOrder = 0
              object SpeedButton5: TSpeedButton
                Left = 0
                Top = 0
                Width = 620
                Height = 41
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Listar'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton5Click
                ExplicitLeft = 8
                ExplicitWidth = 92
              end
            end
            object Panel15: TPanel
              Left = 0
              Top = 0
              Width = 620
              Height = 322
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 620
                Height = 322
                Align = alClient
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
              end
            end
          end
        end
      end
    end
  end
end
