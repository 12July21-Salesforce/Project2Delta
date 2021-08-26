({
    getLots : function(component, helper) {
        //instatiating the Apex controller to run it
        var action = component.get('c.BuyerSearchWithDate');
        var NumberofDays = component.get('v.NumberofDays');
        action.setParams({NumberofDays : NumberofDays});
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var results = response.getReturnValue();
                results.forEach(function(results){
                    results.linkCustomer__cName='/'+results.Id;
                    results.linkNeighborhood__cName='/'+results.Id;
                    results.linkName='/'+results.Id;
                })
                //Change parent lookup fields that get Ids into Texts
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

                //Set the return values to the lists
                component.set('v.LotList', results);
                component.set('v.allData', results);
            }
        });
        $A.enqueueAction(action);

    }
})
