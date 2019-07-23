({
	getrecords : function(b) {
      var action = b.get("c.getwrapedList");
        $A.enqueueAction(action);
        action.setCallback(this,function(a){
            if(a.getState() === "SUCCESS"){
                var result = a.getReturnValue();
                b.set("v.wrapperList", result);
            }
        });                                                
	}
})