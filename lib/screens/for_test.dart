import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocabulary_app/db/models/db.dart';
import 'package:vocabulary_app/db/models/word_item.dart';

class ForTest extends StatefulWidget {
  ForTest({Key? key}) : super(key: key);

  @override
  _ForTestState createState() => _ForTestState();
}

class _ForTestState extends State<ForTest> {

  late List<String> _word;
  late String nativeName;
  late String foreignName;

  List<WordItem> words = [];

  List<Widget> get _items => words.map((item) => format(item)).toList();

  Widget format(WordItem item) {

    return Dismissible(
      key: Key(item.id.toString()),
      child: Padding(
          padding: EdgeInsets.fromLTRB(12, 6, 12, 4),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("${item.nativeName} - ${item.foreignName}",),
              ]
          )
      ),
      onDismissed: (DismissDirection direction) => _delete(item),
    );
  }

  void _delete(WordItem item) async {

    DB.delete(WordItem.table, item);
    refresh();
  }

  void _save() async {

    Navigator.of(context).pop();
    WordItem item = WordItem(
        id: 1,
        nativeName: nativeName,
        foreignName: foreignName
    );

    await DB.insert(WordItem.table, item);
    setState(() => _word = ['', ''] );
    refresh();
  }

  void _create(BuildContext context) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Create New Task"),
            actions: <Widget>[
              TextButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop()
              ),
              TextButton(
                  child: Text('Save'),
                  onPressed: () => _save()
              )
            ],
            content: Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'NativeName',),
                  onChanged: (value) { nativeName = value; },
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(labelText: 'ForeignName',),
                  onChanged: (value) { foreignName = value; },
                ),
              ],
            ),
          );
        }
    );
  }

  @override
  void initState() {

    refresh();
    super.initState();
  }

  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.query(WordItem.table);
    words = _results.map((item) => WordItem.fromMap(item)).toList();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView( children: _items )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { _create(context); },
          tooltip: 'New word',
          child: Icon(Icons.library_add),
          backgroundColor: Colors.blueGrey,
        )
    );
  }
}