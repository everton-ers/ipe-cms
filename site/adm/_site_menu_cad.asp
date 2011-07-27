<%

Response.Buffer = true
Response.expires = 0

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
%>
<!-- #include file="validasessao.asp"-->
<!-- #include file="configuracao.asp"-->
<!-- #include file="conexao.asp"-->

<%
conId = request.querystring("conId")

sub erro()
	response.redirect "mensagem.asp?msg=3&meId=" & meId
	response.end
end sub

meId			= request.form("meId")
meNome          = replace(trim(request.form("meNome")),"'","")
meAtivo		= trim(request.form("meativo"))
meOrdem		= request.form("meOrdem")
metipo		= request.form("metipo")

' nao sofre alteracao
'medata	= request.form("meData")

' nao sofre alteracao
'metipo		= request.form("metipo")


if isnull(meNome) or meNome = "" then
	meNome = " "
end if

meData	= ano&"-"&mes&"-"&dia

if meId = 0 then
	sql = "Insert into tbmenusite (meNome, meAtivo, meOrdem,meData, meTipo) VALUES ('" & meNome & "','"
	sql = sql & meAtivo & "'," & meOrdem & ",NOW(),'"& meTipo &"') "
else
	sql = "UPDATE tbmenusite set meNome = '" & meNome& "',"
	sql = sql & "meAtivo = '" & meAtivo & "',"
	sql = sql & "meOrdem = '" & meOrdem & "' " 
	sql = sql & " WHERE meId = " & meId & ""
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

   	
Response.redirect "_site_lista_menu.asp"


%>