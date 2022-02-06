import 'package:flutter/material.dart';
import 'package:moneypot/data.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
      //color: Colors.orange,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(data.themecolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: data.themecolor),
            ),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
