import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class imageUplod extends StatefulWidget {
  const imageUplod({Key? key}) : super(key: key);

  @override
  State<imageUplod> createState() => _imageUplodState();
}

class _imageUplodState extends State<imageUplod> {
  File? image;
  final _piker = ImagePicker();
  bool showspinner = false;

  Future getImage() async {
    final pickedfile =
        await _piker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedfile != null) {
      image = File(pickedfile.path);
      setState(() {});
    } else {
      print("no image");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showspinner = true;
    });
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var request = new http.MultipartRequest("POST", uri);
    request.fields["title"] = "Static title";

    var multiport = new http.MultipartFile("image", stream, length);
    request.files.add(multiport);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        showspinner = false;
      });
      print("image uplod");
    } else {
      setState(() {
        showspinner = false;
      });
      print("wroge");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("image uplode"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                getImage();
              },
              child: Container(
                child: image == null
                    ? Center(child: Text('image'))
                    : Container(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green,),
                child: Center(child: Text("upload",style: TextStyle(color:Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
