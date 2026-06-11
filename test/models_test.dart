import 'package:flutter_test/flutter_test.dart';
import 'package:foodcommerce/models/food_item.dart';

void main() {
  group('FoodItem', () {
    test('should create FoodItem with correct properties', () {
      final item = FoodItem(
        id: 1,
        name: 'Pepperoni Pizza',
        description: 'Classic pepperoni pizza',
        price: 15.99,
        imageUrl: 'assets/images/pizza1.jpg',
        rating: 4.5,
        reviews: 128,
        category: 'Pizza',
        distance: 1.7,
        timeToDeliver: '30 min',
        isPopular: true,
      );

      expect(item.id, 1);
      expect(item.name, 'Pepperoni Pizza');
      expect(item.description, 'Classic pepperoni pizza');
      expect(item.price, 15.99);
      expect(item.imageUrl, 'assets/images/pizza1.jpg');
      expect(item.rating, 4.5);
      expect(item.reviews, 128);
      expect(item.category, 'Pizza');
      expect(item.distance, 1.7);
      expect(item.timeToDeliver, '30 min');
      expect(item.isPopular, true);
    });

    test('should default isPopular to false', () {
      final item = FoodItem(
        id: 2,
        name: 'Caesar Salad',
        description: 'Fresh salad',
        price: 9.99,
        imageUrl: 'assets/images/salad1.jpg',
        rating: 4.3,
        reviews: 95,
        category: 'Salad',
        distance: 1.5,
        timeToDeliver: '20 min',
      );

      expect(item.isPopular, false);
    });
  });

  group('Category', () {
    test('should create Category with correct properties', () {
      final category = Category(
        id: 1,
        name: 'Pizza',
        icon: '🍕',
      );

      expect(category.id, 1);
      expect(category.name, 'Pizza');
      expect(category.icon, '🍕');
    });
  });
}
