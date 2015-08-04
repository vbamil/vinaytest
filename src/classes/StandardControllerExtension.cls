public class StandardControllerExtension {

    Account acct;
    
    public StandardControllerExtension(ApexPages.standardController std) {
        acct = (Account) std.getRecord();
    }

    public void getchildOpps() {}
    public account accountids;
    Public List < Opportunity > childOppties {
    get {
        if (childOppties == null) {
            childOppties = [Select Name, Amount, StageName, CloseDate,
                OwnerId, IsClosed
                From Opportunity
                Where AccountId = : acct.Id
                and(IsWon = true or IsClosed = false)
            ];
        }
        return childOppties;
    }
    set;
}


    private void createTaskOnChildOpps() {
        List < Task > tasksToInsert = new List < Task > ();
        for (Opportunity opp: childOppties) {
            if (!opp.isClosed) {
                tasksToInsert.add(
                    new Task(
                        WhatId = opp.Id,
                        OwnerId = opp.OwnerId,
                        ActivityDate = Date.today() + 3,
                        Status = 'Not Started',
                        Subject = 'Send follow - up email to primary contact'
                    )
                );
            }
        }
        if (tasksToInsert.size() > 0) insert tasksToInsert;
    }
    public PageReference save() {
        if (acct.Rating == 'Hot') {
            createTaskOnChildOpps();
        }
        update acct;
        return new PageReference('/' + acct.Id);
    }


}