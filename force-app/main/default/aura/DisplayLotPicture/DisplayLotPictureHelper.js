({
    doInit: function(component, event) {
        var action = component.get("c.getNeighborhood");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var finalHoodList = response.getReturnValue();  

                component.set("v.hoodList",finalHoodList);  
            }
        });
$A.enqueueAction(action);  },
    
        onPictureClick: function(component, event, helper) {
        var createRecordEvent = $A.get("e.force:onPictureClick");
        var selectedRecord = event.currentTarget;
        var propId =  selectedRecord.getAttribute("title");
        var action = component.get("c.getLots");

        action.setParams({
            propId : propId
        })
         action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var finalLotList = response.getReturnValue();
                component.set("v.lotList", finalLotList); 

                 component.set("v.isFirst", false); 
                 component.set("v.isSecond", true);
              
                
            }
        });
        $A.enqueueAction(action);
    },
   
    
    })