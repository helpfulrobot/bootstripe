<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h1>$Title</h1>
            </div>
            <div class="<% if $SideBarView %>col-sm-8<% else %>col-sm-12<% end_if %>">
                <% if $Query %>
                    <h4>Displaying all results for your search phrase &quot;$Query&quot;.</h4>
                    <h4>Articles Found: $PaginatedList.getTotalItems</h4>
                <% end_if %>
                $content
                <% if $PaginatedList %>
                    <% loop $PaginatedList %>
                        <% include BlogSummary %>
                    <% end_loop %>
                <% else %>
                    <% if $Query %>
                        <h2>There are no entries for the search term &quot;$Query&quot;</h2>
                    <% else %>
                        <h2>There are no entries</h2>
                    <% end_if %>
                <% end_if %>
                <% include BlogPagination PaginatedList=$PaginatedList %>
            </div>
            <% if $SideBarView %>
                <div class="col-sm-4">
                    <div class="side-bar">
                        $SideBarView
                    </div>
                </div>
            <% end_if %>
        </div>
    </div>
</div>