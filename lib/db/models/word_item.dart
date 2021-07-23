import 'package:vocabulary_app/db/models/word.dart';

class WordItem extends Model {
  static String table = 'word_items';

  int id;
  String nativeName;
  String foreignName;

  WordItem({required this.id, required this.nativeName, required this.foreignName});

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'nativeName': nativeName,
      'foreignName': foreignName
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static WordItem fromMap(Map<String, dynamic> map) {

    return WordItem(
        id: map['id'],
        nativeName: map['nativeName'],
        foreignName: map['foreignName'],
    );
  }
}