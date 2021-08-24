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

    }
})
