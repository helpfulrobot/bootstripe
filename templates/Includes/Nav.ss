<nav class="navbar navbar-default" role="navigation">
    <div class="container">
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
                        <li class="$LinkingMode <% if $Children %>dropdown<% end_if %>">
                            <% if not $Children || $HideChildrenFromNavigation  %>
                                <a href="$Link" title="$Title.XML">$MenuTitle.XML</a>
                            <% else %>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="$Title.XML">
                                    $MenuTitle.XML <i class="fa fa-chevron-down"></i>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <% if $ShowInDropdownIfParent && $LinkingMode == 'section' %>
                                        <li class="link"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
                                    <% else_if $ShowInDropdownIfParent %>
                                        <li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a>
                                        </li>
                                    <% end_if %>

                                    <% loop $Children %>
                                        <li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        </li><% end_loop %>
                </ul>
            <% end_if %>

            <% include SiteSearch %>
        </div>
    </div>
</nav>
