//the Survey Response record

trigger SurveyResponseForCase on SurveyResponse (after  insert) {
	System.debug('Inside Survey response trigger ');
     for(SurveyResponse sr: Trigger.New)
    {
      SurveySubject subj = new SurveySubject();
        subj.Name = 'Sur_Subject_for_response';
        subj.ParentId = sr.id; //Associating survey response id
        
       //Get the associatedRecordId recordId (like Case, Opportunity etc) using the SurveyInvitation Id and 
       //assigning it to SubjectId, assuming we inserted SurveySubject record for the associated invitation 
       //using the previous code
       
       List<SurveySubject> SurSubj=[select subjectid from SurveySubject where parentid = :sr.invitationId];
        for(SurveySubject sub:SurSubj){
            String ids=String.valueOf(sub.subjectid).substring(0,3);
            if('500'.equals(ids)){
                
                subj.SubjectId =sub.subjectid;
        // Insert the SurveySubject Record
            insert subj;
                break;
        
            }
        }
    }
}