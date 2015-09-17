<%-- NOTE: Before including this, you will need to wrap the include in a with block  --%>

<% if $MoreThanOnePage %>
    <div class="row">
        <div class="col-sm-12 text-center">
            <ul class="pagination">
                <% if $NotFirstPage %>
                    <li>
                        <a aria-label="Previous" href="{$PrevLink}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                <% end_if %>

                <% loop $Pages %>
                    <li>
                    <% if $CurrentBool %>
                        <%-- Page On --%>
                        <span>$PageNum</span>
                    <% else %>
                        <% if $Link %>
                            <%-- Page Link --%>
                            <a href="$Link">$PageNum</a>
                        <% else %>
                            <%-- Too Many Pages --%>
                            <span>...</span>
                        <% end_if %>
                    <% end_if %>
                    </li>
                <% end_loop %>

                <% if $NotLastPage %>
                    <li>
                        <a aria-label="Next" href="{$NextLink}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                <% end_if %>
            </ul>
        </div>
    </div>
<% end_if %>
