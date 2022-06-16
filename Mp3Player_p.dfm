object Form3: TForm3
  Left = 460
  Top = 249
  Caption = 'MP3 Player'
  ClientHeight = 476
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 115
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 24
    Width = 809
    Height = 369
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 336
      Top = 64
      Width = 209
      Height = 35
      Caption = 'Media Player'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProgressBar1: TProgressBar
      Left = 48
      Top = 233
      Width = 689
      Height = 20
      TabOrder = 0
    end
    object MediaPlayer1: TMediaPlayer
      Left = 48
      Top = 162
      Width = 685
      Height = 59
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = MediaPlayer1Click
    end
    object Edit1: TEdit
      Left = 48
      Top = 131
      Width = 605
      Height = 24
      TabOrder = 2
    end
    object Button1: TButton
      Left = 659
      Top = 131
      Width = 74
      Height = 25
      Caption = 'Choose...'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 360
    Top = 400
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 403
  end
end
