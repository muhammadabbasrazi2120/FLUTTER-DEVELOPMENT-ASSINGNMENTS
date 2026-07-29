import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../screens/product_details_screen.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(post.user.imageUrl),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    post.user.username,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
        ),
        
        // Post Image with Tags
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(post: post),
              ),
            );
          },
          child: Stack(
            children: [
              // Main Image
              Container(
                width: double.infinity,
                height: 500, // Fixed height for standard look
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(post.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              
              // Tags
              ...post.items.map((item) {
                return Positioned(
                  left: MediaQuery.of(context).size.width * item.dx,
                  top: 500 * item.dy,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.product.name,
                          style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.circle, color: Colors.black, size: 8),
                      ],
                    ),
                  ),
                );
              }),
              
              // View Items Button and Bookmark
              Positioned(
                bottom: 16,
                left: 32,
                right: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 16),
                          SizedBox(width: 8),
                          Text('View items in this look', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.bookmark_border, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Interaction Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, size: 28),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, size: 28),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined, size: 28),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),
      ],
    );
  }
}
