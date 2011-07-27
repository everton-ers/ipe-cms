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

	'Recebe o código da manchete selecionada
	conId = request.querystring("conId")
		
		'Cria uma nova instância da classe formando um novo objeto
		set rs = Server.CreateObject("ADODB.Recordset")
		
	if (trim(conId) = "") then
		conId = 0
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


	if (conId <> 0) then

		'Seleciona os dados da manchete
		sql= "Select *, ifnull(conTexto,' ') as conTexto,ifnull(conFonte,' ') as conFonte from tbconteudo WHERE conId = " & conId & " "
		'Executa a string sql.
		
		'response.write sql
		'response.end
		set rs = conDB.execute(sql)
		
       

		'Verifica se não é final de arquivo.	
		if not rs.eof then

		'response.write ">"&rs("conFonte")&"<"
		'response.end
			
			conId			= rs("conId") 
			conTitulo		= replace(trim(rs("conTitulo")),"'","`")
			conFonte		= trim(replace(rs("conFonte"),"'","`"))
			conTexto		= replace(trim(rs("conTexto")),"'","`")
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
				alert('Selecione a Categoria do caonteúdo!');
				document.frmconvidados.conCategoria.focus();
				return false;
			}
		// Fim da validação do campo Categoria



		// Início da funçao em js com loop de verificacao para campo radio DESTAQUE
			var opcao = -1
				for (i=0;i<frmconvidados.conDestaque.length;i++) {
	
			if (frmconvidados.conDestaque[i].checked) {
				opcao = i	
				}
			}	
	
			if (opcao == -1) {
				alert("Marque o destaque!");
				frmconvidados.conDestaque[0].focus();
		 
		   return false;	
		}
		// Final da validação do campo radio DESTAQUE

		

		// Início da funçao em js com loop de verificacao para campo radio STATUS
			var opcao = -1
				for (i=0;i<frmconvidados.conAtivo.length;i++) {
	
			if (frmconvidados.conAtivo[i].checked) {
				opcao = i	
				}
			}	
	
			if (opcao == -1) {
				alert("Marque o status!");
				frmconvidados.conAtivo[0].focus();
		 
		   return false;	
		}
		// Final da validação do campo radio STATUS


       return true;




	}

			//Usage: initRTE(imagesPath, includesPath, cssFile, genXHTML)
		    initRTE("rteimages/", "", "");
		
			//-->
</script>


	<link rel="STYLESHEET" type="text/css" href="layout.css">

	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- #include file="header.asp"-->
<!-- #include file="barra_de_menu.asp"-->

<br>
<font size="2">&nbsp;&nbsp;<b>Inclusão Item Conteudo</b></font> 
<hr>



	<FORM name="frmconteudo" action="_site_conteudo_cad.asp?conId=<%=conId%>"  method="post"  onSubmit="return verifica_frm();">

	
		
		<table width="600" border="0" cellspacing="1" cellpadding="1" align="center">
			<tr> 
				
      <td colspan="2" >&nbsp;</td>
			</tr>
			<tr> 
			      <td width="15%"><b>Título</b></td>		
				  <td width="85%"><input type="text" name="conTitulo" size="80"  VALUE="<%=conTitulo%>"></td>
			</tr>
			<tr> 
			      <td width="15%"><b>Fonte</b></td>		
				  <td width="85%"><input type="text" name="conFonte" size="80"  VALUE="<%=conFonte%>"></td>
			</tr>
			<tr> 
				<td width="15%" valign=top><b>Conteúdo página</b></td>				
				<td width="85%">
				
				<!--
				<textarea name="conTexto" cols="60" rows="10"><%=conTexto%></textarea>		
				-->



<%'=conTexto%>

<script language="JavaScript" type="text/javascript">
<!--

<%
'if request.form("rte1") = "" then
if conTexto = "" then
	sContent = "Insira o" & chr(13) & "<b>conteudo ...</b>"
	sContent = RTESafe(sContent)
else
	'sContent = RTESafe(request.form("rte1"))
	sContent =  RTESafe(conTexto)

	'response.write ">>>"&conTexto&"<<<<<"
end if

%>

//Usage: writeRichText(fieldname, html, width, height, buttons, readOnly)
writeRichText('rte1', '<%=sContent%>', 600, 350, true, false);
//-->
</script>




			   <%
				'sContent = ""&nexTexto
				'sContent = ""&resumo
				'sContent = RTESafe(sContent)
			   %>


				
				</td>
			</tr>
			<tr> 
				
      <td width="15%"><b>Data</b></td>
      <td width="85%"> 
        <input type="text" name="dia" size="3" maxlength="2" value="<%=dia%>">&nbsp;/
				<input type="text" name="mes" size="3" maxlength="2" value="<%=mes%>">&nbsp;/
				<input type="text" name="ano" size="5" maxlength="4" value="<%=ano%>">&nbsp;&nbsp;(dd / mm / aaaa)
			  </td>
			</tr>
	<tr> 
	<td width="15%"><b>Item de Menu</b></td>
	<td width="85%"> 

<%'response.write concategoria%>
       
	   <select name="concategoria">

	   <option value=""> ---> Selecione categoria</option>

<%
     sql = "select meId,meNome from tbmenusite order by meOrdem"

     set rs = condb.execute(sql)
      
	 while not rs.eof

	    meId = rs("meId")
		meSite = rs("meNome")
		if conCategoria = "" then
		   concategoria = 0
		end if

%>

       <option value="<%=meId%>" <%if cint(meId)=cint(conCategoria) then%>selected<%end if%>> <%=meSite%></option>

<%
     rs.movenext
	 wend
%>

</select>

	</td>
	</tr>
<!--	<tr> 
	<td width="15%"><b>Destaque</b></td>
	<td width="85%"> 
        <input type="radio" name="conDestaque" value="S" <%if conDestaque = "S" then%>checked<%end if%>>
        &nbsp;Sim &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="conDestaque" value="N" <%if conDestaque = "N" then%>checked<%end if%>>
        &nbsp;Não &nbsp;&nbsp; 
	</td>

	</tr>
-->
	<tr> 
	<td width="15%"><b>Situação</b></td>
	<td width="85%"> 
        <input type="radio" name="conAtivo" value="S" <%if conAtivo = "S" then%>checked<%end if%>>
        &nbsp;Ativo &nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="radio" name="conAtivo" value="N" <%if conAtivo = "N" then%>checked<%end if%>>
        &nbsp;Inativo
	</td>
	</tr>
			<tr> 
				
      <td colspan="2"><table width="100%"  border="0" cellpadding="0">
        <tr>
          <td><!--ATEN&Ccedil;&Atilde;O: A op&ccedil;&atilde;o Ativo quando ativada <strong>&quot;aparecer&aacute; na Home&quot;</strong> enquanto a op&ccedil;&atilde;o Inativo quando ativada <strong>&quot;aparecer&aacute; somente em Outras Not&iacute;cias&quot;</strong>.--></td>
        </tr>
      </table>        
        <br>
			    <input type="hidden" name="conId" value="<%=conId%>">

			  
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