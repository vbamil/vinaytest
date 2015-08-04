trigger AccountTrigger on Account (Before Insert,Before Update,After Insert,After Update) { 
  
  If(trigger.isBefore){
     If(Trigger.isInsert) {
         
         system.debug(' #### Trigger.new : ' + Trigger.new);
         AccountClass.UpateAccountRating(Trigger.new);
      
      }
       
      If(Trigger.IsUpdate) {
         system.debug(' #### Trigger.new : ' + Trigger.new);
         AccountClass.UpateAccountRating(Trigger.new);
      }
   }
   
   If(Trigger.isAfter){
      If(Trigger.isInsert) {
         // After Insert Code
      }
      If(Trigger.IsUpdate) {
         // After Update Code
      }
   }
}