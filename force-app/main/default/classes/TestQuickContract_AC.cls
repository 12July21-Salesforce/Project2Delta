@isTest
private class TestQuickContract_AC {
    @isTest
    private static void TestQuickContract_AC() {
        Account acc = new Account();
        acc.Name = 'Test Account';

        insert acc;

        Contract Con = new Contract();
        Con.AccountId = acc.Id;
        Con.Status = 'Draft';

        

        QuickContract_AC.SubmitContract(Con);
    }
}