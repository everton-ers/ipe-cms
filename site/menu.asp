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
   
   <td id="leftcolumn">
  

		<table border="0" cellpadding="0" cellspacing="0" width="140">
             <tbody>

             <%
				set menu = server.createobject("adodb.recordset")
                sql = "select * from tbmenusite WHERE meAtivo='S' and meTipo='LEFT' order by meOrdem"
				set menu = condb.execute(sql)
				   while not menu.eof
			 %>

             <tr> 
               <td height="22" valign="top"> 
			   <strong><font size="1">| 
                 <a href="?page=<%=menu("meId")%>&menu=<%=menu("meNome")%>"><%=menu("meNome")%></a></font> </strong>
			    </td>
             </tr>
             <%
				   menu.movenext
				   wend

                   set menu = nothing
			 %>

           </tbody>
        </table>

	<br>

	<%
	    ' caixa de login para area de usuario
        '' server.execute "__caixa_login.asp"
	%>

</td>

