import '../models/food_item.dart';

class AppData {
  static List<Category> categories = [
    Category(id: 1, name: 'Pizza', icon: '🍕'),
    Category(id: 2, name: 'Burger', icon: '🍔'),
    Category(id: 3, name: 'Sushi', icon: '🍱'),
    Category(id: 4, name: 'Salad', icon: '🥗'),
    Category(id: 5, name: 'Dessert', icon: '🍰'),
  ];

  static List<FoodItem> popularItems = [
    FoodItem(
      id: 1,
      name: 'Pepperoni Pizza',
      description: 'Classic pepperoni pizza with extra cheese and Italian herbs',
      price: 15.99,
      imageUrl: 'assets/images/pizza1.jpg',
      rating: 4.5,
      reviews: 128,
      category: 'Pizza',
      distance: 1.7,
      timeToDeliver: '30 min',
      isPopular: true,
    ),
    FoodItem(
      id: 2,
      name: 'Classic Burger',
      description: 'Juicy beef patty with fresh vegetables and special sauce',
      price: 12.99,
      imageUrl: 'assets/images/burger1.jpg',
      rating: 4.8,
      reviews: 256,
      category: 'Burger',
      distance: 2.1,
      timeToDeliver: '25 min',
      isPopular: true,
    ),
    FoodItem(
      id: 3,
      name: 'California Roll',
      description: 'Fresh sushi roll with crab, avocado, and cucumber',
      price: 18.99,
      imageUrl: 'assets/images/sushi1.jpg',
      rating: 4.7,
      reviews: 189,
      category: 'Sushi',
      distance: 3.2,
      timeToDeliver: '35 min',
      isPopular: true,
    ),
  ];

  static List<FoodItem> allItems = [
    ...popularItems,
    FoodItem(
      id: 4,
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with caesar dressing and croutons',
      price: 9.99,
      imageUrl: 'assets/images/salad1.jpg',
      rating: 4.3,
      reviews: 95,
      category: 'Salad',
      distance: 1.5,
      timeToDeliver: '20 min',
    ),
    FoodItem(
      id: 5,
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with dark chocolate ganache',
      price: 7.99,
      imageUrl: 'assets/images/dessert1.jpg',
      rating: 4.9,
      reviews: 312,
      category: 'Dessert',
      distance: 2.8,
      timeToDeliver: '25 min',
    ),
  ];
}
