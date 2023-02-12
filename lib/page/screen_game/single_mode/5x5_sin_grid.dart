import 'package:flutter/material.dart';

class single_5x5 extends StatefulWidget {
  static String routeName = '/single5x5';
  const single_5x5({super.key});

  @override
  State<single_5x5> createState() => _single_5x5State();
}

class _single_5x5State extends State<single_5x5> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Center(
          child: Center(
            child: Column(children: const [
              //header
              Text(
                'SINGLE 5x5',
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
