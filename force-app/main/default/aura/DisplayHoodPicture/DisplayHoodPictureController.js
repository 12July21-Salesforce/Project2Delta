({
   doInit : function(cmp){

       var action = cmp.get("c.getContents");
         var picId = cmp.get("v.pictureList");
         var sObjectName = cmp.get("v.sObjectName");

         action.setParams({
             brandId : picId.Id,
             ObjectName : sObjectName
         })  
       action.setCallback(this, function(response) {
           var state = response.getState();
           if(cmp.isValid() && state === 'SUCCESS') {

               cmp.set("v.contents", response.getReturnValue()); 
           }
       });
        $A.enqueueAction(action);
    },
    

})