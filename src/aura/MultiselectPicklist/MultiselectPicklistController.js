({
    /**
     * Webkul Software.
     *
     * @category Webkul
     * @author Webkul
     * @copyright Copyright (c) 2010-2017 Webkul Software Private Limited (https://webkul.com)
     * @license https://store.webkul.com/license.html
     */
    initialize: function (component, event, helper) {
        var options = [
            { value: "A", label: "A" },
            { value: "B", label: "B" },
            { value: "C", label: "C" },
            
        ];
        var values = ["3", "8", "1"];
        var required = ["A"];
        component.set("v.listOptions", options);
        component.set("v.defaultOptions", values);
        component.set("v.requiredOptions", required);
    },
    handleChange: function (cmp, event) {
        // Get the list of the "value" attribute on all the selected options
        var selectedOptionsList = event.getParam("value");
    }
})