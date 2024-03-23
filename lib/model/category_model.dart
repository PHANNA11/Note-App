import 'package:note_app/utility/constant/constant_key.dart';

class CategoryModel {
  int? id;
  String? name;
  final _entity = Entity();

  CategoryModel({this.id, required this.name});
  Map<String, dynamic> toMap() {
    return {
      _entity.categorName: name,
    };
  }

  CategoryModel.fromMap(Map<String, dynamic> res)
      : id = res[Entity().categoryId],
        name = res[Entity().categorName];
}
