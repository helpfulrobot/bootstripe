<nav class="navbar navbar-default" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navPrimary">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>

    <a class="navbar-brand" href="$BaseHref">$SiteConfig.Title</a>
  </div>

  <div id="navPrimary" class="navbar-collapse collapse">
    <% if $Menu(1) %>
    <ul class="nav navbar-nav">
      <% loop $Menu(1) %>
      <li class="$LinkingMode">
        <a href="$Link" title="$Title.XML">$MenuTitle.XML</a>
      </li>
      <% end_loop %>
    </ul>
    <% end_if %>

    <% include SiteSearch %>
  </div>
</nav>
