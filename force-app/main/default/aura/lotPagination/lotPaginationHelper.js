({
    getLots : function(component, helper) {
        try {
            var action = component.get("c.grabLots");
            //action.setStorable();
            action.setCallback(this,function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    console.log('Response Time: '+((new Date().getTime())-requestInitiatedTime));
                    component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
                    component.set("v.allData", response.getReturnValue());
                    component.set("v.currentPageNumber",1);
                    helper.setPageDataAsPerPagination(component, helper);
                }
            });
            var requestInitiatedTime = new Date().getTime();
            $A.enqueueAction(action);
        } catch(ex){
            console.log(ex);
        }
    },
    
    setPageDataAsPerPagination : function(component, helper) {
        var data = [];
        var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        var allData = component.get("v.allData");
        var x = (pageNumber-1)*pageSize;
        //creating data-table data
        for(; x<=(pageNumber)*pageSize; x++){
            if(allData[x]){
                data.push(allData[x]);
            }
        }
        component.set("v.data", data);
        
        helper.generatePageList(component, pageNumber);
    },
    
    generatePageList : function(component, pageNumber){
        pageNumber = parseInt(pageNumber);
        var pageList = [];
        var totalPages = component.get("v.totalPages");
        if(totalPages > 1){
            if(totalPages <= 10){
                var counter = 2;
                for(; counter < (totalPages); counter++){
                    pageList.push(counter);
                } 
            } else{
                if(pageNumber < 5){
                    pageList.push(2, 3, 4, 5, 6);
                } else{
                    if(pageNumber>(totalPages-5)){
                        pageList.push(totalPages-5, totalPages-4, totalPages-3, totalPages-2, totalPages-1);
                    } else{
                        pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
                    }
                }
            }
        }
        component.set("v.pageList", pageList);
    },
    
    // Used to sort the 'Age' column
    sortBy: function(field, reverse, primer) {
        var key = primer
            ? function(x) {
                  return primer(x[field]);
              }
            : function(x) {
                  return x[field];
              };

        return function(a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    },

    handleSort: function(component, event) {
        var sortedBy = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');

        var cloneData = component.get('v.data').slice(0);
        cloneData.sort((this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1)));
        
        component.set('v.data', cloneData);
        component.set('v.sortDirection', sortDirection);
        component.set('v.sortedBy', sortedBy);
    },
    
})