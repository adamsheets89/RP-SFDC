@isTest
public without sharing class DeveloperTestApexController_Test {
    static {
        List<Account> accounts = new List<Account>();
        for (Integer i=0; i<10; i++) {
            accounts.add(new Account(
                Name='foo bar ' + i,
                NumberOfEmployees = 13 * i 
            ));
        }
        insert accounts;
    }
    @isTest private static void testGreenFlow() {

        Test.startTest();
        List<Account> result = DeveloperTestApexController.getAccountList();
        Test.stopTest();

        System.assertEquals(5, result.size(), 'Given many accounts, when getAccountList is called, it should only return 5');

    }
}
