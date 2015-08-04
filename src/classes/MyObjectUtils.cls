public with sharing class MyObjectUtils {
     public Static List<Account> myObjectList {
          get {
               system.debug('### line 4');
               if (myObjectList == null) {
                    myObjectList = [select Name from Account];
               system.debug('### line 7');
               }
 
               return myObjectList;
          }
          set;
     }
 
  /*  public static Map<String, Account> myObjectMap {
          get {
               if (myObjectMap == null) {
                    system.debug('### line 17 ' + myobjectList);
                    myObjectMap = new Map<String, Account>();
                    for (Account obj: myObjectList) {
                         myObjectMap.put(obj.Name, obj);
                    }
               }
 
               return myObjectMap;
          }
          set;
     } */
}