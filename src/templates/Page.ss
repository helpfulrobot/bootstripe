<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
  <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if
    %>&nbsp;|&nbsp;$SiteConfig.Title</title>
  <% base_tag %>
  $MetaTags(false)
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="$ThemeDir/favicon.ico">
  <link rel="apple-touch-icon-precomposed" href="$ThemeDir/apple-touch-icon-precomposed.png">

  <!-- build:css({.,.tmp}) css/layout.css -->
  <link rel="stylesheet" href="{themedir}css/layout.css">
  <link rel="stylesheet" href="{themedir}bower_components/font-awesome/css/font-awesome.css">
  <!-- endbuild -->
</head>
<body>
<!--[if lt IE 9]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please
  <a href="http://browsehappy.com/">upgrade your browser</a>
  to improve your experience.
</p>
<![endif]-->

<div class="container">
  <% include Header %>
  <div role="main">
    $Layout
  </div>
  <% include Footer %>
</div>

<!-- build:js({.,src}) javascript/vendor.js -->
<script src="{themedir}bower_components/jquery/dist/jquery.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/affix.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/alert.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/button.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/carousel.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/collapse.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/dropdown.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/tab.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/transition.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/scrollspy.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/modal.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/popover.js"></script>
<!-- endbuild -->
</body>
</html>
