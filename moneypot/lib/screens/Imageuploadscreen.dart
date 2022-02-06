import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moneypot/firebase/loginSignup.dart';
import 'package:moneypot/models/models.dart';
import 'package:moneypot/widgets/CircularButton.dart';
import 'package:moneypot/widgets/profileAvatar.dart';
import 'package:moneypot/widgets/profileimage.dart';
// class Imageupload extends StatefulWidget {
//   const Imageupload({Key? key,required this.user}) : super(key: key);
//   final User user;
//   @override
//   _ImageuploadState createState() => _ImageuploadState(user: user);
// }
//
// class _ImageuploadState extends State<Imageupload> {
//
//   final ImagePicker _picker = ImagePicker();
//   var xFile;
//  late File img;
//  final User user;
//
//   _ImageuploadState({required this.user});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//           children:  [
//           SizedBox(height: 100.0),
//       ProfileImage(imageUrl: null),
//             CircularButton(label: 'Pick an image', onPressed: () async =>
//             {
//               xFile =await _picker.pickImage(source: ImageSource.gallery),
//                 img=File(xFile.path),
//               uploadImage(img,user),
//             })
//       ],
//     ),
//     ),
//     );
//   }
// }
class Imageupload extends StatelessWidget {
   Imageupload({Key? key,required this.user}) : super(key: key);
  final ImagePicker _picker = ImagePicker();
  var xFile;
  late File img;
  final User user;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children:  [
            SizedBox(height: 100.0),
            ProfileImage(user: user,),
            // CircularButton(label: 'Pick an image', onPressed: () async =>
            // {
            //   xFile =await _picker.pickImage(source: ImageSource.gallery),
            //   img=File(xFile.path),
            //   uploadImage(img,user),
            // })
          ],
        ),
      ),
    );
  }
}
