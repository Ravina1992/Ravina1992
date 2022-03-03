trigger ForceCloseCase on Case (before update) {
    
    Set<Id> setCaseId = new Set<Id>();
    for (Case theCase:trigger.new) {
        
        if(theCase.Status=='Resolution Delivered' || theCase.Status=='Confirm Pending' && theCase.BusinessHoursId=='01m5f000000KPu0AAG'){
            
	          //  if(theCase.BusinessHoursId=='01m5f000000KPu0AAG'){
                
                theCase.addError('Error');
          //  }
        }
    }

}