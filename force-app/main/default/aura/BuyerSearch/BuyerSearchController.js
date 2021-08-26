({
    doInit : function(component, event, helper) {
        //Set the columns perm
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
        //Retrieves all data set by the button pushed {changes}
        var allRecs = component.get("v.allData");
        //Get the input you are typing and creating an empty array
        var searchFilter = event.getSource().get("v.value").toUpperCase();
        var tempArray = [];
        var i;
        for(i=0; i<allRecs.length; i++){
            //Compares the records currently displayed with the search filter that changes with typing...toUpperCase makes it not case-sensitve
            if((allRecs[i].Neighborhood__cName && allRecs[i].Neighborhood__cName.toUpperCase().indexOf(searchFilter) != -1) ||
            (allRecs[i].Name && allRecs[i].Name.toUpperCase().indexOf(searchFilter) != -1) ||
            (allRecs[i].Customer__cName && allRecs[i].Customer__cName.toUpperCase().indexOf(searchFilter)!= -1) ||
            (allRecs[i].Status__c && allRecs[i].Status__c.toUpperCase().indexOf(searchFilter)!= -1) || 
            (allRecs[i].Customer__cBuy_Date__c && allRecs[i].Customer__cBuy_Date__c.toUpperCase().indexOf(searchFilter)!= -1)) {
                tempArray.push(allRecs[i]);
            }
        }
        //set the list to display
        component.set("v.LotList", tempArray);
    },
    OneWeek : function(component, event, helper){
        //Set numberofdays parameter thats used in apex controller to 7 days prior
        component.set('v.NumberofDays', 7);
        helper.getLots(component);
        component.set('v.ButtonDisableOneWeek',true);
        component.set('v.BDOneMonth', false);
        component.set('v.BDOneYear', false);
        component.set('v.BDAll', false);
    },
    OneMonth : function(component,event, helper){
        //Set numberofdays parameter thats used in apex controller to 30 days prior
        component.set('v.NumberofDays', 30);
        helper.getLots(component);
        component.set('v.BDOneMonth', true);
        component.set('v.ButtonDisableOneWeek',false);
        component.set('v.BDOneYear', false);
        component.set('v.BDAll', false);

    },
    OneYear : function(component, event, helper){
        //Set numberofdays parameter thats used in apex controller to 365 days prior
        component.set('v.NumberofDays', 365);
        helper.getLots(component);
        component.set('v.BDOneYear', true);
        component.set('v.ButtonDisableOneWeek',false);
        component.set('v.BDOneMonth', false);
        component.set('v.BDAll', false);
  
    },
    ShowAllAgain : function(component,event, helper){
        //Set numberofdays parameter thats used in apex controller to 10000 days prior
        component.set('v.NumberofDays', 10000);
        helper.getLots(component);
        component.set('v.BDAll', true);
        component.set('v.ButtonDisableOneWeek',false);
        component.set('v.BDOneMonth', false);
        component.set('v.BDOneYear', false);

    }
})
