({
    Cancel : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    },
    Submit: function(component, event, helper){
        //ApexCodeSumting
        let method = component.get("c.SubmitContract");
        method.setParams({Con: "v.fields"});
        method.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                //logic should just insert no need for this perhaps
            }
        });
        $A.enqueueAction(method);
    },

    Success: function(component,event,helper){
        //set up Toast Message to display
        var Toast1 = $A.get("e.force:showToast");
        Toast1.setParams({"title" : "Contract Saved!", "message": "This Contract has been saved."});
        //close the quick record form
        $A.get("e.force:closeQuickAction").fire();
        //fire toast
        Toast1.fire();

        $A.get("e.force:refreshView").fire();
    }
})