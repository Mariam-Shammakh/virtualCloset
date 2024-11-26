import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../shared/appbar.dart';

class EditProfilePage extends StatefulWidget {
 const  EditProfilePage ({super.key});
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
                actions: [ProductsAndPrice()],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(16.0),
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
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "userName",
                  ),
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
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return "Please enter a valid email address";
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
                        icon: Icon(
                            IsVisible ? Icons.visibility : Icons.visibility_off)),
                    labelText: "Password",
                  ),
                  onSaved: (value) {
                    _Password = value!;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !IsVisible,
                ),
                //SizedBox(height: 70,),
                
                Center(
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    child:const Text("Update Profile"),
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
