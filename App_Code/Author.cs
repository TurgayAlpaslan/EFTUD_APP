using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

/// <summary>
/// Summary description for Authors
/// </summary>
public class Author
{
    private Article _currentArticle;

    public Article CurrentArticle
    {
        get { return _currentArticle; }
        set { _currentArticle = value; }
    }

    private List<Article> _articleList;    

    public List<Article> ArticleList
    {
        get { return _articleList; }
        set { _articleList = value; }
    }
    private Article _lastArticle;

    public Article LastArticle
    {
        get { return _lastArticle; }
        set { _lastArticle = value; }
    }  

    private int _userID;

    public int UserID
    {
        get { return _userID; }
        set { _userID = value; }
    }

    private string _name;

    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }

    private string _surname;

    public string Surname
    {
        get { return _surname; }
        set { _surname = value; }
    }  

    private string _email;

    public string Email
    {
        get { return _email; }
        set { _email = value; }
    }

    private string _description;

    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }
    
    public Author()
	{	
	}
    public Author(int userID, string name, string surname, string email, string description)
    {        
        _userID = userID;
        _name = name;
        _surname = surname;       
        _email = email;
        _description = description;
    }
    public void SetArticles()
    {
        _articleList = ArticleManager.GetAllArticles(_userID);
        if (_currentArticle != null)
        {
            int position = 0;
            foreach (Article article in _articleList)
            {
                if (_currentArticle.ArticleID == article.ArticleID)
                {
                    _articleList.RemoveAt(position);
                    break;
                }
                position++;

            }
        }
    }
    //public List<Article> GetAllArticles()
    //{        
    //    List<Article> articleList = ArticleManager.GetAllArticles(_authorID);
    //    return articleList;
    //}
    public void SetLastArticle()
    {
        _lastArticle = ArticleManager.GetLastArticle(_userID);
    }
    public Article GetLastArticle()
    {
        Article article = ArticleManager.GetLastArticle(_userID);
        return article;
    }

}
