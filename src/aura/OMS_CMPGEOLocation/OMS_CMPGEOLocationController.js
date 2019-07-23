({
	doInit : function(component, event, helper) {
        helper.myAction();
        /**if(navigator.geoLocation){
            console.log("capability is there");
            
        }else{
            console.log("No Capability");
        }
        if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var latit = position.coords.latitude;
                    var longit = position.coords.longitude;
                    component.set("v.latitude",latit);
                    component.set("v.longitude",longit);
				});
		}**/
		
	},
     handleClick : function(cmp, event) {
        var attributeValue = cmp.get("v.text");
        console.log("current text: " + attributeValue);

        var target = event.getSource();
        cmp.set("v.text", target.get("v.label"));
    },
    setGeoLocation : function(component, event, helper){
        if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var latit = position.coords.latitude;
                    var longit = position.coords.longitude;
                    component.set("v.latitudeViaButton",latit);
                    component.set("v.longitudeViaButton",longit);
				});
		}
    }
})