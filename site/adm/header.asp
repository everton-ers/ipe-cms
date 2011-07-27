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

<!-- INICIO DO HEADER -->
<table border=0  width=99%  bgcolor="" cellpadding="2" cellspacing="0" align=center>
  <TR> 
    <TD width="20%" colspan="2" height="70"> 
      <table border="0" width="100%" cellspacing="0"  cellpadding="0" bgcolor="white" >
        <tr bgcolor=""> 
          <td width="40%" valign="top" > 
		     <h3>IpêCMS </h3>
		  
		   <h3> area Gerencial </h3>
		  
		  
		  </td>
          <td valign="top"  width="60%" > 
            <div align="center"> 
            &nbsp;
            </div>
          </td>
  
        </tr>
      </table>
    </td>
  </tr>
  <% if session("USUID") <> "" then %>
  <TR  > 
    <TD  width="70%">
	
	|&nbsp;Usu&aacute;rio: <%=session("usunome")%>&nbsp;|
	ID: <%=session("usuid")%>&nbsp;|
	&Uacute;ltimo acesso:&nbsp;<%=session("usuUltAcess")%> |
	
	
	</TD>
	  
    <TD  width="30%"> 
      <p align="right">
	  
	  | <a href="javascript:history.back(-1);">Voltar</a> |
       <a href="encerrasessao.asp"> Autenticar</a> |
    
    </TD>
  </TR>
  <% else %>
  <TR  > 
    <TD  width="70%" height="2">&nbsp;</TD>
    <TD width="30%" align="right">
	  | <a href="javascript:history.back(-1);">Voltar</a> |   
	  <a href=index.asp>P&aacute;gina principal</a> |
    </TD>
  </TR>
  <% end if %>
</table>
<!-- FIM DO HEADER -->



