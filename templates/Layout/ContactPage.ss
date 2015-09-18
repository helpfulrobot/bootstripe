<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h1>$Title</h1>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div id="map" class="map"></div>
    </div>
</div>
<div class="container">
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

<% if $Latitude && $Longitude %>
    <script type="text/javascript">
        var map;
        $(document).ready(function () {
            map = new GMaps({
                el: '#map',
                lat: '{$Latitude}',
                lng: '{$Longitude}',
                zoom: parseInt('{$MapZoom}'),
                mapType: '{$MapType}',
                scrollwheel: false,
                draggable: false
            });
            map.addMarker({
                lat: '{$Latitude}',
                lng: '{$Longitude}',
                title: '{$MarkerTitle}',
                infoWindow: {
                    content: '{$MarkerContent.JS}'
                }
            });
            new InteractionControl(map);
        });
    </script>
<% end_if %>