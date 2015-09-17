<div class="article-summary">
    <div class="row">
        <% if $FeaturedImage %>
            <div class="col-sm-4">
                <a href="$Link">
                    $RenderBootstrapImage($FeaturedImage.ID, 12, 4)
                </a>
            </div>
        <% end_if %>
        <div class="<% if $FeaturedImage %>col-sm-8<% else %>col-sm-12<% end_if %>">
            <h2>
                <a href="$Link">
                    <% if $MenuTitle %>$MenuTitle
                    <% else %>$Title<% end_if %>
                </a>
            </h2>

            <% if $Summary %>
            <p>$Summary
            <% else %>
            <p>$Excerpt
            <% end_if %>
            <a href="$Link">
                Read More
            </a>
        </p>

            <% include EntryMeta %>
        </div>
    </div>
</div>