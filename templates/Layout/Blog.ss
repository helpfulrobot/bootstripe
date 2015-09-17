<div class="container">
    <div class="row">
        <div class="<% if $SideBarView %>col-sm-9<% else %>col-sm-12<% end_if %>">

            <article>
                <h1>
                    <% if $ArchiveYear %>
                        <%t Blog.Archive "Archive" %>:
                        <% if $ArchiveDay %>
                            $ArchiveDate.Nice
                        <% else_if $ArchiveMonth %>
                            $ArchiveDate.format("F, Y")
                        <% else %>
                            $ArchiveDate.format("Y")
                        <% end_if %>
                    <% else_if $CurrentTag %>
                        <%t Blog.Tag "Tag" %>: $CurrentTag.Title
                    <% else_if $CurrentCategory %>
                        <%t Blog.Category "Category" %>: $CurrentCategory.Title
                    <% else %>
                        $Title
                    <% end_if %>
                </h1>

                <!-- Content Blocks Loop -->

                <% if $PaginatedList.Exists %>
                    <% loop $PaginatedList %>
                        <% include PostSummary %>
                    <% end_loop %>
                <% else %>
                    <p><%t Blog.NoPosts "There are no posts" %></p>
                <% end_if %>
            </article>

            $Form
            $CommentsForm

            <% with $PaginatedList %>
                <% include Pagination %>
            <% end_with %>

            <% include BlogSideBar %>

        </div>
    </div>
</div>


