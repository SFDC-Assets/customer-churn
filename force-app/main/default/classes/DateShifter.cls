public class DateShifter {
    @AuraEnabled
    public static void shiftDates2(){
        List<AggregateResult> queryResult = [select  Max(First_Purchase__c)FirstPurchaseDate, Max(Last_Activity_Date__c)LastActivityDate  from Contact ];
        Date fpd = (Date) queryResult[0].get('FirstPurchaseDate');
        Date lad = (Date) queryResult[0].get('LastActivityDate');
        Date today = System.Date.today();
        Integer fpdShift = fpd.daysbetween(today)-3;
        Integer ladShift = lad.daysbetween(today)-1;
        System.debug ('shift fpd by ' + fpdShift);
        System.debug ('shift lad by ' + ladShift);
        if (fpdShift > 0 && ladShift > 0) {
            List<Contact> allContacts = [select id,First_Purchase__c,Last_Activity_Date__c from Contact];
            for (Contact c : allContacts) {
                c.First_Purchase__c = c.First_Purchase__c.addDays(fpdShift);
                c.Last_Activity_Date__c = c.Last_Activity_Date__c.addDays(ladShift);
            }
            //update all contacts
            update allContacts;
        }
    }
}