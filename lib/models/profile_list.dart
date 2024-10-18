import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  const ProfileList({super.key, required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color colorWithOpacity = const Color(
      0xff019934,
    ).withOpacity(0.5);
    return ListTile(
      leading: Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
            color: colorWithOpacity, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
