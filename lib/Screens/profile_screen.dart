

import 'package:ecommerce_app/models/profile_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color colorWithOpacity = const Color(
      0xff019934,
    ).withOpacity(0.5);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff019934),
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                top: 100,
              ),
              height: 128,
              width: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorWithOpacity,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Mr . Nitish Kumar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Text(
            'Nitishr833@gmail.com',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xff8E8E8E),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
            decoration: BoxDecoration(
                color: colorWithOpacity,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: 374,
            height: 93,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.book_outlined, color: Colors.black),
                        Text(
                          'Orders',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.black,
                        ),
                        Text(
                          'Payments',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.location_on, color: Colors.black),
                        Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
           ProfileList(icon: Icons.person, title: 'UserDetails', onPressed: () {  },),
          const SizedBox(
            height: 10,
          ),
           ProfileList(icon: Icons.settings, title: 'Settings', onPressed: () {  },),
          const SizedBox(
            height: 10,
          ),
           ProfileList(icon: Icons.help, title: 'Help & Details', onPressed: () {  },),
          const SizedBox(
            height: 10,
          ),
          ProfileList(icon: Icons.language, title: 'Change Language', onPressed: () { },),
          const SizedBox(
            height: 10,
          ),
           ProfileList(onPressed:() {
            FirebaseAuth.instance.signOut();
           }, title: 'Log out', icon: Icons.logout,),
        ],
      ),
    );
  }
}
