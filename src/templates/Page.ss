<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %>&nbsp;|&nbsp;$SiteConfig.Title</title>
    <% base_tag %>
    $MetaTags(false)
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- build:css({.,.tmp}) css/main.css -->
    <link rel="stylesheet" href="{themedir}css/main.css">
    <link rel="stylesheet" href="{themedir}bower_components/font-awesome/css/font-awesome.css">
    <!-- bower:css -->
    <!-- endbower -->
    <!-- endbuild -->
</head>
<body>
<!--[if lt IE 9]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<div class="container">
    <% include Header %>
	<div role="main">
    	$Layout
	</div>
    <% include Footer %>
</div>

<!-- build:js({.,src}) javascript/vendor.js -->
<!-- bower:js -->
<!-- endbower -->
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/collapse.js"></script>
<!-- endbuild -->
</body>
</html>
