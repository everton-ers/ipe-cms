<% 

Response.Buffer  = true
Response.expires = 0

%>

<!-- #include file="validasessao.asp"-->
<!-- #include file="conexao.asp"-->
<!-- #include file="configuracao.asp"-->

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

	'Recebe o código do item de menu
	meId = request.querystring("meId")
		
		'Cria uma nova instância da classe formando um novo objeto
		set rs = Server.CreateObject("ADODB.Recordset")

	if (trim(meId) = "") then
		meId = 0
	end if	  
    
	Function DataDDMMAAAA(DataT)

		if DataT <> "" then	
			
			dia = day(DataT)
			mes = month(DataT)
			
			if dia < 10 then
				dia = "0" & dia
			end if
			
			if mes < 10 then
				mes = "0" & mes
			end if
			
			DataDDMMAAAA = dia & "/" & mes & "/" & Year(DataT)

		else
			DataDDMMAAAA = ""
		end	if
	
	End Function


	if (meId <> 0) then

		'Seleciona os dados 
		sql= "Select *, ifnull(meNome,' ') as meNome, meAtivo, meOrdem, meData, meTipo from tbmenusite WHERE meId = " & meId & " "
		'Executa a string sql.
		
		'response.write sql
		'response.end
		set rs = conDB.execute(sql)

		'Verifica se não é final de arquivo.	
		if not rs.eof then

		'response.write ">"&rs("conFonte")&"<"
		'response.end
			
			meId			= rs("meId") 
			meNome		    = replace(trim(rs("meNome")),"'","`")
			meData			= rs("meData")
			meAtivo	        = rs("meAtivo")
			meOrdem		    = rs("meOrdem")
			meTipo		    = rs("meTipo")


			dia = day(meData)
			mes = month(meData)
			ano = year(meData)
			if dia < 10 then
				dia = "0" & dia
			end if
			if mes < 10 then
				mes = "0" & mes
			end if

		end if

	end if
%>

<HTML>
<HEAD>
	<TITLE><%=titlegerencial%></TITLE>
	<script language="JavaScript" type="text/javascript" src="richtext.js"></script>

<script language=javascript>
		<!--//

	function verifica_frm() 
		
   {

		vrm = document.frmconteudo;
		
		if (vrm.conTitulo.value =='')   {
				alert('Necessário preencher o Título!')
				vrm.conTitulo.focus();
				return false;
			}

				updateRTE('rte1');


		if (vrm.conFonte.value =='') 
			{
				alert('Necessário preencher a Fonte da Notícia!')
				vrm.conFonte.focus();
				return false;
			}


		//alert("rte1 = " + vrm.rte1.value);
   
    if (vrm.rte1.value == "") {
             alert('Por favor, digite a descrição');
              //document.form1.ret1.focus();
              return false;
       } 



		// Início da validação do campo DATA
		if (document.frmconvidados.dia.value == '')
			{
				alert('O DIA é requerido!');
				document.frmconvidados.dia.focus();
				return false;
			}


		if (document.frmconvidados.mes.value == '')
			{
				alert('O MÊS é requerido!');
				document.frmconvidados.mes.focus();
				return false;
			}


		if (document.frmconvidados.ano.value == '')
			{
				alert('O ANO é requerido!');
				document.frmconvidados.ano.focus();
				return false;
			}
		// Fim da validação do campo DATA




        // inicio validacao campo Categoria
		if (document.frmconvidados.conCategoria.value == '')
			{
				alert('Selecione a Categoria do conteúdo!');
				document.frmconvidados.conCategoria.focus();
				return false;
			}
		// Fim da validação do campo Categoria



		// Início da funçao em js com loop de verificacao para campo radio STATUS
			var opcao = -1
				for (i=0;i<frmconvidados.meAtivo.length;i++) {
	
			if (frmconvidados.meAtivo[i].checked) {
				opcao = i	
				}
			}	
	
			if (opcao == -1) {
				alert("Marque o status!");
				frmconvidados.meAtivo[0].focus();
		 
		   return false;	
		}
		// Final da validação do campo radio STATUS


       return true;

	}
			//Usage: initRTE(imagesPath, includesPath, cssFile, genXHTML)
		    initRTE("rteimages/", "", "");
		
			//-->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="STYLESHEET" type="text/css" href="layout.css">
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- #include file="header.asp"-->
<!-- #include file="barra_de_menu.asp"-->

<br>
<font size="2">&nbsp;&nbsp;<b>Inclusão Item Menu</b></font> 
<hr>

<FORM name="frmconteudo" action="_site_menu_cad.asp?meId=<%=meId%>"  method="post"  onSubmit="return verifica_frm();">
		
	<table width="600" border="0" cellspacing="1" cellpadding="1" align="center">
			<tr> 
				
    <td colspan="2" bgcolor="#CCCCCC">&nbsp;</td>
			</tr>
			<tr> 
			      <td width="20%"><b>Nome menu</b></td>		
				  <td width="80%"><input type="text" name="meNome" size="30"  VALUE="<%=meNome%>"></td>
			</tr>
			<tr> 
			      <td width="20%"><b>Ordem</b></td>		
				  <td width="80%"><input type="text" name="meOrdem" size="5"  VALUE="<%=meOrdem%>"></td>
			</tr>

	<tr> 
	<td width="20%"><b>Situação:</b></td>
	<td width="80%"> 
        <input type="radio" name="meAtivo" value="S" <%if meAtivo = "S" then%>checked<%end if%>>
        &nbsp;Ativo &nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="radio" name="meAtivo" value="N" <%if meAtivo = "N" then%>checked<%end if%>>
        &nbsp;Inativo
	</td>
	</tr>
	
	<tr> 
	<td width="20%"><b>Tipo</b></td>
	<td width="80%"> 
	
	 <% if meTipo = "" or isNull(meTipo) then
	 
	       response.write "LEFT"
		   response.write "<input type=hidden name=metipo value='LEFT'"
		else
		
		    response.write metipo
			response.write "<input type=hidden name=metipo value='"&metipo&"'"
		end if
	 %>
	</td>
	</tr>		
	<tr>		
      <td width="20%"><b>Data</b></td>
      <td width="80%"> 
        <%=dia%>/
				<%=mes%>/
				<%=ano%> &nbsp; <!--(dd / mm / aaaa) -->
			  </td>
			</tr>	
	
			<tr> 
				
      <td colspan="2"><table width="100%"  border="0" cellpadding="0">
        <tr>
          <td><!--ATEN&Ccedil;&Atilde;O: A op&ccedil;&atilde;o Ativo quando ativada <strong>&quot;aparecer&aacute; na Home&quot;</strong> enquanto a op&ccedil;&atilde;o Inativo quando ativada <strong>&quot;aparecer&aacute; somente em Outras Not&iacute;cias&quot;</strong>.--></td>
        </tr>
      </table>        
        <br>
			    <input type="hidden" name="meId" value="<%=meId%>">

			  
      <input type="submit" name="enviar" value="INCLUIR">
			  
			  <br><br><br>			 
			  
			  </td>
			</tr>
		</table>
	</FORM>

<%

function RTESafe(strText)
	'returns safe code for preloading in the RTE
	dim tmpString
	
	tmpString = trim(strText)
	
	'convert all types of single quotes
	tmpString = replace(tmpString, chr(145), chr(39))
	tmpString = replace(tmpString, chr(146), chr(39))
	tmpString = replace(tmpString, "'", "&#39;")
	
	'convert all types of double quotes
	tmpString = replace(tmpString, chr(147), chr(34))
	tmpString = replace(tmpString, chr(148), chr(34))
'	tmpString = replace(tmpString, """", "\""")
	
	'replace carriage returns & line feeds
	tmpString = replace(tmpString, chr(10), " ")
	tmpString = replace(tmpString, chr(13), " ")
	
	RTESafe = tmpString
	
end function



set rs = nothing

condb.close


%>

</body>
</html>