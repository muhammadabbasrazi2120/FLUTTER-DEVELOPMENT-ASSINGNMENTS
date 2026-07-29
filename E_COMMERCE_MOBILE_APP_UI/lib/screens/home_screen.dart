import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status / Stories Bar
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: mockUsers.length,
                itemBuilder: (context, index) {
                  final user = mockUsers[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade800, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(user.imageUrl),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          user.username.replaceAll('@', ''),
                          style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Colors.white12, height: 1),
            // Posts Feed
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mockPosts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: mockPosts[index]);
              },
            ),
            const SizedBox(height: 80), // Padding for bottom nav bar
          ],
        ),
      ),
    );
  }
}
