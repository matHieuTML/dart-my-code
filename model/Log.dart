class Log 
{
  String _message;
  DateTime _time;

  Log(this._message, this._time);

  String get message => _message;
  DateTime get time => _time;

  set message(String message) => _message = message;
  set time(DateTime time) => _time = time;
}