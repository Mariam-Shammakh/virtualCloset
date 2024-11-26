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
        final TextEditingController locationController =
            TextEditingController();

        // Show a dialog to input name, category, and location
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Item Details'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Item Name'),
                    ),
                    TextField(
                      controller: categoryController,
                      decoration: InputDecoration(labelText: 'Category'),
                    ),
                    TextField(
                      controller: locationController,
                      decoration:
                          InputDecoration(labelText: 'Location (optional)'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
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
                  child: const Text('Save'),
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
        backgroundColor:appbarGreen ,
        foregroundColor:fontcolor,
        
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Select Image'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: imageModel.imageItems.length,
              itemBuilder: (context, index) {
                final item = imageModel.imageItems[index];
                return ListTile(
                  leading: Image.file(
                    File(item.imagePath),
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                    
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
