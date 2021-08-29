({
    doInit: function(component, event, helper) {
        let action= component.get("c.getCommissions");
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.commissions", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    handleUpdateCommission: function(component, event, helper) {
        let updatedCom = event.getParam("commission");
        helper.updateCommission(component, updatedCom);
    },
    handleSuccess: function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
    }
})