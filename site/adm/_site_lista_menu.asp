<%
	Response.buffer=true
	Response.expires = -1000
%>

<!-- #include file="validasessao.asp"-->
<!-- #include file="configuracao.asp"-->
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

	'Cria uma nova instância da classe formando um novo objeto
	set rs = Server.CreateObject("ADODB.Recordset")
	
	'Seleciona a quantidade de eventos cadastrados
	sql= "Select count(*) as 'total' from tbconteudo" 
	
	'Executa a string sql.
	set rs = conDB.execute(sql) 
	
	'Recebe o total de eventos cadastrados
	varTotal = rs("total")
	
	'Destrói o objeto
	set rs = nothing
	
	'Cria uma nova instância da classe formando um novo objeto
 	set rs = Server.CreateObject("ADODB.Recordset")
	
ordem = request.querystring("ordem")

	'Seleciona os dados dos eventos cadastrados
	sql= "Select * from tbmenusite"

    if ordem = "id" then
		sql=sql&" order by meid desc "
	elseif ordem = "titulo" then
		sql=sql&" order by meNome "
	elseif ordem = "ordem" then
		sql=sql&" order by meOrdem desc "
	elseif ordem = "tipo" then
		sql=sql&" order by meTipo desc "
	elseif ordem = "status" then
		sql=sql&" order by meAtivo desc "

	else
		sql=sql&" order by meOrdem desc "
	end if
	
	'Executa a string sql.
	set rs = conDB.execute(sql)    
	
%>

<html>
<head>
	<title><%=titlegerencial%></title>
	<link rel="STYLESHEET" type="text/css" href="layout.css">

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	
	
	<script language="javascript">
	function Excluir(meId) 
	{
		resp=confirm("Confirma exclusão do item de menu? Lembre-se que os itens de conteudo que apontam para este item de menu ficarão orfãos!");
		if (resp) 
		{   
			document.location="_site_menu_exc.asp?meId="+meId;
		}
	}
	</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<!-- #include file="header.asp"-->
<!-- #include file="barra_de_menu.asp"-->

<br>
&nbsp;&nbsp;Itens de Menu<br>
      <hr>
	<br>
&nbsp;&nbsp;Total de registros: <b><%=varTotal%></b><br>
<br>
	<table width="100%" border="0" cellspacing="1" cellpadding="3">
		<tr align="center" bgcolor="#CCCCCC">
			<td width="3%"><b><a href="?ordem=id">Id</a></b></td>
			<td width="20%"><b><a href="?ordem=titulo">Nome Menu</a></b></td>
			<td width="15%"><b><a href="?ordem=status">Situação</a></b></td>
			<td width="15%"><b><a href="?ordem=ordem">Ordem</a></b></td>
			<td width="15%"><b><a href="?ordem=tipo">Tipo</a></b></td>
			<td width="12%"><center><b><input type=button value=" : INCLUIR : " onClick="location='_site_menu.asp'"></b></center></td>
		</tr>
<%		
		
	'Executa enquanto não for final de arquivo
	while not rs.eof
		
		meId			= rs("meId") 
		meNome		= replace(trim(rs("meNome")),"'","")
		meAtivo		= rs("meAtivo")
		meOrdem			= rs("meOrdem")
		meTipo			= rs("meTipo")


		dia = day(meData)
		mes = month(meData)
		ano = year(meData)
		
		if dia < 10 then
			dia = "0" & dia
		end if
		if mes < 10 then
			mes = "0" & mes
		end if

		conData = dia &" / "& mes &" / "& ano
		
	'Verificação de IF do Botão RADIO
		if cor_tr = "#eeeeee" then
			cor_tr="#dfdfdf"
		else
			cor_tr="#eeeeee"
		end if



		if meAtivo = "S" then
			meAtivo = "Ativo"
			cor = "green"
		else
			meAtivo = "Inativo"
			cor = "red"
		end if
	'Fim da verificação do Botão RADIO


%>		
		<tr align="center" bgcolor="<%=cor_tr%>">
			<td>&nbsp;<%=meId%>&nbsp;</td>
			<td>&nbsp;<a href="_site_menu.asp?meId=<%=meId%>"><%=meNome%></a>&nbsp;</td>
			
			<td align="center">&nbsp;<%=meAtivo%>&nbsp;</td>
			<td>&nbsp;<%=meOrdem%>&nbsp;</td>
		<td>&nbsp;<%=meTipo%>&nbsp;</td>
			<td><center>
			
			<%
			  ' tipo de item de menu OUTROS nao pode ser alterado nem excluido 
			  
			  if (meTipo="LINK" or meTipo="CABECALHO") then
			  
			     '' mostra nada
				 
			  else
			%>
			
			<a href="_site_menu.asp?meId=<%=meId%>">Alterar</a>&nbsp;&nbsp;&nbsp;

			<% 
			 end if
			
			
			 '' Tipos de Itens de Menu = (RIGHt, LINK e CABECALHO) nao podem ser excluidos
			if (meTipo="RIGHT" or meTipo="CABECALHO" OR meTipo="LINK") OR meId = 1 then %>
			
			<%else%>
			
			<a href="javascript:Excluir(<%=rs("meId")%>)">Excluir</a>
			<%end if%>
			
			</center>
			</td>
		</tr>

<%		
		'Move para o próximo registro.
		rs.movenext

	wend
%> 

	</table><br><br>
</body>
</html>

<% 
	
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

%>