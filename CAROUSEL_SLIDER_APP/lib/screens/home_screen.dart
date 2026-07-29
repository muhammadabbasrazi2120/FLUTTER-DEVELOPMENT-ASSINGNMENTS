import 'package:flutter/material.dart';
import '../models/carousel_item_model.dart';
import '../widgets/custom_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CarouselItemModel> _carouselItems = const [
    CarouselItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      title: 'Smart Watch',
      description: 'The ultimate wearable for your active lifestyle.',
    ),
    CarouselItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      title: 'Wireless Headphones',
      description: 'Experience premium sound quality anywhere.',
    ),
    CarouselItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      title: 'Running Shoes',
      description: 'Step up your game with our new arrivals.',
    ),
    CarouselItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      title: 'Polaroid Camera',
      description: 'Capture your memories instantly.',
    ),
    CarouselItemModel(
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      title: 'MacBook Pro',
      description: 'Power and portability for professionals.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Products', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              CustomCarousel(items: _carouselItems),
              const SizedBox(height: 30.0),
              // We can add some more content below to make it look like a real app
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final categories = ['Tech', 'Fashion', 'Sports', 'Home', 'Beauty'];
                    final icons = [Icons.computer, Icons.checkroom, Icons.sports_basketball, Icons.home, Icons.face];
                    
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(icons[index], color: Theme.of(context).colorScheme.onPrimaryContainer),
                          ),
                          const SizedBox(height: 8),
                          Text(categories[index], style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
