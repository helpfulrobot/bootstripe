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
</div>



<!-- build:js(src) javascript/page.js -->
<!-- endbuild -->