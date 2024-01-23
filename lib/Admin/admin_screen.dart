import 'dart:core';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

Future<String> uploadImageToFirebase(File imageFile, String imageName) async {
  try {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$imageName');
    UploadTask uploadTask = storageReference.putFile(imageFile);
    await uploadTask.whenComplete(() => null);
    return await storageReference.getDownloadURL();
  } catch (e) {
    print('Error uploading image: $e');
    return '';
  }
}

class _AdminPanelState extends State<AdminPanel> {

  final TextEditingController id = TextEditingController();
  final TextEditingController pdname = TextEditingController();
  final TextEditingController kcal = TextEditingController();
  final TextEditingController carbs = TextEditingController();
  final TextEditingController protein = TextEditingController();
  final TextEditingController fat = TextEditingController();
  final TextEditingController desc = TextEditingController();

  // late final TextEditingController img;
  String? img;

  void addProduct(
    String id,
    String pdname,
    String kcal,
    String carbs,
    String protein,
    String fat,
    String desc,
  ) async {
    if (pdname == "" ||
        img == "")
    {
      print("Enter required fields ");
    } else {
      // String imageUrl = await uploadImageToFirebase(File(img!), pdname);
     await FirebaseFirestore.instance.collection("products").doc(pdname).set({
        'id': id,
        "pdname": pdname,
        "kcal": kcal,
       "protein": protein,
        "carbs": carbs,
        "fat": fat,
        "desc": desc,
        'img':img

      }).then((value) {
        print('Data inserted with docment id ');
      });
    }
  }
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Check if the file exists
      File file = File(pickedFile.path);
      if (file.existsSync()) {
        setState(() {
          img = pickedFile.path;
        });
      } else {
        print("Selected file does not exist.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input fields for doctor details
              TextField(
                controller: id,
                decoration: InputDecoration(labelText: 'Product Id'),
              ),
              TextField(
                controller: pdname,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: kcal,
                decoration: InputDecoration(labelText: 'Kcal'),
              ),
              TextField(
                controller: protein,
                decoration: InputDecoration(labelText: 'Protein'),
              ),
              TextField(
                controller: carbs,
                decoration: InputDecoration(labelText: 'Carbs'),
              ),
              TextField(
                controller: fat,
                decoration: InputDecoration(labelText: 'Fat'),
              ),
              TextField(
                controller: desc,
                decoration: InputDecoration(labelText: 'Description'),
              ),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: _getImageFromGallery,
                    child: Text('Select from Gallery'),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              if (img != null)
                Image.file(
                  File(img!),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  addProduct(
                    id.text.trim(),
                    pdname.text.trim(),
                    kcal.text.trim(),
                    carbs.text.trim(),
                    protein.text.trim(),
                    fat.text.trim(),
                    desc.text.trim(),



                  );
                },
                child: Text('Add Product'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Sign out the admin
                  // AuthService().signOut();
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
