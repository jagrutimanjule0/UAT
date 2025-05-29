trigger OpportunityTrigger on Opportunity (after insert) {
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'New Inquiry') {
            EmailServiceForOpportunity.sendEmailToClient(opp.Id);
        }
    }
}