({
    getRecords : function(component, helper) { 
        var action = component.get("c.retrieveCustomers");
        
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
                component.set("v.allData", response.getReturnValue());
                component.set("v.dataCount", response.getReturnValue().length);
                component.set("v.currentPageNumber",1);
                helper.setPageDataAsPerPagination(component, helper);
            }
        });
        $A.enqueueAction(action);
    },

    setPageDataAsPerPagination : function(component, helper) {
        var data = [];
        var totalPages = component.get("v.totalPages");
        var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        var rows = component.get("v.allData");
        var totalRows = component.get("v.dataCount");
         
        if(pageNumber < totalPages) {
            var lastIndex = pageNumber * pageSize; 
        }
        else {
            var lastIndex = totalRows;
        }
        
        // creating data-table data
        for(var i = (pageNumber-1)*pageSize;i < lastIndex;i++){
                var row = rows[i];
                if (row.Realtor__c) {
                    row.RealtorName = row.Realtor__r.Name;
                }

                if(rows[i]){
                    data.push(rows[i]);
                }
        }
        component.set("v.data", data);
    },
})
