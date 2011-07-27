<!-- #include file="validasessao.asp"-->
<%

  Response.Buffer = true
  response.expires= -1000
  session.lcid = 1033

' On Error Resume Next
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

  idConteudo = replace(trim(request("conId")),"'","")
  if idConteudo = "" then
     response.write "Valor id de conteudo vazio, tente novamente!"
	 response.end
  end if
  if idConteudo < 1 then
     response.write "Valor id de conteudo vazio, tente novamente!"
	 response.end
  end if

    set rs = server.createobject("adodb.recordset")
    sql = "select * from tbconteudo WHERE conId = " & idConteudo
	set rs = condb.execute(sql)
	if not rs.eof then
       sql = "delete from tbconteudo WHERE conId = " & idConteudo
	   condb.execute(sql)
       response.write sql & "<br>"
	end if
	set rs=nothing
	
	sql = "select * from tbconteudo WHERE conId="&idConteudo
	set rs = condb.execute(sql)

    if rs.eof then
       msg = "Conteudo de id "&idConteudo&" excluído com sucesso."     
	else
	   msg ="Não foi excluído."
	end if
	
	'response.write msg
    response.redirect ("_site_lista_conteudo.asp")

  conDb.close
    Set conDb = nothing

%>