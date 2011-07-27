
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


    pagina = trim(request.querystring("page"))
	menu = request.querystring("menu")
	id_conteudo = request.querystring("id_conteudo")
    if pagina = "" then
       pagina = 1  ' Home
	end if
  

%>

	 <td> 
	 
	 <table id="centro">
	 <tr> <td>
	     		
<% 
		 
    ' link para conteudos fora do menu --> ?page=15&menu=Outros&id_conteudo=1


    if id_conteudo > 0 then 'acessa unicamente o conteudo do id
        id_conteudo = request.querystring("id_conteudo")
		sql = "select conTexto from tbconteudo WHERE conId="&id_conteudo&" and conAtivo='S' "
		set conteudo =condb.execute(sql)
		if not conteudo.eof then
		   texto  = conteudo("conTexto")
	       response.write texto	
	    end if
	else
	   ' conteudo respondendo ao clicar no menu
		sql = "select conTexto from tbconteudo WHERE conCategoria ='"&pagina&"' and conAtivo='S' order by conData desc"
		set conteudo =condb.execute(sql)
		while not conteudo.eof
		   texto  = conteudo("conTexto")
		   response.write texto
		conteudo.movenext
		wend
	end if
	
		set conteudo=nothing

 
		  if texto = "" then

              response.write "<br> <b> BREVE</b>"

		
           end if
		
   %>
		 </td></tr></table>

	</td>


