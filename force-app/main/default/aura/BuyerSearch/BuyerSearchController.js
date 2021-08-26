({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Neighborhood', fieldName: 'Neighborhood__cName', type: 'text'},
            {label: 'Lot Name', fieldName:'Name', type: 'text'},
            {label: 'Status',fieldName: 'Status__c', type: 'text' },
            {label: 'Customer', fieldName: 'Customer__cName', type: 'text'},
            {label: 'Status of Customer', fieldName:'Customer__rStatus__c', type: 'text'},
            {label: 'Buy Date', fieldName:'Customer__cBuy_Date__c', type: 'Date'}
        ]);

    },
    searchTable : function(component, event, helper){
        var allRecs = component.get("v.allData");
        var searchFilter = event.getSource().get("v.value").toUpperCase();
        var tempArray = [];
        var i;
        for(i=0; i<allRecs.length; i++){
            if((allRecs[i].Neighborhood__cName && allRecs[i].Neighborhood__cName.toUpperCase().indexOf(searchFilter) != -1) ||
            (allRecs[i].Name && allRecs[i].Name.toUpperCase().indexOf(searchFilter) != -1) ||
            (allRecs[i].Customer__cName && allRecs[i].Customer__cName.toUpperCase().indexOf(searchFilter)!= -1) ||
            (allRecs[i].Status__c && allRecs[i].Status__c.toUpperCase().indexOf(searchFilter)!= -1)){
                tempArray.push(allRecs[i]);
            }
        }
        component.set("v.LotList", tempArray);
    },
    OneWeek : function(component, event, helper){
        component.set('v.NumberofDays', 7);
        helper.getLots(component);
    },
    OneMonth : function(component,event, helper){
        component.set('v.NumberofDays', 30);
        helper.getLots(component);

    },
    OneYear : function(component, event, helper){
        component.set('v.NumberofDays', 365);
        helper.getLots(component);
  
    },
    ShowAllAgain : function(component,event, helper){
        component.set('v.NumberofDays', 1000);
        helper.getLots(component);

    }
})
