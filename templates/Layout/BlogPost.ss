<div class="container">
	<div class="row">
        <div class="<% if $SideBarView %>col-sm-9<% else %>col-sm-12<% end_if %>">
            <article>
                <h1>$Title</h1>

				<% if $FeaturedImage %>
                    <p class="post-image">$FeaturedImage.setWidth(795)</p>
				<% end_if %>

                <div class="content">$Content</div>

				<% include EntryMeta %>
            </article>

			$Form
			$CommentsForm
        </div>

		<% include BlogSideBar %>
	</div>
</div>

