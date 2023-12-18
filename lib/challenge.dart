import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(UserLoginApp());
}

class UserLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserLoginPage(),
    );
  }
}

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;
  String _uploadedFileURL;

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select action'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Take a photo'),
                    onTap: () {
                      _takePhoto();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Pick an image from gallery'),
                    onTap: () {
                      _pickImage();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _takePhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImage() async {
    var ImageSource;
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    // Write your upload logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Your form fields here
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentStatevalidate()) {
                    // Perform user login action
                  }
                },
                child: Text('Login'),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
              Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton.icon(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                icon: Icon(Icons.image),
                label: Text('Pick an image'),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton(
                onPressed: () {
                  _uploadImage();
                },
                child: Text('Upload image'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ImagePicker() {}
}
