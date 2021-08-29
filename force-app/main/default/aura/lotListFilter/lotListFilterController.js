({
    init: function(component, event, helper) {
       helper.loadList(component);
    },

    handleClickListName: function (component, event, helper) {
 
        const target = event.currentTarget;
        const sfid = target.dataset.sfid;
        var navigateEvent = $A.get("e.force:navigateToSObject");
        navigateEvent.setParams({"recordId": sfid});
        navigateEvent.fire();
    },
    
    handleNameFilterChange: function (component, event, helper) {
         helper.loadList(component);
    }
})