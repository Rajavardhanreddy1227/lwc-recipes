({
    doInit : function(component, event, helper) {
        var recordId = component.get('v.recordId');
    }
    
    /*SaveAccessRequest : function(component, event, helper) {      
        var conItems = component.set("v.ContactItems");
        var contactVal = component.get("v.Contactval");
        var queryaction = component.get("c.queryMethod");
        queryaction.setCallback(this, function(response) {            
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.ContactItems",response.getReturnValue());
                var action = component.get("c.queryMethod");
                action.setParams({"Obj":$A.util.json.encode(contactVal)
                                 });
                $A.enqueueAction(action);
             }
        });    
        $A.enqueueAction(queryaction);              

        }*/
})
/*({
    doInit : function(component, event, helper) {
        component.set("v.Columns", [
            {label:"Domain Name", fieldName:"Name", type:"text"}
        ]);

        var action = component.get("c.queryMethod");

        action.setParams({
            ContactItems: component.get("v.ContactItems")
        });

        action.setCallback(this, function(data) {
            var state = data.getState();
            if (state === "SUCCESS") {
                component.set("obj", data.getReturnValue());
            } else {
                console.log("Failed with state: " + state);
            }
        });

        // Send action off to be executed
        $A.enqueueAction(action);
    }
})*/