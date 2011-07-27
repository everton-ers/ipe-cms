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
	sql= "Select * from tbconteudo"

    if ordem = "id" then
		sql=sql&" order by conid desc "
	elseif ordem = "titulo" then
		sql=sql&" order by contitulo "
	elseif ordem = "data" then
		sql=sql&" order by conData desc "
	elseif ordem = "categoria" then
		sql=sql&" order by conCategoria "
	elseif ordem = "destaque" then
		sql=sql&" order by condestaque desc "
	elseif ordem = "status" then
		sql=sql&" order by conAtivo desc "
	elseif ordem = "fonte" then
		sql=sql&" order by conFonte "
	else
		sql=sql&" order by conId desc "
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
	<!--//
	function Excluir(conId) 
	{
		resp=confirm("Confirma exclusão do conteúdo e todos os seus dados?");
		if (resp) 
		{   
			document.location="_site_conteudo_exc.asp?conId="+conId;
		}
	}
	//-->
	</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- #include file="header.asp"-->
<!-- #include file="barra_de_menu.asp"-->
	
	<br>
&nbsp;&nbsp;Itens de Conteúdo<br>
      <hr>
	<br>
&nbsp;&nbsp;Total de registros: <b><%=varTotal%></b><br>
<br>
	<table width="100%" border="0" cellspacing="1" cellpadding="3">
		<tr align="center" bgcolor="#CCCCCC">
			<td width="5%"><b><a href="?ordem=id">Id</a></b></td>
			<td width="30%"><b><a href="?ordem=titulo">Título</a></b></td>
			<td width="10%"><b><a href="?ordem=categoria">Item Menu</a></b></td>
			<td width="5%"><b>URL</b></td>
			<td width="10%"><b><a href="?ordem=data">Data</a></b></td>
			<td width="5%"><b><a href="?ordem=fonte">Fonte</a></b></td>
			<!--<td width="5%"><b><a href="?ordem=destaque">Destaque</a></b></td> -->
			<td width="5%"><b><a href="?ordem=status">Situação</a></b></td>
			<td width="10%"><center><b><input type=button value=" : INCLUIR : " onClick="location='_site_conteudo.asp'"></b></center></td>
		</tr>

<%		
		
	'Executa enquanto não for final de arquivo
	while not rs.eof
		
		conId			= rs("conId") 
		conTitulo		= replace(trim(rs("conTitulo")),"'","")
		conFonte		= rs("conFonte")
		conData			= rs("conData")
		conCategoria	= rs("conCategoria")
		conDestaque		= rs("conDestaque")
		conAtivo		= rs("conAtivo")

		dia = day(conData)
		mes = month(conData)
		ano = year(conData)
		
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

        categoria = rs("conCategoria")

		if conDestaque = "S" then
			conDestaque = "Sim"
			cor= "green"
		else
			conDestaque = "Não"
		end if

		if conAtivo = "S" then
			conAtivo = "Ativo"
			cor = "green"
		else
			conAtivo = "Inativo"
			cor = "red"
		end if
	'Fim da verificação do Botão RADIO
    if conCategoria = "" or isNull(conCategoria) then
	   conCategoria = 0
	end if

	sql = "Select meNome from tbmenusite WHERE meId ="&conCategoria
	'response.write sql
	'response.end
	set r = condb.execute(sql)
	    
		menu = ""
		if not r.eof then
           menu = r("meNome")
		end if

%>		
		<tr align="center" bgcolor="<%=cor_tr%>">
			<td>&nbsp;<%=conId%>&nbsp;</td>
			<td align=left>&nbsp;<a href="_site_conteudo.asp?conId=<%=conId%>"><%=conTitulo%></a>&nbsp;</td>
			
			<td>&nbsp;<font color="<%=cor%>"><%=menu%></font>&nbsp;</td>
			

			<td align="center"><font face=arial size=1>?page=<%=conCategoria%>&menu=<%=menu%>&id_conteudo=<%=conId%></font>
			</td>
			
			<td align="center">&nbsp;<%=conData%>&nbsp;</td>
			<td align="center">&nbsp;<%=conFonte%>&nbsp;</td>
			<!--<td>&nbsp;<font color="<%=cor%>"><%=conDestaque%></font>&nbsp;</td>-->
			<td>&nbsp;<font color="<%=cor%>"><%=conAtivo%></font>&nbsp;</td>
			<td><center><a href="_site_conteudo.asp?conId=<%=conId%>">Alterar</a>&nbsp;&nbsp;&nbsp;
			<a href="javascript:Excluir(<%=rs("conId")%>)">Excluir</a></center>
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

	condb.close

	set condb = nothing

%>