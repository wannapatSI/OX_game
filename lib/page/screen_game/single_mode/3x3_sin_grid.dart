import 'package:flutter/material.dart';

class single_3x3 extends StatefulWidget {
  static String routeName = '/single3x3';
  const single_3x3({super.key});

  @override
  State<single_3x3> createState() => _single_3x3State();
}

class _single_3x3State extends State<single_3x3> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Center(
          child: Center(
            child: Column(children: const [
              //header
              Text(
                'SINGLE 3x3',
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
