import 'package:flutter/material.dart';
import 'package:moneypot/firebase/loginSignup.dart';
import 'package:moneypot/models/user.dart';
import 'package:moneypot/screens/Imageuploadscreen.dart';
import 'package:moneypot/screens/loginscreen.dart';
import 'package:moneypot/widgets/CircularButton.dart';
import 'package:moneypot/widgets/circularinputcontainer.dart';
import 'package:moneypot/data.dart';
import 'homepage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repassword = TextEditingController();
  String? errmsg;
  late User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 80.0,
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Money Pot',
                style: TextStyle(
                  fontSize: 70.0,
                  color: data.themecolor,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30.0,
            ),
          ),
          SliverToBoxAdapter(
            child: CircularInputContainer(
                label: 'Username', controller: _username),
          ),
          SliverToBoxAdapter(
            child: CircularInputContainer(
                label: 'Email', controller: _email),
          ),
          SliverToBoxAdapter(
            child: CircularInputContainer(
                label: 'Password', controller: _password),
          ),
          SliverToBoxAdapter(
            child: CircularInputContainer(
                label: 'Re-Enter Password', controller: _repassword),
          ),
          SliverToBoxAdapter(
            child: CircularButton(
              label: 'Create account',
              onPressed: () async => {
                if(_password.text==_repassword.text){errmsg = await createUser(_username.text, _password.text,_email.text),}
                else{
                  errmsg='Passwords Do\'nt match',
                },
                print(errmsg),
                setState(() {
                  errmsg;
                }),
                if (errmsg == null)
                  {
                    user=  User(imageUrl: null, userName: _username.text, email: _email.text),
                    user.writeToDatabase(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Imageupload(user: user),
                      ),
                    ),
                  }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: errmsg == null
                  ? const SizedBox()
                  : Text(
                errmsg!,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  const Text(
                    'Already have an account ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: data.themecolor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
