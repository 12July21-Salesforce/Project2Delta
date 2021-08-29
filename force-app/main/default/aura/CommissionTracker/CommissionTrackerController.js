({
    doInit : function(component, event, helper) {
        let mydate = component.get("v.commission.Date_Sold__c");
        if(mydate) {
            component.set("v.formatdate", new Date(mydate));
        }
    },
	clickPaid : function(component, event, helper) {
        let commission = component.get("v.commission");
        let updateEvent = component.getEvent("updateCommission");
        updateEvent.setParams({ "commission" : commission });
        updateEvent.fire();
	}
})