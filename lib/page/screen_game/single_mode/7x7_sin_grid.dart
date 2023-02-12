import 'package:flutter/material.dart';

class single_7x7 extends StatefulWidget {
  static String routeName = '/single7x7';
  const single_7x7({super.key});

  @override
  State<single_7x7> createState() => _single_7x7State();
}

class _single_7x7State extends State<single_7x7> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Center(
          child: Center(
            child: Column(children: const [
              //header
              Text(
                'SINGLE 7x7',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Regular',
                  fontWeight: FontWeight.bold,
                ),
              )
              //List
              //button
            ]),
          ),
        ),
      ),
    );
  }
}
