import 'package:flutter/material.dart';

class Med {
  String title = "";
  bool done = false;
  String firstTime = "";
  TimeOfDay? lastTime;
  String frequency = "";

  Med({required this.title, required this.done, required this.firstTime, this.lastTime, this.frequency = "1"});

  Med.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
    frequency = json['frequency'];
    firstTime = json['firstTime'];
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    data['frequency'] = this.frequency;
    data['firstTime'] = this.firstTime;
    data['lastTime'] = this.lastTime;
    return data;
  }

  String toString(){
    return "${title} - ${frequency} - ${done} - ${firstTime} - ${lastTime}";
  }
}
