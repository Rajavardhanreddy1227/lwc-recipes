/**
 * Copyright (c) 2019 ForeFront, Inc. All Rights Reserved. Subject to ForeFront, Inc. licensing.
 */

({
    handleSubmit: function (component, event, helper) {
        component.set('v.showSpinner', true);
        let priceListType = component.get('v.priceListItem.Pricelist_Type__c');
        if (priceListType === 'Temporary'){
            component.find('recordEditForm').submit();
        } else {
            component.find('recordForm').submit();
        }
         //$A.get('e.force:refreshView').fire();


    },
    handleCancel: function (component, event, helper) {
        event.preventDefault();
        component.set('v.isActive', false);
        //event.preventDefault();
    },
    
    handleLoad: function (component, event, helper) {
        component.set('v.showSpinner', false);
    },
    handleError: function (component, event, helper) {
        component.set('v.showSpinner', false);
    },
    handleSuccess: function (component, event, handler) {
        component.set('v.showSpinner', false);
        component.set('v.isActive', false);
        handler.showToast('Success!', 'Record edited successfully!', 'success');
        //$A.get('e.force:refreshView').fire();
    },
      temporaryDaysChanged: function (component, event, helper){
               let tempPeriodDays =  component.get("v.priceListItem.Temporary_Period_Days__c");
               let tempPeriodDays2 =  component.find("temp_period").get("v.value");
    console.log('tempPeriodDays '+ tempPeriodDays2);
               if(tempPeriodDays === ""|| tempPeriodDays === "1"){
                   var el = component.find("blanket_number");
                   $A.util.addClass(el, "customRequired");

               }else{
                      var el = component.find("blanket_number");
                      $A.util.removeClass(el, "customRequired");
               }
            }
});