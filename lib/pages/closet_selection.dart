import 'dart:io';

import 'package:fashion/shared/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../provider/closet.dart';
import '../shared/appbar.dart';

class ClosetSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageModel = Provider.of<ImageModel>(context);

    Future<void> _pickImage() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController categoryController =
            TextEditingController();

        // Show a dialog to input name, category, and location
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Add Item Details',
                style: TextStyle(
                  color: Color.fromARGB(255, 147, 83, 0),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          labelText: 'Item Name',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 147, 83, 0),
                          )),
                    ),
                    TextField(
                        controller: categoryController,
                        decoration: const InputDecoration(
                            labelText: 'Category',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 147, 83, 0),
                            ))),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style:
                        TextStyle(color: BTNpink, fontWeight: FontWeight.w100),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        categoryController.text.isNotEmpty) {
                      imageModel.addImageItem(ImageItem(
                        imagePath: pickedFile.path,
                        name: nameController.text,
                        category: categoryController.text,
                      ));
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: Color.fromARGB(255, 147, 83, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Closet'),
        actions: [ProductsAndPrice()],
        backgroundColor: appbarGreen,
        foregroundColor: fontcolor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.zero),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(255, 248, 217, 180)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(10),
                  ))),
              onPressed: _pickImage,
              child: const Text(
                'Select Image',
                style: TextStyle(
                  color: Color.fromARGB(255, 147, 83, 0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imageModel.imageItems.length,
              itemBuilder: (context, index) {
                final item = imageModel.imageItems[index];
                return Card(
                  elevation: 6,
                  shadowColor: appbarGreen,
                  color: Colors.white,
                  shape:const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)
                         ),
                      side: BorderSide(width: 0.6, color: fontcolor)),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(item.imagePath),
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.category),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
