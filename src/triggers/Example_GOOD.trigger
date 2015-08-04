trigger Example_GOOD on Opportunity (before insert, after update) {  
    Set<Id> ownerIds = new Set<Id>();

    for (Opportunity oOpportunity : trigger.new) {
        ownerIds.add(oOpportunity.OwnerId);
    }

    Map<Id, User> mapUsers = new Map<Id, User>([SELECT Id, Profile.Name FROM User WHERE Id IN :ownerIds]);

    for (Opportunity oOpportunity : trigger.new) {
        User oOwner = mapUsers.get(oOpportunity.OwnerId);

        if (oOwner.Profile.Name == 'Executive') {
            oOpportunity.IsPrivate = true;
        }
    }
}