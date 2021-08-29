({
    updateCommission: function(component, commission) {
        let action = component.get("c.saveCommission");
        action.setParams({
            "commission": commission
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                //all good
            }
        });
        $A.enqueueAction(action);
    },
})