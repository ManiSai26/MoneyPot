// import 'package:flutter/material.dart';
//
// // class InputContainer extends StatelessWidget {
// //   final String label;
// //   final TextEditingController controller;
// //   final bool isvalid;
// //   InputContainer({Key? key, required this.label, required this.controller, required this.isvalid})
// //       : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       //color: Colors.orange,
// //       child: Row(
// //         //mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           Container(
// //             padding: const EdgeInsets.only(left: 20.0),
// //             alignment: Alignment.centerLeft,
// //             //color: Colors.red,
// //             height: 100.0,
// //             child: Text(
// //               label,
// //               style: const TextStyle(
// //                 fontSize: 30.0,
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 50,),
// //           Container(
// //             child: TextField(
// //               decoration: InputDecoration(
// //                 errorText: isvalid? null:'Enter an integer'
// //               ),
// //               controller: controller,
// //             ),
// //             width: 200,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// class InputContainer extends StatefulWidget {
//   const InputContainer({Key? key,required this.label,required this.controller,required this.isvalid}) : super(key: key);
//   final String label;
//   final TextEditingController controller;
//   final bool isvalid;
//   @override
//   _InputContainerState createState() => _InputContainerState(isvalid: this.isvalid,label: this.label,controller: this.controller);
// }
//
// class _InputContainerState extends State<InputContainer> {
//   @override
//   final String label;
//   final TextEditingController controller;
//   final bool isvalid;
//
//   _InputContainerState({ required this.label,  required this.controller,required this.isvalid});
//   Widget build(BuildContext context) {
//     return  Container(
//       //color: Colors.orange,
//       child: Row(
//         //mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.only(left: 20.0),
//             alignment: Alignment.centerLeft,
//             //color: Colors.red,
//             height: 100.0,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 30.0,
//               ),
//             ),
//           ),
//           const SizedBox(width: 50,),
//           Container(
//             child: TextField(
//               decoration: InputDecoration(
//                   errorText: isvalid? null:'Enter an integer'
//               ),
//               controller: controller,
//             ),
//             width: 200,
//           ),
//         ],
//       ),
//     );
//   }
// }
