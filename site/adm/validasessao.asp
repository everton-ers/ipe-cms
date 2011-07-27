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

  '
  ' Validacoes de acesso
  if session("CMS") <> "IpeCMS" then
     Response.Redirect ("mensagem.asp?msg=18")
  end if
  
	a = session("usuId")    
	b = session("usuNome")
    c = session("usuNivel")	
  
  ' verifica se sessoes estao vazias, se estiverem interrompe acesso a area gerencial
  If (a = "" OR  a = empty or a = null)_
  or (b = "" OR  b = empty or b = null)_
  or (c = "" OR  c = empty or c = null)_
  then
     Response.Redirect ("mensagem.asp?msg=18")
  end if  





%>

