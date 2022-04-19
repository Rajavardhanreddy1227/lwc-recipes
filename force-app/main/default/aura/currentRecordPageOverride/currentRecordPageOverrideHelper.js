({ doInitHelper : function(component, event, helper){
    var action = component.get("c.queryMethod"); 
    action.setParams({ Obj : component.get("v.objectName") }); 
    console.log('action ==========>'+action);
    action.setCallback(this,function(response){ 
        var state = response.getState();
        console.log('state====>',state);
        if(state=='SUCCESS'){ 
            var result = response.getReturnValue(); 
            console.log('from serverside  ======>'+response.getReturnValue());
            //alert(JSON.stringify(result)+'=='+ component.get("v.recordId"));
             component.set("v.allfields",result); 
            console.log('result==============>'+result);
        }
       
    });
    $A.enqueueAction(action);
},
 })
/*({
    contactRecordpage: function(component, Contact) {
    var action = component.get("c.queryMethod");
    action.setParams({
        "Contactobj": Contact
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var contactRecordPage = component.get("v.newContact");
            component.set("v.newContact", newContact);
        }
    });
    $A.enqueueAction(action);
}
})*/