import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(20, 88, 113, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(20, 88, 113, 1),
          title: Text('To Do List',),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.add, color: Colors.white),

            )
          ],
        ),
        body: BodyWidget(),
      )
    );
  }
}

class BodyWidget extends StatefulWidget {
  State<StatefulWidget> createState() => BodyWidgetState();
}

enum WidgetMarker {a, b, c, d}

class BodyWidgetState extends State<BodyWidget> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.a;

  Widget getUrgentTask() {
    return Expanded(
      child:Container(
        height: 400,
        decoration: BoxDecoration(color: Color.fromRGBO(242, 80, 34, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )
        ),
      ) ,
    );
  }

  Widget getDailyTask() {
    return Expanded(
      child:Container(
        height: 400,
        decoration: BoxDecoration(color: Color.fromRGBO(127, 186, 0, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )
        ),
      ) ,
    );
  }

  Widget getWeeklyTask() {
    return Expanded(
      child:Container(
        height: 400,
        decoration: BoxDecoration(color: Color.fromRGBO(0, 164, 239, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )
        ),
      ) ,
    );
  }

  Widget getNotes() {
    return Expanded(
      child:Container(
        height: 400,
        decoration: BoxDecoration(color: Color.fromRGBO(255, 185, 0, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )
        ),
      ),
    );
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.a:
        return getUrgentTask();
      case WidgetMarker.b:
        return getDailyTask();
      case WidgetMarker.c:
        return getWeeklyTask();
      case WidgetMarker.d:
        return getNotes();
    }

    return getUrgentTask();
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 100, width: 179,
              margin: EdgeInsets.all(9),
              child: FlatButton(
                color: Color.fromRGBO(242, 80, 34, 1),
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  setState(() {
                    selectedWidgetMarker = WidgetMarker.a;
                  });
                },
                child: Text("Urgent Task", style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
            new Container(
              height: 100, width: 179,
              margin: EdgeInsets.all(9),
              child: FlatButton(
                color: Color.fromRGBO(127, 186, 0, 1),
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  setState(() {
                    selectedWidgetMarker = WidgetMarker.b;
                  });
                },
                child: Text("Daily Task", style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 100, width: 179,
              margin: EdgeInsets.all(9),
              child: FlatButton(
                color: Color.fromRGBO(0, 164, 239, 1),
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  setState(() {
                    selectedWidgetMarker = WidgetMarker.c;
                  });
                },
                child: Text("Weekly Task", style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
            new Container(
              height: 100, width: 179,
              margin: EdgeInsets.all(9),
              child: FlatButton(
                  color: Color.fromRGBO(255, 185, 0, 1),
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    setState(() {
                      selectedWidgetMarker = WidgetMarker.d;
                    });
                  },
                  child: Text("Notes", style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
            ),
          ],
        ),
        Container(
          child: getCustomContainer()
        )
      ],
    );
  }
}


