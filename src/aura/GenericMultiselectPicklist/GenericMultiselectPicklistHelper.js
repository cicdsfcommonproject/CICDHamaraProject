({
	helperMethod : function() {
		
	},
    getPickListOptions: function(component) {
        var getPicklistOptionsService = component.get("c.getPicklistOptions");

        getPicklistOptionsService.setParams({
            "sObjectName": component.get("v.objectAPIName"),
            "sObjectFieldName": component.get("v.fieldAPIName")
        });

        getPicklistOptionsService.setCallback(this, function(response) {
            this.getOptionHandler(response, component);
        });

        $A.enqueueAction(getPicklistOptionsService);
    },
    getOptionHandler: function(response, component) {
        var responseData = response.getReturnValue() || [];
        if (component.isValid() && response.getState() === "SUCCESS") {
            this.setPicklistOptions(component, responseData);
        } else {
            this.handleFailedCallback(component, responseData);
        }
    },
    setPicklistOptions: function(component, listOfOptions) {
        var addNoneAsDefault = component.get("v.addNoneAsDefault");

        if (addNoneAsDefault) {
            listOfOptions.unshift({
                "label": "--None--"
            });
        }
        
        component.set("v.options", listOfOptions);
        var arrayOfValuesProvided = component.get("v.value").split(';');
        component.set("v.values", arrayOfValuesProvided);
    },
})