import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/product_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLooksSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        title: const Text('My Dream Rack'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isLooksSelected = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isLooksSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: isLooksSelected ? null : Border.all(color: Colors.grey.shade800),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'LOOKS',
                        style: TextStyle(
                          color: isLooksSelected ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isLooksSelected = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !isLooksSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: !isLooksSelected ? null : Border.all(color: Colors.grey.shade800),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'PRODUCTS',
                        style: TextStyle(
                          color: !isLooksSelected ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Grid View
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: mockProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: mockProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
