import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_app/screens/for_test.dart';
import 'package:vocabulary_app/screens/vocabulary.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    PageController _myPage = PageController(initialPage: 0);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Container(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30.0,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.book),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.adb),
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(1);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      //TODO show FAB only on vocabulary screen
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          Vocabulary(),
          ForTest(),
        ], // Comment this if you need to use Swipe.
      ),
    );
  }
}
