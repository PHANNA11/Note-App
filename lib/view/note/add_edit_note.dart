import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/category_model.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/utility/database/NoteDataCon.dart';
import 'package:note_app/view/category/add_edit_category.dart';
import 'package:note_app/view/widget/note_widget.dart';
import 'package:note_app/view/widget/text_field_widget.dart';

class AddEditNote extends StatefulWidget {
  const AddEditNote({super.key});

  @override
  State<AddEditNote> createState() => _AddEditNoteState();
}

class _AddEditNoteState extends State<AddEditNote> {
  List<CategoryModel> categorys = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  TextEditingController selectCategoryntroller = TextEditingController();
  CategoryModel? categoryModel;
  // =================
  int index = 0;
  String selectColor = '#1da2d8';
  void setInsexColor(String codeColor) {
    setState(() {
      selectColor = codeColor;
    });
  }

  List<String> colorsData = [
    '#1da2d8',
    '#ffa500',
    '#990000',
    '#35177a',
    '#8b0000',
    '#441368',
    '#1ca9c9',
    '#2ebd73',
    '#fbae85',
    '#3e3e3f'
  ];

  getDataBase() async {
    await NoteDataCon().getCategory().then((value) {
      setState(() {
        categorys = value;
      });
      if (categorys.isEmpty) {
        categorys = [CategoryModel(name: '')];
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataBase();
  }

  @override
  Widget build(BuildContext context) {
    // getDataBase();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
        actions: [
          IconButton(
              onPressed: () async {
                await getDataBase();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          TextFieldWidget(
            controller: titleController,
            hintText: 'Title note',
          ),
          TextFieldWidget(
            controller: bodyController,
            hintText: 'body note',
            maxLine: 6,
          ),

          // Dropdown botton
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: Row(
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                  Icon(
                    Icons.radio_button_checked_sharp,
                    size: 30,
                    color: HexColor(selectColor),
                  ),
                  Expanded(
                    flex: 6,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<CategoryModel>(
                        isExpanded: true,
                        dropdownSearchData: DropdownSearchData(
                          searchController: selectCategoryntroller,
                          searchInnerWidgetHeight: 50,
                          // build form search in dropdown
                          searchInnerWidget: Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: selectCategoryntroller,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await Future.delayed(Duration.zero)
                                          .whenComplete(
                                        () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AddEditCategory(),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 30,
                                    )),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'select',
                                // hintStyle: hintTextStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return (item.value!.name
                                .toString()
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()));
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          // if (!isOpen) {
                          //   selectCategoryntroller.clear();
                          // }
                        },
                        hint: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'select Category',
                                style: TextStyle(
                                  //  fontSize: BodyTextSize,
                                  fontWeight: FontWeight.bold,
                                  //  color: Colors.yellow,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: categorys
                            .map((brand) => DropdownMenuItem<CategoryModel>(
                                  value: brand,
                                  child: Text(
                                    brand.name.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      //  color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: categoryModel,
                        onChanged: (value) {
                          setState(() {
                            categoryModel = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 400,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            // color: Colors.redAccent,
                          ),
                          //elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          isFullScreen: true,
                          maxHeight: 250,
                          width: 270,
                          padding: null,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            //   color: Colors.redAccent,
                          ),
                          //elevation: 8,
                          offset: const Offset(0, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(10),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemCount: colorsData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setInsexColor(colorsData[index]);
                    },
                    child: buildWidgetColors(colorCode: colorsData[index])),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NoteWidget().bottonSave(
        onTap: () async {
          await NoteDataCon()
              .insertNote(
                  note: NoteModel(
                      name: titleController.text,
                      description: bodyController.text,
                      date: DateFormat('yyyy-MM-dd : hh:mm')
                          .format(DateTime.now())
                          .toString(),
                      colorCode: selectColor,
                      category: categoryModel!.name))
              .then((value) {
            if (value) {
              Navigator.pop(context);
            }
          });
        },
      ),
    );
  }

  Widget buildWidgetColors({String? colorCode = '#1da2d8'}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        maxRadius: 20,
        minRadius: 10,
        backgroundColor: HexColor(colorCode!),
        child: selectColor == colorCode
            ? const Center(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
