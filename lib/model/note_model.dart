import 'package:intl/intl.dart';
import 'package:note_app/utility/constant/constant_key.dart';

class NoteModel {
  int? id;
  String? name;
  String? description;
  String? date;
  String? category;
  String? colorCode;
  final _entity = Entity();

  NoteModel(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.date,
      this.colorCode});
  Map<String, dynamic> toMap() {
    return {
      _entity.noteTitle: name,
      _entity.noteDesctription: description,
      _entity.date: date,
      _entity.categoryOfNote: category,
      _entity.codeColor: colorCode,
    };
  }

  NoteModel.fromMap(Map<String, dynamic> map)
      : id = map[Entity().noteId],
        name = map[Entity().noteTitle],
        description = map[Entity().noteDesctription],
        category = map[Entity().categoryOfNote],
        date = map[Entity().date],
        colorCode = map[Entity().codeColor];
}
