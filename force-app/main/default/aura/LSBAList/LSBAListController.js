({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Lot', fieldName: 'Name', type: 'text'},
            {label: 'Realtor', fieldName: 'RealtorName'},
            {label: 'Customer', fieldName: 'CustomerName'}
            ]);
        }
})
