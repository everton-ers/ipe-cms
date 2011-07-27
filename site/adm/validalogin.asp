<% @ LANGUAGE="VBSCRIPT" %>
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
 lsLogin = replace(Request.Form ("email"),"'","''")
 lsSenha = replace(Request.Form ("senha"),"'","''")
 
%>

<!-- #include file="conexao.asp"-->

<% 
 sql = "select usuId, usuNome, usuNivel, date_format(usuUltAcess,'%d/%m/%y') usuUltAcess from tbusuario 	"
 sql = sql & " WHERE usuEmail = '" & lsLogin 
 sql = sql & "' and usuSenha = '" & lsSenha & "'"
 Set rs  = server.CreateObject ("ADODB.Recordset")
 
 rs.Open sql, conDB
  
 if not rs.EOF  then
	session("usuId")     = rs("usuId")
	session("usuNome")   = rs("usuNome") 
	session("usuNivel") = rs("usuNivel")
	session("CMS") = "IpeCMS"
	if not isdate(rs("usuUltAcess")) then
	   session("usuUltAcess") = "1º Acesso"
    else	   
	   session("usuUltAcess") = rs("usuUltAcess")
    end if	   
	data=year(date) & "-" & month(date) & "-" & day(date)
	sql="update tbusuario set usuUltAcess = now() WHERE usuId = " & rs("usuId")
	'Response.Write (sql)
	Set rs  = server.CreateObject ("ADODB.Recordset")
    rs.Open sql, conDB

        Response.Redirect ("principal.asp")	

 else
		Response.Redirect ("index.asp?status=e")	

 end if
 
 rs.Close 
 condb.close
%>		

