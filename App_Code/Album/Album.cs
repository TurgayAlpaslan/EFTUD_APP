public class Album {

	private int _id;
	private int _count;
	private string _caption;	

	public int AlbumID { get { return _id; } }
	public int Count { get { return _count; } }
	public string Caption { get { return _caption; } }    

	public Album(int id, int count, string caption) {
		_id = id;
		_count = count;
		_caption = caption;        
	}

}

