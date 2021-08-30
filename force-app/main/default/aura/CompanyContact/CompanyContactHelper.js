({
    getOrg : function(component, event) {
        let action = component.get("c.getCompanyContact");
        action.setCallback(this, function(response){
        let state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.Organization", response.getReturnValue());
            } else{
                console.log("Faled with state: "+state);
            }
        });
        $A.enqueueAction(action);
    }
})
