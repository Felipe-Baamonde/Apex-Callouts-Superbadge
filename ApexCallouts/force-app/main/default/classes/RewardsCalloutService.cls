public class RewardsCalloutService{

    public static Integer submitUsersForRewardCallout(String jsonBody) {
        //Set Endpoint from Named Credential
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:IntegrationSB__BalancedLiving/rewards');
        request.setHeader('Content-Type', 'application/json');
        request.setMethod('POST');
        request.setBody(jsonBody);
        
        //Make HTTP Callout
        Http http = new Http();
        HttpResponse response;
        Integer responseCode;
        try {
            response = http.send(request);
            responseCode = response.getStatusCode();
            System.debug('Status Code:' + responseCode);
            System.debug('Retorno:' + response.getBody());
        } catch (Exception e) {
            System.debug('Error:' + e.getMessage());
            responseCode = 500;
        }
        //Update to return response status code
        return responseCode;    
    }
}