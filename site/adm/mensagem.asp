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

%>

<!-- #include file="configuracao.asp"-->
<HTML><HEAD><TITLE><%=titlegerencial%></TITLE>

<link rel="STYLESHEET" type="text/css" href="layout.css">
</HEAD>
<BODY aLink=#ff0000 bgColor=#FFFFFF leftMargin=0 link=#000000 text=#000000 topMargin=0
vLink=#000000 marginheight="0" marginwidth="0" >

<!-- #include file="header.asp"-->
<!-- #include file="barra_de_menu.asp"-->

<%
   msg=Request.querystring ("msg")
   select case msg
		  case "9":  msg="Não disponível no momento."

		  case "18": msg="Sua sessão expirou. <a href=""index.asp"">Autentique-se novamente</a>, por favor."
		  case "20": msg="Preenchimento de campo obrigatório."
		  case "96": msg="Não disponível no momento."
		  case "98": msg="Acesso não permitido."
		  case "99": msg="Erro de gravação no banco de dados. Favor tentar novamente."
   end  select
%>

<TABLE border=0 cellPadding=0 cellSpacing=1 width="100%">
  <TBODY>
  <TR>
    <TD vAlign=top ></TD>
    <TD vAlign=top > </TD>
  </TR>
  <TR>
    <TD vAlign=top >&nbsp;</TD>
    <TD ><br>
      Aviso do sistema</font><br>
      <hr>
    </TD>
  </TR>
  <TR>
    <TD vAlign=top >&nbsp;</TD>
    <TD ><br>
      <%=msg%>
     </font>
     </TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>
    </HTML>
