import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {required this.label,
        this.labelColor = Colors.black,
        this.subtitle,
        this.iconData,
        this.onTap,
        Key? key})
      : super(key: key);
  final String label;
  final Color labelColor;
  final String? subtitle;
  final IconData? iconData;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap as void Function()?,
          contentPadding: EdgeInsets.zero,
          title: Text(
            label,
            style: TextStyle(fontSize: 18, color: labelColor),
          ),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: iconData != null
              ? Icon(
            iconData,
            color: Colors.grey[900],
            size: 36,
          )
              : null,
        ),
        const Divider(thickness: .75),
      ],
    );
  }
}