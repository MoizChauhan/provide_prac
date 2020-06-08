import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier{
  String _units;
  List<String> _waxlines;

  SettingsProvider(){
    _units = "Imperial";
    _waxlines = ['Swix', 'Toko'];
    loadPreferences();
  }

  //getter
  String get units => _units;
  List<String> get waxLines => _waxlines;
  int getLength(){
    return _waxlines.length;
  }

  //Setters
  void setUnits(String units){
    _units = units;
    notifyListeners();
    savePreferences();
  }
  
  void _setWaxes(List<String> waxLines){
    _waxlines = waxLines;
    notifyListeners();
  }

  void addWaxLine(String waxLine){
    if(_waxlines.contains(waxLine)== false)
    {
      _waxlines.add(waxLine);
      notifyListeners();
          savePreferences();

    }
  }

  

  
  void removeWaxLine(String waxLine){
    if(_waxlines.contains(waxLine)== true)
    {
      _waxlines.remove(waxLine);
      notifyListeners();
          savePreferences();

    }
  }

  //Save data after quiting
  savePreferences() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString('units', _units);
    prefs.setStringList('waxLines', _waxlines);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String units = prefs.getString('units');
    List<String> waxLines =  prefs.getStringList('waxLines');
    if(units != null){
      setUnits(units);
    }
    if(waxLines != null){
      _setWaxes(waxLines);
    }
  }

}