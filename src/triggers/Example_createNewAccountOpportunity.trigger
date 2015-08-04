trigger Example_createNewAccountOpportunity on Account (after insert) {  
    List<Opportunity> listOpportunities = new List<Opportunity>();

    for (Account oAccount : trigger.new) {
        Opportunity oOpportunity = new Opportunity();
        oOpportunity.Name = oAccount.Name;
        oOpportunity.AccountId = oAccount.Id;
        oOpportunity.CloseDate = System.today() + 30; //Closes 30 days from today

        listOpportunities.add(oOpportunity);
    }

    if (listOpportunities.isEmpty() == false) {
        Database.update(listOpportunities);
    }
}

//it is possible to perform a DML operation on the record that initiated the trigger event, 
//it should be avoided (risk of creating an infinite loop)