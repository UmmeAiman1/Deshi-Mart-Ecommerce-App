import 'package:ecommerce_app/Screens/bottomnavigation_screen.dart';

import 'package:ecommerce_app/auth.dart';
import 'package:ecommerce_app/models/tiles.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            const Image(
              image: AssetImage('assets/images/welcome logo.png'),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'DESHI',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: 'MART',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ]),
            ),
            Text(
              'Desh ka market',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightText),
            ),
            const SizedBox(
              height: 20,
            ),
            const WelcomeTile(
              title: 'Organic Groceries',
              image: Image(
                  height: 29,
                  width: 29,
                  image: AssetImage(
                    'assets/images/leaf.png',
                  )),
            ),
            const Divider(height: 1,),
            const WelcomeTile(
              title: 'Whole foods and vegetable',
              image: Image(
                height: 29,
                width: 29,
                image: AssetImage('assets/images/food.png'),
              ),
            ),
            const Divider(
              height: 1,
             
            ),
            const WelcomeTile(
              title: 'Fast Delivery',
              image: Image(
                height: 29,
                width: 29,
                image: AssetImage('assets/images/truck.png'),
              ),
            ),
            const Divider(height: 1,),
            const WelcomeTile(
              title: 'Easy Refund and return',
              image: Image(
                height: 29,
                width: 29,
                image: AssetImage('assets/images/bag.png'),
              ),
            ),
            const Divider(height: 1,),
            const WelcomeTile(
              title: 'Secure and safe',
              image: Image(
                height: 29,
                width: 29,
                image: AssetImage('assets/images/safe.png'),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color(0xff00CA44),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Welcome to our store',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 32,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Get your grocery in as fast as \n one hours',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            SizedBox(
                width: 352,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => StreamBuilder<User?>(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (snapshot.hasData) {
                              return const BottomNavigation();
                            }

                            return const Authentication();
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text(''),
                ))
          ],
        ),
      ),
    );
  }
}
