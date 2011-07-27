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

<table style="width: 790px; height: 100px;" border="0" cellpadding="0" cellspacing="0">

  <tbody>

    <tr>
      
    <td width="234"><a href="index.asp">
	<img alt="<%=nome_evento%>" src="imagem/logotipo.png" border="0" /></a>
	</td>
      <td>
<div style="text-align: center;" id="anp"><br />
<%

	   ' conteudo respondendo ao clicar no menu
	   ' conCategoria =2 é CABECALHO
		sql = "select conTexto from tbconteudo WHERE conCategoria =2 and conAtivo='S' order by conData desc"
		set conteudo =condb.execute(sql)
		while not conteudo.eof
		   texto  = conteudo("conTexto")
		   response.write texto
		conteudo.movenext
		wend
%>

      </td>

      <td width="10">&nbsp;</td>

    </tr>

    <tr>

      <td></td>

    </tr>

  </tbody>
</table>

