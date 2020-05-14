<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <%
    if(session != null)
    {
    session.invalidate();
    response.sendRedirect("Main.html");
  }
  else
  {
    out.print("Error You Need To Login");
  }
    %>
  </body>
</html>
