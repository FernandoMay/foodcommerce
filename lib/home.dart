import 'package:flutter/material.dart';
import 'package:foodcommerce/constants.dart';
import 'package:foodcommerce/models/food_item.dart';
import 'package:foodcommerce/screens/food_detail.dart';
import 'package:foodcommerce/utils/data.dart';
import 'package:foodcommerce/widgets.dart';
import 'package:foodcommerce/widgets/category_item.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<FoodItem> displayedItems;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    displayedItems = AppData.allItems;
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedItems = AppData.allItems;
      } else {
        displayedItems = AppData.allItems
            .where((item) =>
                item.name.toLowerCase().contains(query.toLowerCase()) ||
                item.category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void onCategorySelected(Category category) {
    setState(() {
      displayedItems = AppData.allItems
          .where((item) => item.category == category.name)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Thailand',
                        color: Appcolors.mainColor,
                      ),
                      Row(
                        children: [
                          const SmallText(
                            text: 'Bangkok',
                            size: 12,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Appcolors.mainColor,
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: filterItems,
                decoration: InputDecoration(
                  hintText: 'Search food items...',
                  hintStyle: TextStyle(color: Appcolors.signColor),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Appcolors.mainColor),
                ),
              ),
            ),

            // Categories
            CategoryList(
              categories: AppData.categories,
              onCategorySelected: onCategorySelected,
            ),

            // Food Items
            Expanded(
              child: displayedItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Appcolors.mainColor,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No items found',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: displayedItems.length,
                      itemBuilder: (context, index) {
                        final item = displayedItems[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => FoodDetailScreen(food: item));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Food Image
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: index.isEven
                                        ? const Color(0xFF69c5DF)
                                        : const Color(0xFF9294cc),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                // Food Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: item.name),
                                      const SizedBox(height: 8),
                                      SmallText(
                                        text: item.description,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: '\$${item.price}',
                                            color: Appcolors.mainColor,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: Appcolors.mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const SmallText(
                                              text: 'Add to cart',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
