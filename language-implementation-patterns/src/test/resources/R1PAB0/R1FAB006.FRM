VERSION 5.00
Begin VB.Form R1FAB006 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   Caption         =   "Impressão de Tela"
   ClientHeight    =   1275
   ClientLeft      =   2220
   ClientTop       =   1695
   ClientWidth     =   3585
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1275
   ScaleWidth      =   3585
   Visible         =   0   'False
   Begin VB.PictureBox pi_imp_tla 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   720
      ScaleHeight     =   585
      ScaleWidth      =   1905
      TabIndex        =   0
      Top             =   600
      Visible         =   0   'False
      Width           =   1935
   End
End
Attribute VB_Name = "R1FAB006"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ********************** Impressão de Tela **********************

Option Explicit

