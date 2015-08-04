Public Class AccountClass {

   Public static void UpateAccountRating(List<Account> AccountList) {
    
         For(Account  a:AccountList) {
         system.debug('## account Name : ' + a.Name); 
         system.debug('## account Rating before : ' + a.Rating); 
         a.Rating = 'Hot';
         system.debug('## account Rating After : ' + a.Rating);
         } 
   }
}