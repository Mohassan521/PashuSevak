import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pashusevak/services/apiServices.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({super.key});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {

  File? pickedFile;
  
  Future<File?> _pickFile() async {
     FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc','xlsx'],
    );

    if (result != null) {
      pickedFile = File(result.files.single.path!);
    setState(() {
      // Any UI updates based on the picked file
    });
    return pickedFile;
    } else {
      // User canceled the picker
      print('File selection canceled.');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Upload Documents"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/preUploadDoc.jpeg"),
            SizedBox(
              height: 10,
            ),
            Text("Browse and choose files", style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 35,
            ),
            MaterialButton(onPressed: (){
              _pickFile().then((value){
                NetworkApiServices().uploadDocsFromDoctor(value);
              });
            },
            child: Text("Upload"),
            color: Colors.orange,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )
          ],
        ),
      ),
    );
  }
}