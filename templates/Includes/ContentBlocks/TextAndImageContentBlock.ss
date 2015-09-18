<div class="row">
    <% if $ImagePosition == 'Top' %>
        <div class="col-sm-12">
            $RenderBootstrapImage($Image.ID, 12)
        </div>
        <div class="col-sm-12">
            {$Content}
        </div>
    <% end_if %>
    <% if $ImagePosition == 'Left' %>
        <div class="col-sm-6">
            $RenderBootstrapImage($Image.ID, 12, 6)
        </div>
        <div class="col-sm-6">
            {$Content}
        </div>
    <% end_if %>
    <% if $ImagePosition == 'Right' %>
        <div class="col-sm-6">
            {$Content}
        </div>
        <div class="col-sm-6">
            $RenderBootstrapImage($Image.ID, 12, 6)
        </div>
    <% end_if %>
    <% if $ImagePosition == 'Bottom' %>
        <div class="col-sm-12">
            {$Content}
        </div>
        <div class="col-sm-12">
            $RenderBootstrapImage($Image.ID, 12)
        </div>
    <% end_if %>
</div>