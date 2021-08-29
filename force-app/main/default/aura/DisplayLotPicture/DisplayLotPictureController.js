({
    doInit : function(component, event, helper) {
	helper.doInit(component, event);  
    },

    onPictureClick: function(component, event, helper) {
        helper.onPictureClick(component, event);
    },
     backClick : function(component, event, helper) {
        component.set("v.isFirst", true); 
        component.set("v.isSecond", false);

    },
 navigate : function(component) {
        var nav = component.find("navigate");
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Lot__c',
                actionName: 'list'
            }
           
        };
        nav.navigate(pageReference);}
})