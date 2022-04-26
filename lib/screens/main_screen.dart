// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';

import '../widgets/app_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  String _content = "أستغفر الله";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          /// A button displayed floating above [body], in the bottom right corner.
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "أذكاري",
            style: TextStyle(fontFamily: "Cairo", fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed((context), "/about_app_screen");
              },
              icon: Icon(Icons.info),
            ),
            PopupMenuButton<String>(
                offset: Offset(20, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onSelected: (String selectedContent) {
                  if (_content != selectedContent) {
                    setState(() {
                      _content = selectedContent;
                      _counter = 0;
                    });
                  }
                },
                itemBuilder: (context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(
                      child: Text(
                        "أستغفر الله",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      value: "أستغفر الله",
                    ),
                    PopupMenuItem(
                      child: Text(
                        "سبحان الله",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: "سبحان الله",
                    ),
                    PopupMenuItem(
                      child: Text(
                        "الحمدُ لله",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      value: "الحمدُ لله",
                    ),
                  ];
                }), // PopupMenuItem or PopupMenuEntry
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/736x/a0/a7/05/a0a7051f61ba1277c14c60cb9fde9aa4.jpg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              // Main Axis is y-axis
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle, // we can't use with it borderRadius
                  ),
                  child: Image.network(
                      "https://ae01.alicdn.com/kf/H013739847b8049c4b3a27fae93a5b9ebz/33.jpeg",
                      fit: BoxFit.cover),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // لو لاحظت بدون كليب دوت انتي ايلياس فوق هنلاقي انو الابناء للكارد اللي هو الكونتاينر ما اخخدش حواف .. ف عشان هيك بنستخدم اللي فوقها عشان نجبرهم ياخدوا حواف
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _content,
                          // since the language is arabic >> we have to change the direction from ltr to rtl by using Directionality above
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        color: Colors.teal,
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Text(
                          _counter.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    AppButton(
                      flex: 2,
                      onPressed: () {
                        // ++_counter; // بهيك حالة لحال بدون سيت ستيت بتغيرش عمستوى الشاشة بتغير بس قيمة المتغير برا الشاشة ف عشان هيك لازم نستخدم سيت ستيت
                        setState(() {
                          ++_counter;
                        });
                      },
                      text: "تسبيح",
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                    AppButton(
                      onPressed: () {
                        setState(() {
                          // this method is used to generalize the event of changed-data into the screen
                          _counter = 0;
                        });
                      },
                      text: "تصفير",
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
