import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Post post;

  const ProductDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Row(
            children: [
              Icon(Icons.arrow_back_ios, size: 16),
              Text('Back', style: TextStyle(fontSize: 14)),
            ],
          ),
          onPressed: () => Navigator.pop(context),
          padding: const EdgeInsets.only(left: 8),
          constraints: const BoxConstraints(minWidth: 80),
        ),
        title: const Text('Check the look'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.cast),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.wifi),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(16).copyWith(bottom: 120),
            itemCount: post.items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final item = post.items[index];
              return _buildProductItem(context, item.product);
            },
          ),
          
          // Bottom Add to Cart Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24).copyWith(bottom: 32),
              decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.0),
                    Colors.black.withValues(alpha: 0.9),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.2, 1.0],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose wear color and size',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        
        // Product Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildOptionChip('Size: S'),
                  const SizedBox(width: 8),
                  _buildOptionChip('Color: Pink'),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
