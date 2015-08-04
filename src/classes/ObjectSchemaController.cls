public class ObjectSchemaController {

    public PageReference pullMetadata() {
        return null;
    }

    public List<objectClass> standardObjList {get; set;}
    public List<objectClass> customObjList {get; set;}   
   
    //Constructor.
    public ObjectSchemaController(){
         
        //initializing the lists.
       customObjList  = new list<objectClass> ();
       standardObjList = new list<objectClass> ();
       List<schema.sObjectType> allObjects = Schema.getGlobalDescribe().Values();
        
    }
    
    public void ObjectList(){
         
       for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
             //check if its a custom or standard object.
                        if(objTyp.getDescribe().isSearchable() && objTyp.getDescribe().isCreateable()) {
                            if(objTyp.getDescribe().isCustom()){
                                customObjList.add(new objectClass(objTyp.getDescribe().getLabel(), objTyp.getDescribe().getName(), objTyp.getDescribe().getKeyPrefix(), objTyp.getDescribe().getChildRelationships(), objTyp.getDescribe().isCustomSetting(), objTyp.getDescribe().getRecordTypeInfos()));
                            } else {
                                standardObjList.add(new objectClass(objTyp.getDescribe().getLabel(), objTyp.getDescribe().getName(), objTyp.getDescribe().getKeyPrefix(), objTyp.getDescribe().getChildRelationships(), objTyp.getDescribe().isCustomSetting(), objTyp.getDescribe().getRecordTypeInfos()));
                            }
                        }
            }
       } 
        
    
   //This is a wrapper class. 
   public class objectClass{
        public string label{get;set;}
        public string apiName{get;set;}
        public string keyPrefix{get;set;}
        public boolean isCustomSet{get;set;}
        public list<Schema.ChildRelationship> childObjects;
        public list<string> childObjectArray{get;set;}
        public list<schema.RecordTypeInfo> recordTypes;
        public list<string> recordTypeArray{get;set;}
        public Boolean GetData{get;set;}
        public objectClass(string lab, string api, string prefix, list<Schema.ChildRelationship> childObj, boolean isCustomSetting, list<schema.RecordTypeInfo> recordTypeList){
            this.label = lab;
            this.apiName = api;
            this.KeyPrefix = prefix;
            this.isCustomSet = isCustomSetting;
            this.childObjectArray = new list<string>();
            this.recordTypeArray = new list<string>();
            if(childObj!=null){
                for(schema.childRelationShip ch : childObj){
                    if(ch.getChildSObject().getDescribe().isSearchable() && ch.getChildSObject().getDescribe().isCreateable()) 
                        this.childObjectArray.add(ch.getChildSObject().getDescribe().getLabel()+' ('+ch.getChildSObject().getDescribe().getName()+')');
                }
            }
            if(recordTypeList!= null){
                for(schema.RecordTypeInfo rt: recordTypeList){
                    this.recordTypeArray.add(rt.getName());
                }
            }
        }
    }
}