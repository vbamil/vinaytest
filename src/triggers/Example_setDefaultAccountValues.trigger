trigger Example_setDefaultAccountValues on Account (before insert, before update) {  
    for (Account oAccount : trigger.new) {
        oAccount.Industry = 'Cloud Computing';
    }
}