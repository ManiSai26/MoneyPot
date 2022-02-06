import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneypot/data.dart';
import 'package:flutter/widgets.dart';
import 'package:moneypot/firebase/loginSignup.dart';
import 'package:moneypot/screens/signupscreen.dart';
import 'package:moneypot/widgets/CircularButton.dart';
import 'package:moneypot/widgets/circularinputcontainer.dart';

import 'homepage.dart';

// class Login extends StatelessWidget {
//   final TextEditingController _username = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   String? errmsg;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 80.0,
//             ),
//             const Text(
//               'Money Pot',
//               style: TextStyle(
//                 fontSize: 70.0,
//                 color: data.themecolor,
//               ),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             CircularInputContainer(label: 'Username', controller: _username),
//             CircularInputContainer(label: 'Password', controller: _password),
//             CircularButton(label: 'Login', onPressed: () async => {
//             errmsg=await isValidUser(_username.text, _password.text),
//             if(errmsg==null)
//             {
//               Navigator
//               .
//               push
//               (
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage())), }
//             },),
//
//
//             errmsg == null ? SizedBox() : Text(errmsg!),
//             Container(
//               padding: const EdgeInsets.only(left: 50.0),
//               child: Row(
//                 children: [
//                   const Text('Don\'t have an account '
//                     , style: TextStyle(
//                       fontSize: 16.0,
//                     ),),
//                   InkWell(
//                     overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
//                     child: const Text(
//                       'Signup',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: data.themecolor,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                     onTap: () => print('oops'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? errmsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              'Money Pot',
              style: TextStyle(
                fontSize: 70.0,
                color: data.themecolor,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            CircularInputContainer(label: 'Username', controller: _username),
            CircularInputContainer(label: 'Password', controller: _password),
            CircularButton(
              label: 'Login',
              onPressed: () async => {
                errmsg = await isValidUser(_username.text, _password.text),
                print(errmsg),
                setState(() {
                  errmsg;
                }),
                if (errmsg == null)
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage())),
                  }
              },
            ),
            errmsg == null
                ? const SizedBox()
                : Text(
                    errmsg!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
            Container(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  const Text(
                    'Don\'t have an account ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: data.themecolor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
