class User {
  final String id;
  final String name;
  final String username;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.imageUrl,
  });
}

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String brand;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.brand = '',
    this.category = '',
  });
}

class PostItem {
  final Product product;
  final double dx;
  final double dy;

  PostItem({
    required this.product,
    required this.dx,
    required this.dy,
  });
}

class Post {
  final String id;
  final User user;
  final String imageUrl;
  final List<PostItem> items;

  Post({
    required this.id,
    required this.user,
    required this.imageUrl,
    required this.items,
  });
}

final List<User> mockUsers = [
  User(id: '1', name: 'Chris Madison', username: '@madchris', imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop'),
  User(id: '2', name: 'Tom Phillips', username: '@tphillips', imageUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150&h=150&fit=crop'),
  User(id: '3', name: 'Jane Irish', username: '@janeirish', imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&h=150&fit=crop'),
  User(id: '4', name: 'Represent', username: '@represent', imageUrl: 'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=150&h=150&fit=crop'),
  User(id: '5', name: 'Joel', username: '@joel', imageUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop'),
];

final List<Product> mockProducts = [
  Product(id: 'p1', name: 'Fleece Oversized Hoodie', price: 24.99, imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500&h=500&fit=crop', brand: '@represent', category: 'Hoodie'),
  Product(id: 'p2', name: 'Cotton Chinos', price: 17.99, imageUrl: 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?w=500&h=500&fit=crop', brand: '@joel', category: 'Pants'),
  Product(id: 'p3', name: 'Sneakers', price: 27.99, imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&h=500&fit=crop', brand: '@mikerode', category: 'Shoes'),
  Product(id: 'p4', name: 'White Graphic Tee', price: 110.59, imageUrl: 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=500&h=500&fit=crop', brand: '@represent'),
  Product(id: 'p5', name: 'Grey Sweatshirt', price: 80.09, imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500&h=500&fit=crop', brand: '@janeirish'),
  Product(id: 'p6', name: 'Black Cap', price: 95.99, imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=500&h=500&fit=crop', brand: '@mikerode'),
  Product(id: 'p7', name: 'Black Print Hoodie', price: 75.55, imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=500&h=500&fit=crop', brand: '@joel'),
];

final List<Post> mockPosts = [
  Post(
    id: 'post1',
    user: mockUsers[0],
    imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=800&h=1200&fit=crop',
    items: [
      PostItem(product: mockProducts[0], dx: 0.3, dy: 0.25),
      PostItem(product: mockProducts[1], dx: 0.7, dy: 0.35),
      PostItem(product: mockProducts[2], dx: 0.5, dy: 0.65),
    ],
  ),
  Post(
    id: 'post2',
    user: mockUsers[2],
    imageUrl: 'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=800&h=1200&fit=crop',
    items: [
      PostItem(product: mockProducts[4], dx: 0.4, dy: 0.3),
    ],
  ),
];
