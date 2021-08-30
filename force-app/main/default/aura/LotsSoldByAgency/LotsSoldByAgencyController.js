({
    doInit : function(component, event, helper) {
        helper.getLots(component, event);
        helper.getAgencies(component, event);
    },

    handleUpdateLots : function(component, event, helper){
        let agency = event.getParam("agency");
        helper.getLots(component, event, agency);
        helper.setTitle(component, event, agency);
    }
})