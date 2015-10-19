<% if $Filename %>
    <div class="row">
        <div class="col-sm-12">
            <h4>
                <a href="$Link">
                    <span class="text-uppercase">[{$Extension}]</span> {$Title} ({$Size})
                </a>
            </h4>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <p>File Type: <span class="text-uppercase">{$Extension}</span></p>

            <p>
                <a href="$Link">
                    {$BaseHref}{$Filename}
                </a>
            </p>
        </div>
    </div>
<% else %>
    <div class="row">
        <div class="col-sm-12">
            <h4>
                <a href="$Link">
                    <% if $MenuTitle %>$MenuTitle
                    <% else %>$Title<% end_if %>
                </a>
            </h4>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <p>$Content.ContextSummary(250)</p>

            <p>
                $Breadcrumbs
            </p>
        </div>
    </div>
<% end_if %>