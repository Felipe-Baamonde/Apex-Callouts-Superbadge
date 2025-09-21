@isTest
public class BillingCalloutServiceTest {
    @isTest
    public static void testCallBillingService(){
        Accessibility_Project__c acc = new Accessibility_Project__c();
        acc.Amount__c = 100.00;
        insert acc;
        
        Test.startTest();
        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMock());
        AccessibilityProjectBilling.callBillingService(acc.Id, acc.Amount__c);
        Test.stopTest();
        
        Accessibility_Project__c testComplete = [SELECT Id, Status__c FROM Accessibility_Project__c WHERE Id =: acc.Id LIMIT 1];
        System.assertEquals(testComplete.Status__c, 'Complete', 'O status deveria ser Complete');
        
    }
}