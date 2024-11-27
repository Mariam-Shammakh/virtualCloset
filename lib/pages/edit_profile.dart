import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../shared/appbar.dart';
import '../shared/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late String _userName;
  late String _email;
  late String _Password;

  File? _profileImage;
  var IsVisible = false;
  @override
  void initState() {
    super.initState();
    // Initialize the form fields with default values
    _userName = "";
    _email = "";
    _Password = "";
  }

  Future<void> _pickProfileImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Save the updated profile information
      print("userName: $_userName");
      print("Email: $_email");
      print("Password: $_Password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: appbarGreen,
        foregroundColor: fontcolor,
        actions: [ProductsAndPrice()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickProfileImage,
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage("assets/img/1.jpg") as ImageProvider,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(
                    "userName",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 83, 0),
                    ),
                  )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter userName";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userName = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(
                    'Gmail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 147, 83, 0),
                    ),
                  )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                        .hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _email = value;
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              IsVisible = !IsVisible;
                            });
                          },
                          icon: Icon(IsVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      label: const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 147, 83, 0),
                        ),
                      )),
                  onSaved: (value) {
                    _Password = value!;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !IsVisible,
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(5),
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
                      onPressed: _saveProfile,
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 147, 83, 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
