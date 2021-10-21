public class SubCategory
{	
    #region Constructors
    
    public SubCategory()
    {
        //
        // TODO: Add constructor logic here
        //
    }  

    public SubCategory(int subCatId, int catId, int orderNr, string subCatName, string link, string description)
    {
        _subCatId = subCatId;
        _catId = catId;
        _orderNr = orderNr;
        _subCatName = subCatName;
        _link = link;
        _description = description;
    }

    #endregion

    #region Members

    protected int _subCatId;
    protected int _catId;
    protected int _orderNr;  
    protected string _subCatName;
    protected string _link;
    protected string _description;   
   
    #endregion

    #region Properties

    public int SubCatID
    {
        get { return _subCatId; }        
    }

    public int CatID
    {
        get { return _catId; }
    }

    public int OrderNr
    {
        get { return _orderNr; }        
    }  

    public string SubCatName
    {
        get { return _subCatName; }        
    }

    public string Link
    {
        get { return _link; }
    }

    public string Description
    {
        get { return _description; }        
    }    

    #endregion   
}
