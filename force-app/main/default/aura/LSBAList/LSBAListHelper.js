({
    getColumns : function(component, event) {
        component.set('v.columns', [
            {label: 'Lot', fieldName: 'Name', type: 'text'},
            {label: 'Realtor', fieldName: 'RealtorName'},
            {label: 'Customer', fieldName: 'CustomerName'}
            ]);
    },

    filterChanged : function(component, event){
        let agency = event.getParam("value");
        let updateEvent = component.getEvent("updateLots");
        updateEvent.setParams({"agency": agency });
        updateEvent.fire();
    }
})
