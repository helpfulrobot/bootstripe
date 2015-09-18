<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h1>$Title</h1>
        </div>
    </div>
    <div class="row">
        <% if $Form %>
            <div class="col-sm-6">
                $Content
            </div>
            <div class="col-sm-6">
                $Form
            </div>
        <% else %>
            <div class="col-sm-12">
                $Content
            </div>
        <% end_if %>
    </div>
    <% if $HasContentBlocks %>
        <div class="row">
            <% loop $DisplayedContentBlocks %>
                $Me
            <% end_loop %>
        </div>
    <% end_if %>
</div>