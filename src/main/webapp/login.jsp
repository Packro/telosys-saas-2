<!doctype html>
<html class="no-js" lang="en" ng-app="app">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Telosys Web</title>
    <meta name="description" content="Telosys Web">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href="lib/materialdesignicons/css/materialdesignicons.css" media="all" rel="stylesheet" type="text/css">
</head>

<body>

<div class="login without-backdrop">
    <div class="login-heading">
        <h4>Log in to Your Account</h4>
    </div>
    <div class="login-body">
        <form action="/callback" method="POST">
            <input type="hidden" name="client_name" value="FormClient"/>
            <div class="form-group">
                <div class="container container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="/profile/github" class="btn btn-default btn-lg btn-github btn-block" role="button"><i class="fa fa-github fa-2x"></i>Sign in with GitHub</a>
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
            <% if (request.getSession().getAttribute("error") != null) { %>
            <div class="form-group">
                <div class="alert alert-danger">
                    <% out.println(request.getSession().getAttribute("error")); %>
                </div>
            </div>
            <% } %>
            <div class="form-group">
                <input name="login" id="login" type="text" class="form-control input-lg" placeholder="Username" />
            </div>
            <div class="form-group">
                <input name="password" id="password" type="password" class="form-control input-lg" placeholder="Password" />
            </div>
            <p class="help-block">
                If you don't have an account, <a href="/createAccount">sign up</a>.
                Forgot your password? <a href="/forgetPassword">Reset it</a> with your email.
            </p>
            <button type="submit" class="btn btn-success btn-lg btn-block" role="button" data-reactid="86">Sign in</button>
        </form>
    </div>
</div>

</body>

</html>
