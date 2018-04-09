<!doctype html>
<html>
<head>
  <sec:ifUserGranted role="ROLE_USER">
    <meta name="layout" content="default"/>
  </sec:ifLoggedIn>
  <sec:ifUserGranted role="ROLE_ADMIN">
    <meta name="layout" content="admin"/>
  </sec:ifLoggedIn>
    <title>Ecoax</title>
</head>
<body>
</body>
</html>
