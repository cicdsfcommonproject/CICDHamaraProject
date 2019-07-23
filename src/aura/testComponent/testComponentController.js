({
	dsoinit : function(component, event, helper) {
        helper.getrecords(component);
	},
    
    itemsChange : function(component, event, helper){
        var device = $A.get("$Browser.formFactor"); 
        console.log('device>>>>>>>>'+device);
        var eventX = event.target.id;
        console.log('device>>>>>>>>'+eventX);
        var eventArr = eventX.split("__");
    	var id = eventArr[1];
        var index = eventArr[0];
        var targetName = 'ContactName__'+id;
        var message = 'Message__'+id;
        var action = component.get("c.getUpdate");
        $A.enqueueAction(action);
        action.setParams({ "id" : id , "Name" : document.getElementById(targetName).value});        
        action.setCallback(this,function(a){
            if(a.getState() === "SUCCESS"){
                var result = a.getReturnValue();
                var arr = component.get("v.wrapperList");
                arr[index] = result;
                document.getElementById(eventX).checked = false;
                document.getElementById(message).value = eventArr[1]+" UPDATED";
                
                setTimeout(function(){
                    document.getElementById(message).value = "";
                }, 2000);	
            }
        });
        
    }
})