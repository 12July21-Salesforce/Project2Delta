({
    doInit : function(component, event, helper) {
        helper.getColumns(component, event);
        },
    handleChange : function(component, event, helper){
        helper.filterChanged(component, event);
    }
})
