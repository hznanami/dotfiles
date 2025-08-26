(function () {
    'use strict';

    const class_name = 'qutebrowser-custom-hint';
    const old_add_event_listener = Element.prototype.addEventListener;
    Element.prototype.addEventListener = function () {
        if (arguments[0] === 'click') {
            this.classList.add(class_name);
        }

        return old_add_event_listener.apply(this, arguments);
    };
})();

