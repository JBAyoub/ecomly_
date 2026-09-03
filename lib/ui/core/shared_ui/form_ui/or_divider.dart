import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color.fromARGB(50, 10, 10, 10),
            height: 10,
            thickness: 1,
            endIndent: 10,
          ),
        ),
        Text(
          'Or',
          style: TextStyle(
            fontFamily: 'GeneralSans',
            fontSize: 16,
            fontWeight: .w300,
            color: Color.fromARGB(255, 5, 5, 5),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color.fromARGB(50, 10, 10, 10),
            height: 10,
            thickness: 1,
            indent: 10,
          ),
        ),
      ],
    );
  }
}
