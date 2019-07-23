({
	doInit : function(component, event, helper) {
		helper.myAction();
	},
    clickMe : function(component, event, helper) {
		helper.myAction(component,event,helper);
	}
})