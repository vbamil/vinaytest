trigger Example_bad on Opportunity (before insert, before update) {  
    for (Opportunity oOpportunity : trigger.new) {
        User oOwner = [SELECT Id, Profile.Name FROM User WHERE Id = :oOpportunity.Id];

        if (oOwner.Profile.Name == 'Executive') {
            oOpportunity.IsPrivate = true;
        }
    }
}

//Too many SOQL queries