({
    getLots : function(component, helper) {
        var action = component.get('c.allBuyers');
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var results = response.getReturnValue();

                for (var i = 0; i < results.length; i++){
                    var result = results[i]
                    if(result.Neighborhood__c){
                        result.Neighborhood__cName = result.Neighborhood__r.Name;

                    }
                    if(result.Customer__c){
                        result.Customer__cName = result.Customer__r.Name;
                        result.Customer__rStatus__c = result.Customer__r.Status__c;
                        result.Customer__cBuy_Date__c = result.Customer__r.Buy_Date__c;
                    }
                }
                component.set('v.LotList', results);
                component.set('v.allData', results);
            }
        });
        $A.enqueueAction(action);

    },
    OneWeekH : function(component,helper){
        var method = component.get('c.BuyerSearchWithDate');
        //var number = 7;
        method.setParams({NumberofDays : '7'});
        method.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var resultsOW = response.getReturnValue();

                for (var i = 0; i < resultsOW.length; i++){
                    var resultOW = resultsOW[i]
                    if(resultOW.Neighborhood__c){
                        resultOW.Neighborhood__cName = resultOW.Neighborhood__r.Name;

                    }
                    if(resultOW.Customer__c){
                        resultOW.Customer__cName = resultOW.Customer__r.Name;
                        resultOW.Customer__rStatus__c = resultOW.Customer__r.Status__c;
                        resultOW.Customer__cBuy_Date__c = resultOW.Customer__r.Buy_Date__c;
                    }
                }
                component.set('v.StringTest', 'This is running and changed again!');
                component.set('v.WeekDaysList', resultsOW);
                //component.set('v.allData', results);
            }
        });
        $A.enqueueAction(method);
    },
    OneMonthH : function(component, helper){
        var method = component.get('c.BuyerSearchWithDate');
        //var number = 30;
        method.setParams({NumberofDays : '30'});
        method.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var resultsOW = response.getReturnValue();

                for (var i = 0; i < resultsOW.length; i++){
                    var resultOW = resultsOW[i]
                    if(resultOW.Neighborhood__c){
                        resultOW.Neighborhood__cName = resultOW.Neighborhood__r.Name;

                    }
                    if(resultOW.Customer__c){
                        resultOW.Customer__cName = resultOW.Customer__r.Name;
                        resultOW.Customer__rStatus__c = resultOW.Customer__r.Status__c;
                        resultOW.Customer__cBuy_Date__c = resultOW.Customer__r.Buy_Date__c;
                    }
                }
                component.set('v.StringTest', 'This is running and Dynamic OMG!');
                component.set('v.MonthDaysList', resultsOW);
                //component.set('v.allData', results);
            }
        });
        $A.enqueueAction(method);
    },
    OneYearH :function(component, helper){
        
        var method = component.get("c.BuyerSearchWithDate");
        //var number = 365;
        method.setParams({NumberofDays : '365'});
        method.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var resultsOW = response.getReturnValue();
                

                for (var i = 0; i < resultsOW.length; i++){
                    var resultOW = resultsOW[i]
                    if(resultOW.Neighborhood__c){
                        resultOW.Neighborhood__cName = resultOW.Neighborhood__r.Name;

                    }
                    if(resultOW.Customer__c){
                        resultOW.Customer__cName = resultOW.Customer__r.Name;
                        resultOW.Customer__rStatus__c = resultOW.Customer__r.Status__c;
                        resultOW.Customer__cBuy_Date__c = resultOW.Customer__r.Buy_Date__c;
                    }
                }
                component.set('v.StringTest', 'This is running');
                component.set('v.YearDaysList', resultsOW);
                //component.set('v.allData', results);
            }
        });
        $A.enqueueAction(method);
    }
})
