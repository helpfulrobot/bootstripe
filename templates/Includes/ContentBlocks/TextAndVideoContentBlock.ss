<div class="row">
    <% if $VideoPosition == 'Top' %>
        <div class="col-sm-12">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{$VideoID}"></iframe>
            </div>
        </div>
        <div class="col-sm-12">
            {$Content}
        </div>
    <% end_if %>
    <% if $VideoPosition == 'Left' %>
        <div class="col-sm-6">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{$VideoID}"></iframe>
            </div>
        </div>
        <div class="col-sm-6">
            {$Content}
        </div>
    <% end_if %>
    <% if $VideoPosition == 'Right' %>
        <div class="col-sm-6">
            {$Content}
        </div>
        <div class="col-sm-6">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{$VideoID}"></iframe>
            </div>
        </div>
    <% end_if %>
    <% if $VideoPosition == 'Bottom' %>
        <div class="col-sm-12">
            {$Content}
        </div>
        <div class="col-sm-12">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{$VideoID}"></iframe>
            </div>
        </div>
    <% end_if %>
</div>