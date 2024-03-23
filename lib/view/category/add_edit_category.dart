import 'package:flutter/material.dart';
import 'package:note_app/model/category_model.dart';
import 'package:note_app/utility/database/NoteDataCon.dart';
import 'package:note_app/view/widget/text_field_widget.dart';

import '../widget/note_widget.dart';

class AddEditCategory extends StatefulWidget {
  const AddEditCategory({super.key});

  @override
  State<AddEditCategory> createState() => _AddEditCategoryState();
}

class _AddEditCategoryState extends State<AddEditCategory> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New category'.toUpperCase()),
      ),
      body: Column(
        children: [
          TextFieldWidget(
            controller: controller,
            hintText: 'category name',
          )
        ],
      ),
      bottomNavigationBar: NoteWidget().bottonSave(
        onTap: () async {
          NoteDataCon()
              .insertCategory(category: CategoryModel(name: controller.text));
        },
      ),
    );
  }
}
