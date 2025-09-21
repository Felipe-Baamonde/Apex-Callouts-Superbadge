global class AccessibilityProjectBilling{
    @future(callout = true)
   public static void callBillingService(String projectId, Decimal billingAmount){
     BillingServiceProxy.InvoicesPortSoap11  stub = new BillingServiceProxy.InvoicesPortSoap11();
        //Setup username, password, billAmount, and projectid in BillingServiceProxy.project and then call billProject method
        BillingServiceProxy.project project = new BillingServiceProxy.project();
        project.billAmount = billingAmount;
        project.projectId = projectId;
        project.username = '{!$Credential.BillingServiceCredential.username}';
        project.password = '{!$Credential.BillingServiceCredential.password}';
         //If response is ok set Accessibility Project Status = Complete
            try {
              String status = stub.billProject(project);
              if(status == 'ok'){
                Accessibility_Project__c accProject = [SELECT Id, Status__c FROM Accessibility_Project__c WHERE Id = :projectId LIMIT 1];
                accProject.Status__c = 'Complete';
                update accProject;
              }
            } catch (Exception e) {
              system.debug('Erro: '+ e.getMessage());
            }
    }
}