/**

 * @author: ercarval - topi

 */

@isTest

private class ListHelperTest {


    static List<Account> setupAccounts() {


        List<Account> accounts = new List<Account> {

                AccountFixtureFactory.build ( 'One' )

                , AccountFixtureFactory.build ( 'Two' )

        };


        accounts.get(1).CPF__c = '55265472053';


        insert accounts;


        return accounts;

    }



    @isTest

    static void shouldConvertListStringIntoSetIds() {


        List<Account> accounts = setupAccounts();


        List<String> accountIds = ListHelper.convertObjectListIntoStringList ( 'Id', accounts);


        Set<Id> accountIdWithSet = ListHelper.convertStringListIntoSetIds (accountIds);


        System.assert(accounts.size() == accountIds.size());

        System.assert(accountIds.size() == accountIdWithSet.size());


    }



    @isTest

    static void shouldConvertSObjectsIntoSetIds () {


        List<Account> accounts = setupAccounts();


        Set<Id> accountIds = ListHelper.convertObjectListIntoSetIds (accounts);


        System.assert(accounts.size() == accountIds.size());


    }


    @isTest

    static void shouldConvertSObjectsIntoListString() {


        List<Account> accounts = setupAccounts();


        List<String> accountNames = ListHelper.convertObjectListIntoStringList ( 'Name', accounts);


        System.assert(accounts.size() == accountNames.size());


    }




    @isTest

    static void shouldConvertSObjectsIntoIndexedObjectMap() {


        List<Account> accounts = setupAccounts();


        Map<String, SObject> indexedAccounts = ListHelper.indexListByField ('Id', accounts);


        System.assert(accounts.size() == indexedAccounts.size());

        System.assert( indexedAccounts.get(accounts[0].Id) != null);



    }


    @isTest

    static void shouldConvertSObjectsIntoGroupByFieldValue() {


        List<Account> accounts = setupAccounts();


        Map<String, List<SObject>> groupedAccounts = ListHelper.groupListByField ('Id', accounts);


        System.assert(accounts.size() == groupedAccounts.size());

        System.assert( groupedAccounts.get(accounts[0].Id) != null);


    }


    @isTest

    static void shouldConvertStringSetIntoListStrings () {


        List<Account> accounts = setupAccounts();


        Set<String> accountsId = new Set<String>{accounts.get(0).Id, accounts.get(1).Id};


        List<String> accountsIds = ListHelper.convertStringSetIntoListStrings(accountsId);


        System.assert(accountsId.size() == accountsIds.size());

        System.assert(accountsId.contains(accountsIds.get(0)));


    }


}