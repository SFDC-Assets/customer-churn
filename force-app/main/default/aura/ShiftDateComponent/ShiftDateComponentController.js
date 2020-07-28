({
    shiftDates : function(component, event) {
        
        let button = component.find('shiftbuttonid');
        button.set('v.disabled',true);
        
        
        var spinner = component.find("mySpinner");
        $A.util.toggleClass(spinner, "slds-hide");
        $A.util.toggleClass(spinner, "slds-show");
        
        
        var action = component.get("c.shiftDates2");
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            
            var resultsToast = $A.get("e.force:showToast");
            if (state == "SUCCESS") {
                resultsToast.setParams({
                    "type":"success",
                    "title": "Success!",
                    "message": "Go Ahead and Start Building Your Prediction!"
                });
                resultsToast.fire();
            }else{
                
                resultsToast.setParams({
                    "type":"error",
                    "title": "Failed!",
                    "message": "Unable to Shift Dates"
                });
                resultsToast.fire();
            }
            
            console.log('Before Dismiss Action panel');
            var spinner = component.find("mySpinner");
			$A.util.toggleClass(spinner, "slds-show");
            $A.util.toggleClass(spinner, "slds-hide");
            console.log('hide spinner 2');
            
            var dismissActionPanel = $A.get("e.force:closeQuickAction");
            dismissActionPanel.fire();
            
			

        });
        $A.enqueueAction(action);
    }
})