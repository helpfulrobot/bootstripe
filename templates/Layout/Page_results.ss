<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-12">
                    <div id="Content" class="searchResults">
                        <h1>$Title</h1>
                        <% if $Query %>
                            <div class="resultsTitles">
                                <p>Displaying all results for your search phrase &quot;$Query&quot;.</p>

                                <p class="sub-header">Pages Found: $Results.getTotalItems</p>
                            </div>
                        <% end_if %>
                        <% if $Results %>
                            <% loop $Results %>

                                <div class="listing">
                                    <div class="row">
                                        <% if $RightSideImage || $FeaturedImage %>
                                            <div class="col-sm-12">
                                                <a href="$Link"><h5>$MenuTitle</h5></a>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="feat-image">
                                                    <a href="$Link">
                                                        <% if $RightSideImage %>
                                                            $RenderRetinaImage($RightSideImage.ID, $RightSideImage.Title)
                                                        <% end_if %>
                                                        <% if $FeaturedImage %>
                                                            $RenderRetinaImage($FeaturedImage.ID, $FeaturedImage.Title)
                                                        <% end_if %>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-sm-9">
                                                <% if $PreviewText %>
                                                    <p>$PreviewText</p>
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
                                                <% end_if %>
                                                <p><a href="$Link">Read More...</a></p>
                                            </div>
                                        <% end_if %>
                                    </div>
                                </div>
                            <% end_loop %>
                        <% else %>
                            <p>Sorry, your search query did not return any results.</p>
                        <% end_if %>
                        <% if $Results.MoreThanOnePage %>
                            <nav>
                                <ul class="pagination">
                                    <li><a href="$Results.PrevLink"><span aria-hidden="true">&laquo;</span><span
                                            class="sr-only">Previous</span></a></li>
                                    <% loop $Results.Pages %>
                                        <% if $CurrentBool %>
                                            <li class="active"><a href="#">$PageNum</a></li>
                                        <% else %>
                                            <li><a href="$Link" title="View page number $PageNum">$PageNum</a></li>
                                        <% end_if %>
                                    <% end_loop %>
                                    <li><a href="$Results.NextLink"><span aria-hidden="true">&raquo;</span><span
                                            class="sr-only">Next</span></a></li>
                                </ul>
                                    <span class="numbers pull-right">Page $Results.CurrentPage
                                        of $Results.TotalPages</span>
                            </nav>
                        <% end_if %>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>