class Record {

  String _title;
  String _description;
  int _rating;
  double _lattitude;
  double _longitude;

  Record(this._title,this._description,this._rating,this._longitude,this._lattitude);

  String get Title{
    return _title;
  }

  String get Description{
    return _description;
  }

  int get Rating{
    return _rating;
  }

  double get Lattitude{
    return _lattitude;
  }

  double get Longitude{
    return _longitude;
  }

}
