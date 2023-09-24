

import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;
  void pickfromgallery() {
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        imageFile = value;
      });
    });
  }

  void pickfromgCamera() {
    imagePicker.pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile = value;
      });
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 117, 225, 1),
        title: const Text("Image Picker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: imageFile == null
                ? const Center(
                    child: Text("No Image Picked"),
                  )
                : Image.file(
                    File(imageFile!.path),
                    fit: BoxFit.cover,
                  ),
          ),
          ElevatedButton(
            onPressed: () {
              pickfromgCamera();
            },
            child: const Text(
              "Capture Image using Camera",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pickfromgallery();
            },
            child: const Text(
              "     Pick Image from Gallery     ",
            ),
          ),

          
        ],
      ),
    );
  }
}
