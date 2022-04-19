public class importDataFromCSVController {
    public blob Attach {get;set;}  
    string CurrentId ;
  
    public importDataFromCSVController ()
    {      
        CurrentId = ApexPages.CurrentPage().getParameters().get('Id');      
    }   
    public pagereference AttachNewFile()
    {
        try
        {
        delete [select id from Attachment where ParentId=:CurrentId];
        Blob b = Attach;
        Attachment At = new Attachment(Name ='NewFile'+'.jpg',body = b,parentId=CurrentId);
        insert At;       
        }Catch(Exception ee){}
        return null;
    }
}