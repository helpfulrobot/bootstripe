<div class="container">
    <div class="row">
        <div class="col-sm-12">
            $Content

            <% if $Query %>
                <h4>Displaying all results for your search phrase &quot;$Query&quot;.</h4>
                <h4>Pages Found: $Results.getTotalItems</h4>
                <hr>
            <% end_if %>
            <% if $Results %>
                <% loop $Results %>
                    <% include PostSummary %>
                <% end_loop %>
            <% else %>
                <h4>Sorry, your search query did not return any results.</h4>
            <% end_if %>

            <% with $PaginatedList %>
                <% include Pagination %>
            <% end_with %>

        </div>
    </div>
</div>
