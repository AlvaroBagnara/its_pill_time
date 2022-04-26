import 'package:flutter/material.dart';

import '../../../models/med.dart';

class HomePageLayout extends StatefulWidget {
  var meds = <Med>[];

  HomePage(){
    meds = [];
    meds.add(Med(title: "Teste 1", done: false));
    meds.add(Med(title: "Teste 2", done: true));
    meds.add(Med(title: "Teste 3", done: false));
  }


  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    
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
                child: Column(
                  children: [
                    Card(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("Paracetamol - 10:00 PM"),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xFF09dd9d),
                        checkColor: Colors.white,
                      ),
                    ),
                    Card(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("Vitamin C      - 10:00 PM"),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xFF09dd9d),
                        checkColor: Colors.white,
                      ),
                    ),
                    Card(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("Aspirin           - 10:00 PM "),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Color(0xFF09dd9d),
                        checkColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    });
  }
}
