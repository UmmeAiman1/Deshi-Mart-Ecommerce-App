import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final num price;
  final int quantity;
  final String weight;
  final String title;
  final String imageUrl;

  const ProductDetailScreen({
    super.key,
    required this.price,
    required this.quantity,
    required this.weight,
    required this.title,
    required this.imageUrl,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  int quantity = 1;

  // Method to add product to Firebase cart
  Future<void> _addToCart() async {
    try {
     
      final cartRef = FirebaseFirestore.instance.collection('cart');

     
      await cartRef.add({
        'title': widget.title,
        'price': widget.price,
        'quantity': quantity,
        'weight': widget.weight,
        'imageUrl': widget.imageUrl,
      });

    
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.title} added to cart!')),
      );
    } catch (e) {
      print('Error adding to cart: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff2f3f2),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xff181725)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const Icon(Icons.ios_share, size: 22, color: Color(0xff181725)),
                onPressed: () {
                  
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 371,
              decoration: BoxDecoration(
                color: const Color(0xfff2f3f2),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff181725),
                        ),
                      ),
                      const Icon(Icons.favorite_border_sharp),
                    ],
                  ),
                  Text(
                    "${widget.quantity}${widget.weight}, Price",
                    style: const TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xff7c7c7c),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Center(
                                child: Text(
                                  "$quantity",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xff53B175),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${widget.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xff181725),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                     const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Detail',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Apples are nutritious. Apples may be good for weight loss.\napples may be good for your heart. As part of a healthy\nand varied diet.',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 13, color: Color(0xff7c7c7c)),
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nutritions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            '100g',
                            style: TextStyle(
                              backgroundColor: Color(0xffEBEBEB),
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star_sharp,
                            color: Color(0xffF3603F),
                            size: 14,
                          ),
                          Icon(
                            Icons.star_sharp,
                            color: Color(0xffF3603F),
                            size: 14,
                          ),
                          Icon(
                            Icons.star_sharp,
                            color: Color(0xffF3603F),
                            size: 14,
                          ),
                          Icon(
                            Icons.star_sharp,
                            color: Color(0xffF3603F),
                            size: 14,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.star_sharp,
                              color: Color(0xffF3603F),
                              size: 14,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: _addToCart,
                      child: const Text('Add To Basket'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
