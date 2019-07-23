({  
    doInit: function(component, event, helper) {
        helper.getPickListOptions(component);
    },   
    handleChange: function (cmp, event) {
        var selectedOptionValue = event.getParam("value");
        cmp.set("v.values", selectedOptionValue);
        cmp.set("v.value", selectedOptionValue.join(';'));
    },
    
    
})