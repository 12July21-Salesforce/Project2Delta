({
    loadList: function(component) {

        const action = component.get("c.allLots");
        const lotFilterStg = component.find("nameFilter").get("v.value");
        action.setParams({
              lotFilterStg: lotFilterStg
        });

        action.setCallback(this, function(a) {
              component.set("v.lots", a.getReturnValue());
        });
      
        $A.enqueueAction(action);
    }
})