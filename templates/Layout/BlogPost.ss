<div class="main">
    <div class="container">
        <div class="post">
            <div class="row">
                <div class="col-sm-12">
                    <h1>$Title</h1>
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="blog-details">
                                <p>Posted on $PublishDate.Format('d/m/Y') by $Author</p>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <% if $FeaturedImage %>
                                <img class="img-responsive img-blog" src="$FeaturedImage.Url" alt=""/>
                            <% end_if %>
                            $Content
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="side-bar">
                        $SideBarView
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>