<%

Response.Buffer = true
Response.expires = 0

%>

<!-- #include file="validasessao.asp"-->
<!-- #include file="conexao.asp"-->

<%
 '   This file is part of IpeCMS.

 '   IpeCMS is free software: you can redistribute it and/or modify
  '  it under the terms of the GNU General Public License as published by
 '   the Free Software Foundation, either version 3 of the License, or
 '   (at your option) any later version.

 '   IpeCMS is distributed in the hope that it will be useful,
 '   but WITHOUT ANY WARRANTY; without even the implied warranty of
 '   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 '   GNU General Public License for more details.

'    You should have received a copy of the GNU General Public License
'    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

'    IpeCMS
'    http://ipecms.tconibo.com
' 

conId = request.querystring("conId")

sub erro()
	response.redirect "_site_conteudo_cad.asp?msg=Erro&conId=" & conId
end sub

conId			= request.form("conId")
conTitulo       = replace(trim(request.form("conTitulo")),"'","")
conFonte		= replace(trim(request.form("conFonte")),"'","")
conTexto		= replace(trim(request.form("rte1")),"'","")
dia				= replace(trim(request.form("dia")),"'","")
mes				= replace(trim(request.form("mes")),"'","")
ano				= replace(trim(request.form("ano")),"'","")
conCategoria	= request.form("conCategoria")

conDestaque		= request.form("conDestaque")
conAtivo		= request.form("conAtivo")

if isnull(conTexto) or conTexto = "" then
	conTexto = " "
end if

conData	= ano&"-"&mes&"-"&dia

if conId = 0 then
	sql = "Insert into tbconteudo (conTitulo, conFonte, conTexto,conData, conCategoria, conDestaque, conAtivo) VALUES ('" & conTitulo & "','"
	sql = sql & conFonte & "','" & conTexto & "','"& conData & "','"& conCategoria &"','"& conDestaque &"','" & conAtivo & "') "
else
	sql = "UPDATE tbconteudo set conTitulo = '" & conTitulo & "',"
	sql = sql & "conFonte = '" & conFonte & "',"
	sql = sql & "conTexto = '" & conTexto & "'," 
	sql = sql & "conData = '" & conData & "',"
	sql = sql & "conCategoria = '" & conCategoria & "',"
	sql = sql & "conDestaque = '" & conDestaque & "',"
	sql = sql & "conAtivo = '" & conAtivo & "' "
	sql = sql & " WHERE conId = " & conId & ""
end if

set rs = Server.CreateObject("ADODB.Recordset")
conDB.execute(sql)

'Verifica se existe o objeto
if not rs is nothing then
	'Verifica se o objeto está aberto
	if rs.State = 1 then	
		'Fecha o Objeto
		rs.Close 
	end if
end if
	
'Fecha a conexão com o banco de dados
condb.close

'Destrói o objeto
set condb = nothing

   	
Response.redirect "_site_lista_conteudo.asp"


%>