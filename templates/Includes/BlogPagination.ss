<% if $PaginatedList && $PaginatedList.MoreThanOnePage %>
    <div class="pagination">
        <ul class="PageNumbers">
            <% if $PaginatedList.NotFirstPage %>
                <li class="prev">
                    <a class="paginate-left" href="$PaginatedList.PrevLink" title="View the previous page">&lt; Prev</a>
                </li>
            <% else %>
                <li class="prev disabled">
                    <a class="paginate-left disabled">&lt; Prev</a>
                </li>
            <% end_if %>

            <% loop $PaginatedList.Pages %>
                <% if $CurrentBool %>
                    <li class="active"><a class="disabled">$PageNum</a></li>
                <% else %>
                    <% if $Link %>
                        <li>
                            <a class="<% if $BeforeCurrent %>paginate-left<% else %>paginate-right<% end_if %>" href="$Link">
                                $PageNum
                            </a>
                        </li>
                    <% else %>
                        <li class="disabled"><a class="disabled">&hellip;</a></li>
                    <% end_if %>
                <% end_if %>
            <% end_loop %>

            <% if $PaginatedList.NotLastPage %>
                <li class="next">
                    <a class="next paginate-right" href="$PaginatedList.NextLink" title="View the next page">Next &gt;</a>
                </li>
            <% else %>
                <li class="next disabled">
                    <a class="next paginate-right disabled">Next &gt;</a>
                </li>
            <% end_if %>
        </ul>
    </div>
<% end_if %>