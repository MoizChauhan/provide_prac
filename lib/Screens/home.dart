import 'package:flutter/material.dart';
import 'package:provide_prac/Provider/settings_provider.dart';
import 'package:provide_prac/Screens/settings.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Wax App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings,), onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
          },),
        ],),
      body: Container(child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Selected Unit: ${settingsProvider.units}',
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
              
              ),
            )),
            Align(alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Selected Filters:',
                style: TextStyle(color: Theme.of(context).accentColor, fontSize: 30),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: settingsProvider.getLength(),
              itemBuilder: (BuildContext context, int index){
              return Card(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    settingsProvider.waxLines[index],
                    style: TextStyle(color: Theme.of(context).accentColor, fontSize: 20),
                  ),
                ),
              ),);
            }),
          )
        ],
      ),)
    );
  }
}