public class EmailServiceForOpportunity {
    public static void sendEmailToClient(Id oppId) {
        Opportunity opp = [
            SELECT Id, Name, StageName,
                   (SELECT Contact.Email, Contact.FirstName FROM OpportunityContactRoles LIMIT 1)
            FROM Opportunity
            WHERE Id = :oppId
            LIMIT 1
        ];

        if (opp.OpportunityContactRoles.isEmpty()) return;

        Contact con = opp.OpportunityContactRoles[0].Contact;
        if (String.isBlank(con.Email)) return;

        String subject = 'Thank you for your interest in our property!';
        String body = 'Hi ' + con.FirstName + ',\n\n' +
            'Thank you for your interest in the property opportunity "' + opp.Name + '". ' +
            'Our team will contact you shortly with more details.\n\n' +
            'Regards,\nReal Estate Team';

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { con.Email });
        mail.setSubject(subject);
        mail.setPlainTextBody(body);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}