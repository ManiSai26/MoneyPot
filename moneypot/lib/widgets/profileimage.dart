import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moneypot/firebase/loginSignup.dart';
import 'package:moneypot/models/user.dart';
// class ProfileImage extends StatelessWidget {
//   final User user;
//   final ImagePicker _picker = ImagePicker();
//   String? imageUrl;
//   late var xFile;
//   late File img;
//    ProfileImage({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     imageUrl=user.imageUrl;
//     return InkWell(
//       onTap: () async =>
//       {
//         xFile =await _picker.pickImage(source: ImageSource.gallery),
//         img=File(xFile.path),
//         uploadImage(img,user),
//       },
//       child: Container(
//         height: 300.0,
//         // height:NetworkImage(imageUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png').scale,
//         width: double.infinity,
//         decoration:  BoxDecoration(
//           image:DecorationImage (image: NetworkImage(imageUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
//           fit: BoxFit.cover),
//           // color: Colors.orange,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key,required this.user}) : super(key: key);
  final User user;
  @override
  _ProfileImageState createState() => _ProfileImageState(user);
}

class _ProfileImageState extends State<ProfileImage> {
  final User user;
  final ImagePicker _picker = ImagePicker();
  String? imageUrl;
  late var xFile;
  late File img;

  _ProfileImageState(this.user);
  void set()
  {
    setState(() {
      imageUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    imageUrl=user.imageUrl;
    user.writeToDatabase();
    return InkWell(
      onTap: () async =>
      {
        xFile =await _picker.pickImage(source: ImageSource.gallery),
        img=File(xFile.path),
        uploadImage(img,user),
        // user.writeToDatabase(),
        imageUrl=user.imageUrl,

        set(),
      },
      child: Container(
        height: 300.0,
        // height:NetworkImage(imageUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png').scale,
        width: double.infinity,
        decoration:  BoxDecoration(
          image:DecorationImage (image: NetworkImage(imageUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              fit: BoxFit.cover),
          // color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
