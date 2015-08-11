<div class="listing">
    <div class="row">
        <% if $FeaturedImage %>
            <div class="col-sm-12">
                <a href="$Link"><h5>$MenuTitle</h5></a>
            </div>
            <div class="col-sm-3">
                <div class="feat-image">
                    <a href="$Link">
                        <img src="{$FeaturedImage.Url}" class="img-responsive" alt="">
                    </a>
                </div>
            </div>
            <div class="col-sm-9">
                <% if $PreviewText %>
                    <p>$PreviewText</p>
                <% else %>
                    <p>$Excerpt</p>
                <% end_if %>

                <p><a href="$Link">Read More...</a></p>
            </div>
        <% else %>
            <div class="col-sm-12">
                <a href="$Link"><h5>$MenuTitle</h5></a>
            </div>
            <div class="col-sm-12">
                <% if $PreviewText %>
                    <p>$PreviewText</p>
                <% else %>
                    <p>$Excerpt</p>
                <% end_if %>


                <p><a href="$Link">Read More...</a></p>
            </div>
        <% end_if %>
    </div>
</div>