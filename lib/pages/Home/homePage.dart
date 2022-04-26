import 'package:flutter/material.dart';
import 'package:its_pill_time/pages/Add/addPage.dart';


import 'widgets/homePageLayout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed;

    final _placeholder = Opacity(
        opacity: 0,
        child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Color(0xFF7c7c7c),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF09dd9d),
          child: Icon(Icons.notification_add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPage()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.fact_check_outlined,
                size: 30,
                color: Color(0xFF09dd9d),
              ),
            ),
            _placeholder,
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.manage_search,
                size: 30,
                color: Color(0xFF09dd9d),
              ),
            ),
          ],
        ),
      ),
      body: HomePageLayout(),
    );
  }
}
