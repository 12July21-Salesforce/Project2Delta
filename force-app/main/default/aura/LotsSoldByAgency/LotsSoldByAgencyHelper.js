({

    getLots : function(component, event, agency){
        let action = component.get("c.getLots");
        action.setParams({"agency": agency});
            action.setCallback(this, function(response){
                let state = response.getState();
                if (state === "SUCCESS"){
                    component.set("v.lots", response.getReturnValue());
                } else{
                    console.log("Faled with state: "+state);
                }
            });
            $A.enqueueAction(action);
    },

    getAgencies : function(component, event){
        let action = component.get("c.getAgencies");
            action.setCallback(this, function(response){
                let state = response.getState();
                if (state === "SUCCESS"){
                    component.set("v.agencies", response.getReturnValue());
                } else{
                    console.log("Faled with state: "+state);
                }
            });
            $A.enqueueAction(action);
    },
    setTitle : function(component, event, agency){
        component.set("v.agency", agency);
    }
})