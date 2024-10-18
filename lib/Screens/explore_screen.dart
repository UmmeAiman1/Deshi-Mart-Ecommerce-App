
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Find Products',
            style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            children: [
              SearchBar(
                backgroundColor: WidgetStatePropertyAll(AppColors.tileColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const [
                    CategoryData(
                        borderColor: Color(0xB253B175),
                        color: Color(0x1A53B175),
                        image: Image(
                          image: AssetImage('assets/images/Basket.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Fresh Fruits \n& Vegetables'),
                    CategoryData(
                        borderColor: Color(0xB2F8A44C),
                        color: Color(0x1AF8A44C),
                        image: Image(
                          image: AssetImage('assets/images/Oil.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Cooking Oil \n& Ghee'),
                    CategoryData(
                        borderColor: Color(0xFFF7A593),
                        color: Color(0x40F7A593),
                        image: Image(
                          image: AssetImage('assets/images/meat.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Meat & Fish'),
                    CategoryData(
                        borderColor: Color(0xFFD3B0E0),
                        color: Color(0x40D3B0E0),
                        image: Image(
                          image: AssetImage(
                            'assets/images/bakery.png',
                          ),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Bakery & Snacks'),
                    CategoryData(
                        borderColor: Color(0xFFFDE598),
                        color: Color(0x40FDE598),
                        image: Image(
                          image: AssetImage('assets/images/dairy.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Dairy & Eggs'),
                    CategoryData(
                        borderColor: Color(0xFFB7DFF5),
                        color: Color(0x40B7DFF5),
                        image: Image(
                          image: AssetImage('assets/images/beverages.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Beverages'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
