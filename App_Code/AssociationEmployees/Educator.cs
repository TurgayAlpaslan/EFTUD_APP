public class Educator
{
	public Educator()
	{		
	}
    int _ID;
    int _orderNr;
    string _name;
    string _surname;
    string _description;

    public int ID { get { return _ID; } }
    public int OrderNr { get { return _orderNr; } }
    public string Name { get { return _name; } }
    public string Surname { get { return _surname; } }
    public string Description { get { return _description; } }

    public Educator(int id, int orderNr, string name, string surname, string description)
    {
        _ID = id;
        _orderNr = orderNr;
        _name = name;
        _surname = surname;
        _description = description;
    }
}
