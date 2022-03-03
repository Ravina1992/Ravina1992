public class CreateEntriesInSurveyInvitationRespRL {
    // Utility to create SurveyInvitation and SurveySubject record
    public static void addEntry(String associatedRecordId, String surveyId, String participantId) {
        String invitationId = createSurveyInvitation(surveyId, participantId);
 
        createSurveySubject(invitationId, associatedRecordId);
    }
 
    // Create an unauthenticated invitation by setting the surveyId and participantId
    private static String createSurveyInvitation(String surveyId, String participantId) {
        SurveyInvitation surveyInv = new SurveyInvitation();
        surveyInv.Name = 'SurveyInvitationForCase'; // add your survey invitation name here
        surveyInv.ParticipantId = participantId;
        surveyInv.CommunityId = '0DBRM0000004n4y'; //add your community id here
        surveyInv.OptionsAllowGuestUserResponse = true;
        surveyInv.SurveyId = surveyId;
 
        // Insert the SurveyInvitation Record
        insert surveyInv;
 
        return surveyInv.Id;
    }
 
    // Associate the above invitation to the required record (eg: Case, Opportunity...)
    private static void createSurveySubject(String invitationId, String associatedRecordId) {
        SurveySubject subj = new SurveySubject();
        subj.Name = 'Sur_Subject_for_invitation';
        subj.ParentId = invitationId; // similary you can use survey response id to associate survey subject to a response record.
        subj.SubjectId = associatedRecordId;
 
        // Insert the SurveySubject Record
        insert subj;
    }
}