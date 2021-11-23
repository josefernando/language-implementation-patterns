Attribute VB_Name = "GEMGVK01"
' =================================================== 
' COMENTARIO SOX 
' NOME : GEMGVK01.BAS
' VERSAO : 1
' =================================================== 
Option Explicit
' ==================================================================
' Observações:
' ************
' Antigo GEMOVK01.BAS proveniente do WIN95/CONVERSOR e do SCXT94CTO
' Pode ser utilizada com as camadas VBSQL02.DLL e IX2CGGCN001.DLL e
' 		pode ser usada para desenvolver Projetos Batch e Online
' ------------------------------------------------------------------
' Dependencias: 
'	Componente:
'	Modulos: 
' ==================================================================


'Aqui estão as variáveis essenciais para a Nova Camada de Acessoa Dados

'*** Variáveis públicas utilizadas na conexão Sybase
Public SqlConn As Integer
Public Usuario As String            'String contendo o Usuário corrente
Public ServerName As String         'Nome do servidor conectado

'*** Identificadores de Servidores para conexão
Public Const SERV_MASCORP_ID = 2    'Servidor Massa/Corporativo
Public Const SERV_MANUAPO_ID = 3    'Servidor Manutenção Tabela de Apoio
Public Const SERV_CONSAPO_ID = 4    'Servidor Consulta Tabela de Apoio /Pessoa/Proposta

' indicadores de servidores usados no SU_Conecta_Verifica - novas constantes
Public Const ID_SIE = 1            'Servidor Sie
Public Const ID_PROD10 = 2         'Servidor Prod10
Public Const ID_PROD20 = 3         'Servidor Prod20
Public Const ID_PROD30 = 4         'Servidor Prod30
Public Const ID_GESTAO = 5         'Servidor Gestão
Public Const ID_EDGE = 6           'Servidor Edge
Public Const ID_PROD40 = 7         'Servidor Prod40
Public Const ID_PROD50 = 8         'Servidor Prod50
Public Const ID_WEB10 = 9          'Servidor Web50
Public Const ID_DEPTO1 = 10        'Servidor Depto1
Public Const ID_EASYPH = 12        'Servidor CTI (Easyphone)
Public Const ID_IQ01 = 14          'Servidor Sybase IQ
Public Const ID_WEB30 = 22         'Servidor Web30
Public Const ID_WEB40 = 23         'Servidor Web40
Public Const ID_WEB50 = 24         'Servidor Web50

'*** Identificadores de servidores para conexão utilizando Network Packet Size
'*** default do ambiente.
'*** Raise Erros = Warnings Only
'*** Print Statements = Warnings Only
Public Const SERV_SIE_ID = 1       'Servidor Sie
Public Const SERV_PROD10_ID = 2    'Servidor Massa/Corporativo
Public Const SERV_PROD20_ID = 3    'Servidor Manutenção Tabelas de Apoio
Public Const SERV_PROD30_ID = 4    'Servidor Consulta Tabelas de Apoio /Pessoa/Proposta
Public Const SERV_GESTAO_ID = 5    'Servidor Gestão
Public Const SERV_EDGE_ID = 6      'Servidor Edge
Public Const SERV_PROD40_ID = 7    'Servidor Prod40
Public Const SERV_PROD50_ID = 8    'Servidor Prod50
Public Const SERV_WEB10_ID = 9     'Servidor Web10
Public Const SERV_DEPTO1_ID = 10   'Servidor Depto1
Public Const SERV_EASYPH_ID = 12   'Servidor CTI (Easyphone)
Public Const SERV_IQ01_ID = 14     'Servidor Sybase IQ
Public Const SERV_WEB30_ID = 22    'Servidor Web30
Public Const SERV_WEB40_ID = 23    'Servidor Web40
Public Const SERV_WEB50_ID = 24    'Servidor Web50

'*** Constantes utilizados na execução de funções de acesso ao Banco de Dados
Public Const SUCCEED = 1           'Execução com sucesso
Public Const FAIL = 0              'Execução com erro
Public Const NOMORERESULTS = 2     'Não existe resultados (Sqlresults)
Public Const NOMOREROWS = -2       'Não existem mais linhas no buffer
Public Const SQLRPCRETURN = 1      'Indicador do tipo de parâmetro (parâmetro de retorno)

'*** Constantes para tipos de parâmetros (adaptado para CT-Library)
Public Const CS_ILLEGAL_TYPE = -1
Public Const SQLCHAR = 0
Public Const SQLBINARY = 1
Public Const SQLTEXT = 4
Public Const SQLIMAGE = 5
Public Const SQLINT1 = 6
Public Const SQLINT2 = 7
Public Const SQLINT4 = 8
Public Const SQLFLT4 = 9
Public Const SQLFLT8 = 10
Public Const SQLBIT = 11
Public Const SQLDATETIME = 12
Public Const SQLDATETIM4 = 13
Public Const SQLMONEY = 14
Public Const SQLMONEY4 = 15
Public Const SQLNUMERIC = 16
Public Const SQLDECIMAL = 17
Public Const SQLVARCHAR = 18
Public Const SQLVARBINARY = 19

Public Const IQBIGINT As Integer = 101
Public Const IQBINARY As Integer = 102
Public Const IQBIT As Integer = 103
Public Const IQCHAR As Integer = 104
Public Const IQDATE As Integer = 105
Public Const IQDATETIME As Integer = 106
Public Const IQDECIMAL As Integer = 107
Public Const IQDOUBLE As Integer = 108
Public Const IQFLOAT As Integer = 109
Public Const IQINTEGER As Integer = 111
Public Const IQMONEY As Integer = 114
Public Const IQNUMERIC As Integer = 115
Public Const IQREAL As Integer = 117
Public Const IQSMALLDATETIME As Integer = 118
Public Const IQSMALLINT As Integer = 119
Public Const IQSMALLMONEY As Integer = 120
Public Const IQTIME As Integer = 123
Public Const IQTIMESTAMP As Integer = 124
Public Const IQTINYINT As Integer = 125
Public Const IQUNSIGNEDBIGINT As Integer = 128
Public Const IQUNSIGNEDINT As Integer = 129
Public Const IQVARBINARY As Integer = 131
Public Const IQVARCHAR As Integer = 132

''*** The severity levels are defined here for error handlers
Public Const EXINFO = 1
Public Const EXUSER = 2
Public Const EXNONFATAL = 3
Public Const EXCONVERSION = 4
Public Const EXSERVER = 5
Public Const EXTIME = 6
Public Const EXPROGRAM = 7
Public Const EXRESOURCE = 8
Public Const EXCOMM = 9
Public Const EXFATAL = 10
Public Const EXCONSISTENCY = 11

'***
'*** Variáveis públicas utilizadas na conexão Sybase
'***
Public DBLIB_VERSION As String    'Versão da DBLibrary
Public LoginId       As String    'login para conexão no crystal
Public Password      As String    'password para conexão no crystal
Public DatabaseName  As String    'nome do database corrente
Public SqlStatus     As Integer   'Status de uma operação SQL
Public ID_Aplic      As String    'Identificador do tipo da aplicação
Public OpenConErr    As String

Public Const LoginTimeout% = 15   'Timeout para login
Public Const QueryTimeout% = 100  'Timeout para query

'***
'*** Variáveis públicas para tratamento de erro
'***
Public Err_Syb       As Long       'Código Erro DBLibrary
Public ErrSev_Syb    As Integer    'Severidade Erro DBLibrary
Public ErrStr_Syb    As String     'Descrição Erro DBLibrary
Public Msg_Syb       As Long       'Código Erro SQL SERVER
Public MsgSev_Syb    As Integer    'Severidade Erro SQL SERVER
Public MsgStr_Syb    As String     'Descrição Erro SQL SERVER
Public ErrExec       As Integer    'Código de erro de execução de projeto
Public Const CG_MENSAGEM_PADRAO = "Anote a mensagens a seguir e contate o analista responsável."

'***
'*** Variáveis públicas para autorização
'***
Public Permissoes()      As String    ' Array contendo as permissões
'Public Parametros       As String    ' String contendo os parâmetros de conexão
Public Grupo_Usuario     As String    ' String contendo o Grupo do Usuário corrente
Public Servidores()      As String    ' Array contendo os servidores da rede conectados
'Public Carrega          As Integer   ' Flag de verificação da abertura de conexão
'Public Projeto_Anterior As String    ' Identificação do Projeto Anterior
Public Param_Int         As String    ' Parametros internos da aplicação


''***
''*** Constantes utilizados na execução de funções da DBlibrary/CtLibrary
''***
'Public Const MOREROWS As Integer = -1  'Existem mais linhas no buffer
Public Const REGROW  As Integer = -1    'Não existem mais linhas no buffer
Public Const SQLRPCRECOMPILE% = 0       'Indicador de recompilação da proc na execução
'Public Const INTEXIT% = 0              'Return status em tratamento de erro
'Public Const INTCONTINUE% = 1          'Return status em tratamento de erro
'Public Const INTCANCEL% = 2            'Return status em tratamento de erro

' Error numbers VBSQL error codes that are passed
' to local error handler
Public Const SQLEMEM% = 10000
Public Const SQLENULL% = 10001
Public Const SQLENLOG% = 10002
Public Const SQLEPWD% = 10003
Public Const SQLECONN% = 10004
Public Const SQLEDDNE% = 10005
Public Const SQLNULLO% = 10006
Public Const SQLESMSG% = 10007
Public Const SQLEBTOK% = 10008
Public Const SQLENSPE% = 10009
Public Const SQLEREAD% = 10010
Public Const SQLECNOR% = 10011
Public Const SQLETSIT% = 10012
Public Const SQLEPARM% = 10013
Public Const SQLEAUTN% = 10014
Public Const SQLECOFL% = 10015
Public Const SQLERDCN% = 10016
Public Const SQLEICN% = 10017
Public Const SQLECLOS% = 10018
Public Const SQLENTxT% = 10019
Public Const SQLEDNTa = 10020
Public Const SQLETMTD% = 10021
Public Const SQLEASEC% = 10022
Public Const SQLENTLL% = 10023
Public Const SQLETIME% = 10024
Public Const SQLEWRIT% = 10025
Public Const SQLEMODE% = 10026
Public Const SQLEOOB% = 10027
Public Const SQLEITIM% = 10028
Public Const SQLEDBPS% = 10029
Public Const SQLEIOPT% = 10030
Public Const SQLEASNL% = 10031
Public Const SQLEASUL% = 10032
Public Const SQLENPRM% = 10033
Public Const SQLEDBOP% = 10034
Public Const SQLENSIP% = 10035
Public Const SQLECNULL% = 10036
Public Const SQLESEOF% = 10037
Public Const SQLERPND% = 10038
Public Const SQLECSYN% = 10039
Public Const SQLENONET% = 10040
Public Const SQLEBTYP% = 10041
Public Const SQLEABNC% = 10042
Public Const SQLEABMT% = 10043
Public Const SQLEABNP% = 10044
Public Const SQLEBNCR% = 10045
Public Const SQLEAAMT% = 10046
Public Const SQLENXID% = 10047
Public Const SQLEIFNB% = 10048
Public Const SQLEKBCO% = 10049
Public Const SQLEBBCa = 10050
Public Const SQLEKBCa = 10051
Public Const SQLEBCWE% = 10052
Public Const SQLEBCNN% = 10053
Public Const SQLEBCOR% = 10054
Public Const SQLEBCPa = 10055
Public Const SQLEBCPN% = 10056
Public Const SQLEBCPB% = 10057
Public Const SQLEVDPT% = 10058
Public Const SQLEBIVa = 10059
Public Const SQLEBCBC% = 10060
Public Const SQLEBCFO% = 10061
Public Const SQLEBCVH% = 10062
Public Const SQLEBCUO% = 10063
Public Const SQLEBUOE% = 10064
Public Const SQLEBWEF% = 10065
Public Const SQLEBTMT% = 10066
Public Const SQLEBEOF% = 10067
Public Const SQLEBCSa = 10068
Public Const SQLEPNUL% = 10069
Public Const SQLEBSKERR% = 10070
Public Const SQLEBDIO% = 10071
Public Const SQLEBCNT% = 10072
Public Const SQLEMDBP% = 10073
Public Const SQLEINIT% = 10074
Public Const SQLCRSINV% = 10075
Public Const SQLCRSCMD% = 10076
Public Const SQLCRSNOIND% = 10077
Public Const SQLCRSDIS% = 10078
Public Const SQLCRSAGR% = 10079
Public Const SQLCRSORD% = 10080
Public Const SQLCRSMEM% = 10081
Public Const SQLCRSBSKEY% = 10082
Public Const SQLCRSNORES% = 10083
Public Const SQLCRSVIEW% = 10084
Public Const SQLCRSBUFR% = 10085
Public Const SQLCRSFROWN% = 10086
Public Const SQLCRSBROL% = 10087
Public Const SQLCRSFRAND% = 10088
Public Const SQLCRSFLAST% = 10089
Public Const SQLCRSRO% = 10090
Public Const SQLCRSTAB% = 10091
Public Const SQLCRSUPDTAB% = 10092
Public Const SQLCRSUPDNB% = 10093
Public Const SQLCRSVIIND% = 10094
Public Const SQLCRSNOUPD% = 10095
Public Const SQLCRSOS2% = 10096
Public Const SQLEBCSI% = 10097
Public Const SQLEBCRO% = 10098
Public Const SQLEBCNE% = 10099
Public Const SQLEBCSK% = 10100

