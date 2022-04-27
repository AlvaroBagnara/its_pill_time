import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/med.dart';

class HomePageLayout extends StatefulWidget {

  List<Med> meds = <Med>[];

  // HomePageLayout() {
  //   meds.add(Med(title: "Teste 1", done: false, firstTime: TimeOfDay(hour: 0,minute: 0),lastTime: null));
  //   meds.add(Med(title: "Teste 2", done: true, firstTime: TimeOfDay(hour: 0,minute: 0),lastTime: null));
  //   meds.add(Med(title: "Teste 3", done: false, firstTime: TimeOfDay(hour: 0,minute: 0),lastTime: null));
  // }
  
  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {

  _HomePageLayoutState(){
    load();
  }

  save() async{
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", jsonEncode(widget.meds));
  }

  void remove(int index){
    setState(() {
      widget.meds.removeAt(index);
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("data");

    if (data != null){
      Iterable decoded = jsonDecode(data);
      List<Med> result = decoded.map((e) => Med.fromJson(e)).toList();
      setState(() {
        widget.meds = result;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.alarm,
                size: 60,
                color: Color(0xFF09dd9d),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF09dd9d), width: 4),
                ),
                child: Center(
                  child: Text(
                    "12:00",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: ListView.builder(
                    itemCount: widget.meds.length,
                    itemBuilder: (context, int index) {
                      final item = widget.meds[index];
                      return Dismissible(
                        key: Key(index.toString()),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(item.title),
                          value: item.done,
                          onChanged: (value) {
                            setState(() {
                              item.done = value!;
                              save();
                            });
                          },
                          activeColor: Color(0xFF09dd9d),
                          secondary: Text(item.firstTime.toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ),
                        onDismissed: (direction){
                          remove(index);
                          save();
                        },
                      );
                    },
                  ))
            ],
          ),
        ),
      ));
    });
  }
}
