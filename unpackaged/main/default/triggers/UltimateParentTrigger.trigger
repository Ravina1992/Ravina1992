trigger UltimateParentTrigger on Account (after update) {
    
    			
    
    }













/**  if(trigger.isUpdate){ 
    set<Id> opptyIdSet = new set<Id>();
       List<Account> accList=[SELECT Id, Name, ParentId, Ultimate_Parent_Account__c, NumberOfEmployees, Ultimate_Parent__c FROM Account ];

    for(Account a: trigger.new){
            if(a.ParentId != Null){
                      a.addError('You are trying to remove last contact status checkbox which is not allowed');

            //   opptyIdSet.add(a.Ultimate_Parent_Account__c);
            }
            }
        } **/