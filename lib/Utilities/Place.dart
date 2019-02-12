class Place {

  String _title;
  String _description;
  double _rating;
  double _lattitude;
  double _longitude;

  Place(this._title,this._description,this._rating,this._longitude,this._lattitude);

  String get Title{
    return _title;
  }

  String get Description{
    return _description;
  }

  double get Rating{
    return _rating;
  }

  double get Lattitude{
    return _lattitude;
  }

  double get Longitude{
    return _longitude;
  }

}
