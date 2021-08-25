({

    getLots : function(component, event){
        let action = component.get("c.getLots");
        action.setParams({"agency": 'All'});
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
    }
})
