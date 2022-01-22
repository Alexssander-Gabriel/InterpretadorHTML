object Frm_Interpretador: TFrm_Interpretador
  Left = 0
  Top = 0
  Caption = 'Interpretador HTML'
  ClientHeight = 615
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 683
    Height = 252
    Align = alBottom
    ShowCaption = False
    TabOrder = 0
    object Mm_Html: TMemo
      Left = 1
      Top = 1
      Width = 681
      Height = 215
      Align = alClient
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'Cole aqui o seu HTML.')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = Mm_HtmlClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 216
      Width = 681
      Height = 35
      Align = alBottom
      TabOrder = 1
      object Btn_RodarHtml: TBitBtn
        Left = 605
        Top = 1
        Width = 75
        Height = 33
        Align = alRight
        Caption = 'Rodar HTML'
        TabOrder = 0
        OnClick = Btn_RodarHtmlClick
      end
      object Btn_Limpar: TBitBtn
        Left = 530
        Top = 1
        Width = 75
        Height = 33
        Align = alRight
        Caption = 'Limpar'
        TabOrder = 1
        OnClick = Btn_LimparClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 596
    Width = 683
    Height = 19
    Panels = <
      item
        Text = 'Desenvolvido por : Alexssander Gabriel'
        Width = 300
      end
      item
        Text = 'Github: https://github.com/Alexssander-Gabriel'
        Width = 300
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 683
    Height = 314
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowCaption = False
    TabOrder = 2
    object WebBrowser: TWebBrowser
      Left = 1
      Top = 1
      Width = 681
      Height = 312
      Align = alClient
      TabOrder = 0
      ExplicitTop = -3
      ExplicitHeight = 305
      ControlData = {
        4C000000624600003F2000000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Pn_body: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 30
    Align = alTop
    TabOrder = 3
    object Edt_Versao: TEdit
      Left = 16
      Top = 5
      Width = 545
      Height = 21
      TabOrder = 0
    end
    object Btn_AlteraVr: TBitBtn
      Left = 587
      Top = 1
      Width = 95
      Height = 28
      Align = alRight
      Caption = 'Alterar Versao'
      TabOrder = 1
      OnClick = Btn_AlteraVrClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 624
    Top = 264
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Exemplo1: TMenuItem
        Caption = 'Exemplo'
        Hint = 'Gera um Exemplo Autom'#225'tico de HTML / Javascript'
        OnClick = Exemplo1Click
      end
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre'
    end
  end
end
