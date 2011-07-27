
<!--#include file="variaveis.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt" lang="pt">
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
<head>
<!-- meta tags -->
   <!--#include file="metatags.asp"-->
<!-- fim meta tags -->

  <title><%=texto_topo%></title>

  <link href="style.css" media="screen" type="text/css" rel="stylesheet" />

</head>

<body>

<!-- topo -->
	<!--#include file="topo.asp" -->
<!-- fim topo -->

<!-- sub cabeçalho -->
	<!--#include file="subcabecalho.asp" -->
<!-- fim sub cabeçalho -->

<table cellspacing="0">
  <tbody>
    <tr>

<!-- menu ---- localizado no lado esquerdo -->   
	<!--#include file="menu.asp" -->
<!-- fim menu -->

<!-- coluna central -->
	<!--#include file="coluna_centro.asp" -->
<!-- fim coluna central -->

<!-- coluna direita -->
	<!--#include file="coluna_direita.asp" -->
<!-- fim coluna direita -->

    </tr>
  </tbody>
</table>

<!-- rodape -->
	<!--#include file="rodape.asp"-->
<!-- fim rodape -->

</body>
</html>
