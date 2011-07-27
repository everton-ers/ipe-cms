<% @ LANGUAGE="VBSCRIPT" %>
<% 
Response.Buffer = true
response.expires=0
session.lcid = 1033
'On Error Resume Next  %> 

<!-- #include file="conexao.asp"-->

<%

   email = replace(Request.Form("email"),"'","''")
   
   sql = "select senha from tbUsuario where usuEmail= '" & email & "'"
	
  Set rs = conDB.Execute (sql)
  if rs.eof then
     Response.Redirect ("mensagem.asp?msg=9")
     Response.End 
  end if     
  
  while not rs.eof
  
    senha = rs("senha")

    texto = "Prezado Usuário" & chr(13) & chr(13)
    texto = texto & "Segue abaixo sua senha para acessar a area gerencial & chr(13) & chr(13)
    texto = texto & "Senha: " & senha & chr(13) & chr(13)  

  
    Set myMail = Server.CreateObject("CDONTS.NewMail") 
    myMail.send session("email"), email, "IpeCMS - area gerencial", texto,2
    set myMail = Nothing
    rs.movenext()    
    
 wend
  
  Response.Redirect("index.asp")

  
%>