({
	doInit : function(component, event, helper) {        
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Status', fieldName: 'Status__c', type: 'text'},
            {label: 'Address', fieldName: 'Address__c', type: 'text'},
            {label: 'State', fieldName: 'State__c', type: 'text', sortable:true},
            {label: 'Home_Type', fieldName: 'Home_Type__c', type: 'text', sortable:true},
            
        ]);
        
        helper.getLots(component, helper);
    },
    
    onNext : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber+1);
        helper.setPageDataAsPerPagination(component, helper);
    },
    
    onPrev : function(component, event, helper) {        
        var pageNumber = component.get("v.currentPageNumber");
        component.set("v.currentPageNumber", pageNumber-1);
        helper.setPageDataAsPerPagination(component, helper);
    },
    
    selectedPagination : function(component, event, helper) {
        component.set("v.currentPageNumber", parseInt(event.getSource().get('v.name'))); //event.target.name
        helper.setPageDataAsPerPagination(component, helper);
    },
    
    onFirst : function(component, event, helper) {        
        component.set("v.currentPageNumber", 1);
        helper.setPageDataAsPerPagination(component, helper);
    },
    
    onLast : function(component, event, helper) {        
        component.set("v.currentPageNumber", component.get("v.totalPages"));
        helper.setPageDataAsPerPagination(component, helper);
    },
  
})