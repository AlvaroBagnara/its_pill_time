import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:its_pill_time/pages/Home/homePage.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TimeOfDay? time;
  TimeOfDay? lastTime;

  final formKey = GlobalKey<FormState>();
  String medName = '';
  String? medFrequency = '1';
  bool lastTimeActive = false;

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(child: Text("1"), value: "1"),
    DropdownMenuItem(child: Text("2"), value: "2"),
    DropdownMenuItem(child: Text("3"), value: "3"),
    DropdownMenuItem(child: Text("4"), value: "4"),
    DropdownMenuItem(child: Text("5"), value: "5"),
    DropdownMenuItem(child: Text("6"), value: "6"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Page"),
        centerTitle: true,
        backgroundColor: Color(0xFF7c7c7c),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
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
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Add Pill",
                    style: GoogleFonts.lexend(
                        textStyle: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        //Name
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name:",
                                    style: GoogleFonts.lexend(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Med Name",
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(15),
                                    child:
                                        Icon(Icons.drive_file_rename_outline),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.length < 3) {
                                    return 'Enter at least 3 characters';
                                  } else {
                                    medName = value;
                                    return null;
                                  }
                                },
                                maxLength: 30,
                                onSaved: (value) =>
                                    setState(() => medName = value!),
                              ),
                            ],
                          ),
                        ),
                        //Frequency
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Frequency:",
                                    style: GoogleFonts.lexend(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField<String>(
                                value: medFrequency,
                                items: dropdownItems,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    medFrequency = newValue!;
                                    if (medFrequency == "1") {
                                      lastTimeActive = false;
                                    } else {
                                      lastTimeActive = true;
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "Med Name",
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 16.0),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Icon(Icons.format_list_numbered),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Firt Time
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "First Time:",
                                    style: GoogleFonts.lexend(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Builder(
                                builder: ((context) => ElevatedButton(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14, horizontal: 108),
                                        child: time != null
                                            ? Text(
                                                time!.hour
                                                        .toString()
                                                        .padLeft(2, "0") +
                                                    ":" +
                                                    time!.minute
                                                        .toString()
                                                        .padLeft(2, "0"),
                                                style: TextStyle(fontSize: 24),
                                              )
                                            : Text("Select Time"),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF09dd9d)),
                                      onPressed: () {
                                        pickTime(context);
                                      },
                                    )),
                              ),
                            ],
                          ),
                        ),

                        //Last Time
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Last Time:",
                                    style: GoogleFonts.lexend(
                                        textStyle: TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Builder(
                                builder: ((context) => ElevatedButton(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14, horizontal: 108),
                                        child: lastTime != null
                                            ? Text(
                                                lastTime!.hour
                                                        .toString()
                                                        .padLeft(2, "0") +
                                                    ":" +
                                                    lastTime!.minute
                                                        .toString()
                                                        .padLeft(2, "0"),
                                                style: TextStyle(fontSize: 24),
                                              )
                                            : Text("Select Time"),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF09dd9d)),
                                      onPressed: lastTimeActive
                                          ? () {
                                              pickLastTime(context);
                                            }
                                          : null,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(
                          builder: ((context) => ElevatedButton(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 122),
                                  child: Icon(
                                    Icons.done,
                                    size: 36,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF09dd9d)),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print(
                                        "${medFrequency} - ${medName} - ${time} - ${lastTime} ");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Color(0xFF09dd9d),
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Pill Added '),
                                              Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 16,
                                              )
                                            ],
                                          )),
                                    );
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  } else {
                                    null;
                                  }
                                },
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 4, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() {
      time = newTime;
    });
  }

  Future pickLastTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 4, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: lastTime ?? initialTime,
    );

    if (newTime == null) return;

    setState(() {
      lastTime = newTime;
    });
  }
}
