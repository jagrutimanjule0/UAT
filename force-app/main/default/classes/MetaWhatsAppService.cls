public class MetaWhatsAppService {
    public static void sendWhatsApp(String clientName, String phoneNumber) {
        String token = 'EAAImoZBLvlOQBO8ZAZBidBPLWXAOoTiDctNLZCVYf1Wo2AE1YuZCzKi4nqrVNZAQVsVyu55E7UnQZBHWYRnivrbEvqQOvc4LHW5vynaCaF17E6FgA0AwcuzAZCONsVwB96fk93ZBG13i6uMrtaYT6E2h3rGhhqroKZAz9CQfQ9bJKX8LpKB7viwHfYIsS2NP6iZBgnUEOuvn5Jf9mnd6ZBaNW8TjAphqzsn7ZC45pBJYzo5YZD';
            String phoneNumberId = '632789519926446';
        String endpoint = 'https://graph.facebook.com/v17.0/' + phoneNumberId + '/messages';

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer ' + token);
        req.setHeader('Content-Type', 'application/json');

        String body = JSON.serialize(new Map<String, Object>{
            'messaging_product' => 'whatsapp',
            'to' => phoneNumber,
            'type' => 'text',
            'text' => new Map<String, String>{
                'body' => 'Hi ' + clientName + ', are you available for a quick property call?'
            }
        });
        system.debug('body'+body);

        req.setBody(body);
        Http http = new Http();
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
    }
}