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
  
  <td id="rightcolumn" >
      <div style='padding: 3px; background-color: <%=cor_barra_direita%>; color: <%=texto_cor_barra_direita%>; font-weight: bold;'>
	  
	  
	  
	  <%'=nome_barra_direita%> 
	  
	  <%
	  
	   ' somente o item de menu id 3 e tipo = RIGHT
	   ' padrao = AVISOS
	   sql ="Select meNome from tbmenusite WHERE meTipo = 'RIGHT' and meId= 3"


       set rs=condb.execute(sql)
       while not rs.eof   
	      nome_barra_direita = trim(rs("meNome"))
		  response.write  nome_barra_direita
	   rs.movenext
       wend
	   
	   
	  
	  %>
	  
	  
	  
	  </div>
    
<%

   sql ="Select conTexto from tbconteudo c "
   sql=sql&" inner join tbmenusite s on (c.conCategoria=s.meId) "
   sql=sql&" WHERE meTipo='RIGHT' and meAtivo ='S' and conAtivo='S' order by conData desc"

   set rs_d=condb.execute(sql)
     while not rs_d.eof
%>

<%=rs_d("conTexto")%>

<%  rs_d.movenext
    wend

	set rs_d = nothing
%>

  </td>
