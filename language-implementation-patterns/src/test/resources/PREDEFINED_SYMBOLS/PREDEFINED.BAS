Attribute VB_Name = "PREDEFINED_SYMBOLS"

PreDefined Lib Spin
PreDefined Class Spin.SpinButton
EndPreDefined
EndPreDefined

PreDefined Lib IX2DPDLVBC01
PreDefined Class IX2DPDLVBC01.ProcessoDeploy
EndPreDefined
EndPreDefined

Public Enum FormShowConstants
	vbModal = 1
	vbModeless = 0
End Enum

Public Enum VbAppWinStyle
	vbHide = 0
	vbMaximizedFocus = 3
	vbMinimizedFocus = 2
	vbMinimizedNoFocus = 6
	vbNormalFocus = 1
	vbNormalNoFocus = 4 
End Enum

Public Enum VbCalendar
	vbCalGreg= 0
	vbCalHijri = 1
End Enum

Public Enum VbCallType
	vbGet = 2
	vbLet = 4
	vbMethod = 1
	vbSet = 8
End Enum

Public Enum VbCompareMethod
	vbBinaryCompare = 0
	vbTextCompare = 1
End Enum

Public Enum VbDateTimeFormat
	vbGeneralDate = 0
	vbLongDate = 1
	vbLongTime = 3
	vbShortDate = 2
	vbShortTime = 4
End Enum

Public Enum VbDayOfWeek
	vbFriday = 6
	vbMonday = 2
	vbSaturday = 7
	vbSunday = 1
	vbThursday = 5
	vbTuesday = 3
	vbUseSystemDayOfWeek = 0
	vbWednesday = 4
End Enum

Public Enum VbFileAttribute
	vbNormal = 0 		'Specifies files with no attributes.
	vbReadOnly = 1 	  	'Specifies read-only files.
	vbHidden = 2 		'Specifies hidden files.
	VbSystem = 4 		'Specifies system files.
	vbVolume = 8 		'Specifies volume label; if any other attributed is specified, vbVolume is ignored
	vbDirectory = 16 	'Specifies directories or folders.
	vbArchive = 32 		'Specifies files that have changed since the last backup.
	vbAlias = 64 		'Specifies file aliases on platforms that support them.
End Enum 

Public Enum VbFirstWeekOfYear
	vbFirstFourDays = 2
	vbFirstFullWeek = 3
	vbFirstJan1 = 1
	vbUseSystem = 0
End Enum

Public Enum VbIMEStatus
	vbIMEAlphaDbl = 7
	vbIMEAlphaSng = 8
	vbIMEDisable = 3
	vbIMEHiragana = 4
	vbIMEKatakanaDbl = 5
	vbIMEKatakanaSng = 6
	vbIMEModeAlpha = 8
	vbIMEModeAlphaFull = 7
	vbIMEModeDisable = 3
	vbIMEModeHangul = 10
	vbIMEModeHangulFull = 9
	vbIMEModeHiragana = 4
	vbIMEModeKatakana = 5
	vbIMEModeKatakanaHalf = 6
	vbIMEModeNoControl = 0
	vbIMEModeOff = 2
	vbIMEModeOn = 1
	vbIMENoOp = 0
	vbIMEOff = 2
	vbIMEOn = 1
End Enum

Public Enum VbMsgBoxResult
	vbAbort = 3
	vbCancel = 2
	vbIgnore = 5
	vbNo = 7
	vbOK = 1
	vbRetry = 4
	vbYes = 6
End Enum

Public Enum VbMsgBoxStyle
	vbAbortRetryIgnore = 2
	vbApplicationModal = 0
	vbCritical = 16
	vbDefaultButton1 = 0
	vbDefaultButton2 = 256
	vbDefaultButton3 = 512
	vbDefaultButton4 = 768
	vbExclamation =  48
	vbInformation  = 64
	vbMsgBoxHelpButton = 16384
	vbMsgBoxRight  = 524288
	vbMsgBoxRtlReading = 1048576
	vbMsgBoxSetForeground = 65536
	vbOKCancel = 1
	vbOKOnly = 0
	vbQuestion = 32
	vbRetryCancel = 5
	vbSystemModal = 4096
	vbYesNo = 4
	vbYesNoCancel = 3
End Enum

Public Enum VbQueryClose
	vbAppTaskManager = 3
	vbAppWindows  = 2
	vbFormCode = 1
	vbFormControlMenu = 0
	vbFormMDIForm  = 4
End Enum

Public Enum VbStrConv
	vbFromUnicode = 128
	vbHiragana = 32
	vbKatakana = 16
	vbLowerCase = 2
	vbNarrow = 8
	vbProperCase = 3
	vbUnicode = 64
	vbUpperCase = 1
	vbWide = 4
End Enum 

Public Enum VbTriState
	vbFalse = 0
	vbTrue = -1
	vbUseDefault = -2 
End Enum

Public Enum VbVarType
	vbArray = 8192
	vbBoolean = 11
	vbByte = 17
	vbCurrency = 6
	vbDataObject = 13
	vbDate = 7
	vbDecimal = 14
	vbDouble = 5
	vbEmpty = 0
	vbError = 10
	vbInteger = 2
	vbLong = 3
	vbLongLong = 20 
	vbNull = 1
	vbObject = 9
	vbSingle = 4
	vbString = 8
	vbUserDefinedType = 36
	vbVariant   = 12
End Enum

Public Enum ColorConstants 
	vbBlack = 0
	vbBlue = 16711680
	vbCyan = 16776960
	vbGreen = 65280
	vbMagenta = 16711935
	vbRed = 255
	vbWhite = 16777215
	vbYellow = 65535
End Enum
