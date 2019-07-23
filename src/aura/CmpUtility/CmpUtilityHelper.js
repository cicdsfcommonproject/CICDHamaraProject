({
	helperMethod : function() {
		
	},
    myAction : function(component,event,helper) {
		alert('hello');
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Error Message',
            message:'Mode is pester ,duration is 5sec and Message is not overrriden because messageTemplateData is not specified',
            messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
            duration:' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
        /**
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Soni",
            "type": "success",
            "message": "Account Widget was created."
        });
        toastEvent.fire();
        **/
	}
})