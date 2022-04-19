({
	doInit : function(component, event, helper) {
	// create a one-time use instance of the getAccount action
        // in the server-side controller
        var action = component.get("c.queryMethod");
        
        action.setParams({
            "accountId": component.get("v.recordId")
        });
	// Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
	    	//Set the component account attribute to the returned account object
                component.set("v.account", response.getReturnValue());  
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
	
        // $A.enqueueAction adds the server-side action to the queue.
        $A.enqueueAction(action);
    }
})