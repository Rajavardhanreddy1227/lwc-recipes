({    
    submitfunction : function(component, event, helper) {
        var lee = component.get('v.lea');
        var a = component.get('c.createLead');
        a.setParams({'le':lee});
        a.setCallback(this,function(r){
            component.set('v.lea',r.getReturnValue());
        });
        $A.enqueueAction(a);
    },    
})