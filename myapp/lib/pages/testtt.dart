import 'dart:io';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/components/user_info.dart';
import 'package:draggable_home/draggable_home.dart';

final Color green = Colors.brown;
final Color orange = Colors.brown;

class UploadingImageToFirebaseStoragee extends StatefulWidget {
  @override
  _UploadingImageToFirebaseStorageState createState() =>
      _UploadingImageToFirebaseStorageState();
}

class _UploadingImageToFirebaseStorageState extends State {
  File? _imageFile = null;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile!.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('profile')
        .child('/$fileName');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': fileName});
    firebase_storage.UploadTask uploadTask;
    //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    uploadTask = ref.putFile(io.File(_imageFile!.path), metadata);

    firebase_storage.UploadTask task = await Future.value(uploadTask);
    Future.value(uploadTask)
        .then((value) => {print("Upload file path ${value.ref.fullPath}")})
        .onError((error, stackTrace) =>
            {print("Upload file path error ${error.toString()} ")});
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("마이 페이지"),
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(children: [
          Padding(padding: EdgeInsets.all(10)),
          Text("개인정보",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ]),
        listView(),
        Column(
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  // () => 
                  uploadImageToFirebase(context);
                  print('haha');
                  //Get.to(InfoChangePage());
                },
                padding: EdgeInsets.all(10.0),
                child: Text('수정하기',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                textColor: Colors.white,
                color: Colors.pink.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            )
          ],
        ),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }

  //Container headerBottomBarWidget() {
  //return Container(
  //child: Row(
  //mainAxisSize: MainAxisSize.min,
  //mainAxisAlignment: MainAxisAlignment.end,
  //crossAxisAlignment: CrossAxisAlignment.center,
  //children: [//설정 아이콘
  //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
  //],
  //),
  //);
  //}

  Container headerWidget(BuildContext context) => Container(
        color: Colors.pink.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: _imageFile != null
                    ? Image.file(_imageFile!)
                    : FlatButton(
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                          size: 30,
                        ),
                        onPressed: pickImage,
                      ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "일병 홍길동",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 0.5,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "XX대대 X중대",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: info.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        //color: Colors.pink.shade100,
        child: ListTile(
          title: Text("${info[index].name}",
              style: TextStyle(
                  color: Colors.pink.shade100, fontWeight: FontWeight.bold)),
          subtitle: Text(
            info[index].detail,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }

  // Widget uploadImageButton(BuildContext context) {
  //   return Container(
  //     child: Stack(
  //       children: [
  //         Container(
  //           padding:
  //               const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
  //           margin: const EdgeInsets.only(
  //               top: 30, left: 20.0, right: 20.0, bottom: 20.0),
  //           decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 colors: [orange, green],
  //               ),
  //               borderRadius: BorderRadius.circular(30.0)),
  //           child: FlatButton(
  //             onPressed: () => uploadImageToFirebase(context),
  //             child: Text(
  //               "Upload Image",
  //               style: TextStyle(fontSize: 20, color: Colors.black),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
