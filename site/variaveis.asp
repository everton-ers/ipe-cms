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
if instr(1,Request.ServerVariables("SCRIPT_NAME"),"variaveis.asp") > 0 then
	Response.Redirect "index.asp?erro=variaveis"
else   
	'Abre conexao com o banco de dados
	Set condb = server.createobject("ADODB.connection")
      ''bd_driver = "MySQL ODBC 5.01 Driver"
	  bd_driver = "MySQL ODBC 3.51 Driver"
	  'bd_driver = "dsn=nomeodbc"
	  bd = "ipecms"
	  bd_servidor = "localhost" '' numero IP
	  bd_usuario = "root"
	  bd_senha = ""
	   ''conDB.ConnectionString = "driver="&bd_driver&";DATABASE="&bd&";SERVER="&bd_servidor&";UID="&bd_usuario&";PASSWORD="&bd_senha
	   
	   conDB.Open("DRIVER={MySQL ODBC 3.51 Driver};SERVER="&bd_servidor&";PORT=3306;DATABASE="&bd&";USER="&bd_usuario&";PASSWORD="&bd_senha&";OPTION=3;")   
	 
     ''conDB.Open 
end if


''' texto para a barra superior no navegador ()IE, Firefox
texto_topo = "IpкCMS - O mini CMS que resolve seu problema de ъltima hora"
descricao_site = "Website de divulgaзгo do evento e congresso ..."
palavras_chave = "evento, congresso, empresa, curso, seminario"  '' separe as palavras chave por virgulas

'' texto para o rodape do website
texto_rodape_left = "Seminario Regional de Ciкncias Humanas"  '' rodape lado esquerdo
texto_rodape_right = "T & C Open Source Software" '' rodape lado direito

'''''  BARRA HORIZONTAL 
'' cor da barra horizontal 
cor_barra_horizontal = "orange"

'' MENU DE NAVEGAЗAO
'' nome do menu de navegaзгo
nome_menu = "navegaзгo"

'''''  COLUNA VERTICAL DIREITA 
cor_barra_direita = "#dfdfdf"  'cinza mais claro

'' white, black, green, blue, red, yellow
'' cor do texto na barra vertical direita
texto_cor_barra_direita = "gray"



%>