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

  <meta name="msapplication-square70x70logo" content="$ThemeDir/windows-tile-70x70.png">
  <meta name="msapplication-square150x150logo" content="$ThemeDir/windows-tile-150x150.png">
  <meta name="msapplication-square310x310logo" content="$ThemeDir/windows-tile-310x310.png">
  <meta name="msapplication-TileImage" content="$ThemeDir/windows-tile-144x144.png">
  <meta name="msapplication-TileColor" content="#231f20">
  <link rel="apple-touch-icon-precomposed" sizes="152x152" href="$ThemeDir/apple-touch-icon-152x152-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="120x120" href="$ThemeDir/apple-touch-icon-120x120-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="76x76" href="$ThemeDir/apple-touch-icon-76x76-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="60x60" href="$ThemeDir/apple-touch-icon-60x60-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="$ThemeDir/apple-touch-icon-144x144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="$ThemeDir/apple-touch-icon-114x114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="$ThemeDir/apple-touch-icon-72x72-precomposed.png">
  <link rel="apple-touch-icon" sizes="57x57" href="$ThemeDir/apple-touch-icon.png">
  <link rel="shortcut icon" href="$ThemeDir/favicon.ico">
  <link rel="icon" type="image/png" sizes="64x64" href="$ThemeDir/favicon.png">

  <!-- build:css({.,.tmp}) css/layout.css -->
  <link rel="stylesheet" href="{themedir}css/layout.css">
  <link rel="stylesheet" href="{themedir}bower_components/font-awesome/css/font-awesome.css">
  <!-- endbuild -->

  <% include GA %>
</head>
<body>
<!--[if lt IE 10]>
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
<script src="{themedir}bower_components/picturefill/dist/picturefill.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/affix.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/alert.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/button.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/carousel.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/collapse.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/dropdown.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/tab.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/transition.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/scrollspy.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/modal.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="{themedir}bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/popover.js"></script>
<!-- endbuild -->
</body>
</html>
