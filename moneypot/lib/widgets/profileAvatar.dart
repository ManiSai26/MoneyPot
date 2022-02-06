import 'package:flutter/material.dart';
import 'package:moneypot/data.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: [
    //
    //     Positioned(
    //       left: 0.0,
    //       top: 0.0,
    //       child: Container(
    //         decoration:  BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: data.themecolor,
    //           border: Border.all(width: 25.0,)
    //         ),
    //       ),
    //     ),
    //     GestureDetector(
    //       child: Image.network(imageUrl),
    //       onTap: ()=>print('profiles'),
    //     ),
    //     Container(
    //       decoration: BoxDecoration(
    //         color: Colors.grey[600],
    //         shape: BoxShape.circle,
    //       ),
    //       child: IconButton(
    //         icon: Image.network(imageUrl),
    //         onPressed: () => {print('Profile')},
    //       ),
    //     ),
    //   ],
    // );
    return GestureDetector(
      child: Image.network(imageUrl),
      onTap: () => print('profiles'),
      onLongPress: ()=>print('hi'),
    );
  }
}
