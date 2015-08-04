trigger Example_GoodButSTILLInefficient on Opportunity (before insert, after update) {  
    Map<Id, User> mapUsers = new Map<Id, User>([SELECT Id, Profile.Name FROM User]);

    for (Opportunity oOpportunity : trigger.new) {
        User oOwner = mapUsers.get(oOpportunity.OwnerId);

        if (oOwner.Profile.Name == 'Executive') {
            oOpportunity.IsPrivate = true;
        }
    }
}

//QUERY COST IS MORE