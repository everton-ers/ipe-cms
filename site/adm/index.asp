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
%>

<!-- #include file="configuracao.asp"-->

<HTML><HEAD><TITLE><%=titlegerencial%></TITLE>
<link rel="STYLESHEET" type="text/css" href="layout.css">
<script language="JavaScript">
<!--  
function ValidaLogin() { //v3.0
   
    if (document.form1.email.value == '')
             {alert('Please, digit your user');
              document.form1.email.focus();
              return;
             } 
    if (document.form1.senha.value == '')
             {alert('Please, digit you password');
              document.form1.senha.focus();
              return;
             } 
      
   // document.form1.submit()
        return true;
}
//-->
</script>

</HEAD>
<BODY aLink=#ff0000 bgColor=#ffffff leftMargin=0 link=#000000 text=#000000 topMargin=0 
vLink=#000000 marginheight="0" marginwidth="0"  onLoad="document.form1.email.focus();">

<!-- #include file="header.asp"-->

<%
   status=request.queryString ("status")
   if status = "e" then
      msg="usuario ou senha inválido. Tente novamente."
   else
      msg=""
   end if
%>

<TABLE border=0 cellPadding=0 cellSpacing=8 width="100%" align="left">
  <TBODY> 
  <TR> 
    <TD vAlign=top width="100%"> 
      <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
        <TBODY> 
        <TR> 
          <TD vAlign=top colspan="2" height="78">AUTENTICAR 
            <hr>
          </TD>
        </TR>
        <TR> 
         
          <TD > 
            <form name="form1" action="validalogin.asp" method="post" onSubmit="return ValidaLogin();">
              <table border="0" align=center cellspacing="0" width="615" cellpadding="0" >
                <tr> 
                  <td width="1"></td>
                  <td width="77" >
                    Usuário</td>
                  <td width="268" > 
                    <input name="email" size="30" value="">
                    </td>

                </tr>
                <tr> 
                  <td width="1"></td>
                  <td width="77" >
                    Senha</td>
                  <td width="268" > 
                    <input type="password" name="senha" size="10" >
                    <input type="submit" value=" OK " name="nom" >
                    </font></td>
                </tr>
                <% if status = "1" then %>
                <tr> 
                  <td width="1"></td>
                  <td  colspan="2"><%=msg%></font></td>
                </tr>
                <%end if%>
              </table>
            </form>
          </TD>
        </TR>

        </TBODY> 
      </TABLE>
</TD>
  </TR>
  </TBODY> 
</TABLE>
    </BODY>
    </HTML>
