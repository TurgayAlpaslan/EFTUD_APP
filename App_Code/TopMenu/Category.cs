public class Category
{
	#region Constructors

    public Category()
	{
    }

    public Category(int catId, int orderNr, string catName, string link, string description)
    {
        _catId = catId;
        _orderNr = orderNr;
        _catName = catName;
        _link = link;
        _description = description;
    }

    #endregion

    #region Members

    protected int _catId;
    protected int _orderNr;  
    protected string _catName;
    protected string _link;
    protected string _description;   
   
    #endregion

    #region Properties

    public int CatID
    {
        get { return _catId; }        
    }

    public int OrderNr
    {
        get { return _orderNr; }        
    }  

    public string CatName
    {
        get { return _catName; }        
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
