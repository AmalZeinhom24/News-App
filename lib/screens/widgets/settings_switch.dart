import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSwitch extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final bool value;
  final Function(bool value) onTap;

  const SettingsSwitch(
      {super.key,
        required this.title,
        required this.bgColor,
        required this.iconColor,
        required this.icon,
        required this.value,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          SizedBox(width: 20),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Spacer(),
          Text(value ? 'On' : 'Off',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(width: 20),
          CupertinoSwitch(value: value, onChanged: onTap)
        ],
      ),
    );
  }
}
