({
    doInit : function(component, event, helper) {
        let action = component.get("c.getLots");
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.lots", response.getReturnValue());
            } else{
                console.log("Faled with state: "+state);
            }
        });
        $A.enqueueAction(action);
    }
})
