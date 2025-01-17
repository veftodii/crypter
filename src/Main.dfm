object frmCrypter: TfrmCrypter
  Left = 0
  Top = 0
  Caption = 'Crypter/Decrypter'
  ClientHeight = 426
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxTabControl1: TcxTabControl
    Left = 0
    Top = 0
    Width = 129
    Height = 426
    Align = alLeft
    TabOrder = 0
    Properties.CustomButtons.Buttons = <>
    DesignSize = (
      129
      426)
    ClientRectBottom = 421
    ClientRectLeft = 2
    ClientRectRight = 124
    ClientRectTop = 2
    object cxLabel3: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Algorithms:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object rbtnBase64: TcxRadioButton
      Left = 10
      Top = 49
      Width = 108
      Height = 17
      Caption = 'Base64'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      StyleElements = [seFont, seClient]
      OnClick = rbtnBase64Click
      Transparent = True
    end
    object rbtnMD5: TcxRadioButton
      Left = 10
      Top = 73
      Width = 108
      Height = 17
      Caption = 'MD5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnClick = rbtnMD5Click
      Transparent = True
    end
    object rbtnMD5Indy10: TcxRadioButton
      Left = 10
      Top = 97
      Width = 108
      Height = 17
      Caption = 'MD5 (Indy10)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnClick = rbtnMD5Click
      Transparent = True
    end
    object cxMemoStatus: TcxMemo
      Left = 3
      Top = 373
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Properties.VisibleLineCount = 3
      TabOrder = 4
      Visible = False
      OnEditing = cxMemoStatusEditing
      Width = 120
    end
    object cxCheckBox1: TcxCheckBox
      Left = 3
      Top = 353
      Hint = 'Check MD5 vs MD5Indy10 equality of the returning values'
      AutoSize = False
      Caption = ' Compare MD5'
      Properties.NullStyle = nssUnchecked
      TabOrder = 5
      Transparent = True
      Visible = False
      Height = 19
      Width = 114
    end
  end
  object cxTabControl2: TcxTabControl
    Left = 129
    Top = 0
    Width = 530
    Height = 426
    Align = alClient
    TabOrder = 1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 421
    ClientRectLeft = 2
    ClientRectRight = 525
    ClientRectTop = 2
    object PanelSource: TPanel
      Left = 2
      Top = 49
      Width = 523
      Height = 184
      Align = alTop
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      DesignSize = (
        523
        184)
      object cxLabel1: TcxLabel
        Left = 20
        Top = 16
        Caption = 'Source:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxMemoSource: TcxMemo
        Left = 20
        Top = 42
        Anchors = [akLeft, akTop, akRight, akBottom]
        Constraints.MinHeight = 50
        Constraints.MinWidth = 150
        ParentFont = False
        Properties.ScrollBars = ssBoth
        Properties.WordWrap = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Height = 136
        Width = 490
      end
    end
    object PanelResult: TPanel
      Left = 2
      Top = 239
      Width = 523
      Height = 182
      Align = alClient
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 1
      DesignSize = (
        523
        182)
      object cxLabel2: TcxLabel
        Left = 20
        Top = 6
        Caption = 'Result:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxMemoResult: TcxMemo
        Left = 20
        Top = 32
        Anchors = [akLeft, akTop, akRight, akBottom]
        Constraints.MinHeight = 50
        Constraints.MinWidth = 150
        ParentFont = False
        Properties.ScrollBars = ssBoth
        Properties.WordWrap = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Height = 142
        Width = 490
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 523
      Height = 47
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
      object btnDecode: TcxButton
        Left = 122
        Top = 5
        Width = 86
        Height = 35
        Caption = '&Decode'
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnDecodeClick
      end
      object btnEncode: TcxButton
        Left = 20
        Top = 5
        Width = 89
        Height = 35
        Caption = '&Encode'
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnEncodeClick
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 2
      Top = 233
      Width = 523
      Height = 6
      AlignSplitter = salTop
      Control = PanelSource
    end
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'Blue'
    Left = 48
    Top = 168
  end
end
