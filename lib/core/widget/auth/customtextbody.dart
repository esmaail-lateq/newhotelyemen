import 'package:flutter/material.dart';

class Customtextbody extends StatelessWidget {
  final String text;
  const Customtextbody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '$text',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(height: 1.5, fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
