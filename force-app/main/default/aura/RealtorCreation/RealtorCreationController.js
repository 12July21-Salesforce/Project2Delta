({
    doInit : function(component, event, helper){
        helper.fetchAllRealtorUtil(component);
    },
    handleCreate : function(component, event, helper) {
        component.set( 'v.newRecord', true);
        component.set( 'v.showList', false);
    },
    handleShowList : function(component, event, helper) {
        component.set( 'v.newRecord', false);
        component.set( 'v.showList', true);
        helper.fetchAllRealtorUtil(component);
    }
})