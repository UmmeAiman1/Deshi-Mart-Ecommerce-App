import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/tiles.dart';
import 'package:ecommerce_app/styles/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 1,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final cartItems = snapshot.data!.docs;

          if (cartItems.isEmpty) {
            return const Center(
              child: Text(
                "Your cart is empty.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              var item = cartItems[index];
              return CartTile(
                image: Image.network(
                  item['imageUrl'],
                  // width: 80,
                  // height: 80,
                  fit: BoxFit.cover,
                ),
                title: item['title'],
                title1: '${item['quantity']} x ${item['weight']}, Price',
                price: item['price'],
                quantity: item['quantity'],
                onRemove: () async {
                  await FirebaseFirestore.instance
                      .collection('cart')
                      .doc(item.id)
                      .delete();
                },
              );
              
            },
          );
        },
        
      ),
      
    bottomNavigationBar: Button(text: 'CheckOut', onPressed: (){}, backgroundColor: AppColors.buttonColor),
    );
  }
}
