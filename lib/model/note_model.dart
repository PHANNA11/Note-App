import 'package:note_app/utility/constant/constant_key.dart';

class NoteModel {
  int? id;
  String? name;
  String? description;
  DateTime? date;
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
  Map toMap() {
    return {
      _entity.noteId: id,
      _entity.noteTitle: name,
      _entity.noteDesctription: description,
      _entity.date: date.toString(),
      _entity.categorName: category,
      _entity.codeColor: colorCode,
    };
  }

  NoteModel.fromMap(Map<String, dynamic> map)
      : id = map[Entity().noteId],
        name = map[Entity().noteTitle],
        description = map[Entity().noteDesctription],
        category = map[Entity().categorName],
        date = map[Entity().date],
        colorCode = map[Entity().codeColor];
}
