function InteractionControl(map, maxSize) {
    if(window.innerWidth > (maxSize || 1024)) return;
    var controlInstance = this;


    controlInstance.controlElement_ = map.addControl({
        position: 'RIGHT_TOP',
        content : '<span class="oi oi-fullscreen-enter" aria-hidden="true"></span>',
        classes : 'map-ui-expand',
        style   : {
            'margin'             : '10px 10px 0 0',
            'text-align'         : 'center',
            color                : 'rgb(102, 102, 102)',
            '-webkit-user-select': 'none',
            'font-size'          : '13px',
            padding              : '7px 7px 6px 7px',
            'border-radius'      : '2px',
            'min-width'          : '21px',
            'font-weight'        : 500,
            'background-color'   : 'rgb(255, 255, 255)'
        },
        events  : {
            click: function () {
                controlInstance.setInteractionEnabled(!controlInstance.getInteractionEnabled())
            }
        }
    });

    controlInstance.controlElement_.title = 'Click to enable interaction';

    controlInstance.interactionEnabled_ = false;

    controlInstance.map_ = map;

    controlInstance.map_.setOptions({draggable: false});

    controlInstance.map_.el.className = controlInstance.map_.el.className + ' map-interaction-disabled';
}

InteractionControl.interactionEnabled_ = false;

InteractionControl.map_ = null;

InteractionControl.prototype.getMap = function(){
    return this.map_;
};

InteractionControl.prototype.getControlElement = function(){
    return this.controlElement_;
};

InteractionControl.prototype.getInteractionEnabled = function () {
    var control = this;
    return control.interactionEnabled_;
};

InteractionControl.prototype.setInteractionEnabled = function (enabled) {
    var control = this;
    control.interactionEnabled_ = enabled;
    console.info('InteractionControl: Toggling Interaction State');
    if(enabled){
        console.info('InteractionControl: Interaction Enabled');
        control.getControlElement().title = 'Click to disable interaction';
        control.getControlElement().getElementsByClassName("oi")[0].className = 'oi oi-fullscreen-exit';
        control.getMap().el.className = control.getMap().el.className.replace('map-interaction-disabled', 'map-interaction-enabled');
        control.getMap().refresh();
        control.getMap().setOptions({draggable: true});
    } else {
        console.info('InteractionControl: Interaction Disabled');
        control.getControlElement().title = 'Click to enable interaction';
        control.getControlElement().getElementsByClassName("oi")[0].className = 'oi oi-fullscreen-enter';
        control.getMap().el.className = control.getMap().el.className.replace('map-interaction-enabled', 'map-interaction-disabled');
        control.getMap().refresh();
        control.getMap().setOptions({draggable: false});
    }
};