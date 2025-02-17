import 'package:flutter/material.dart';
import 'package:foodcommerce/constants.dart';
import 'package:foodcommerce/models/food_item.dart';
import 'package:foodcommerce/widgets.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodItem food;

  const FoodDetailScreen({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Appcolors.mainColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Appcolors.mainColor,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: BigText(text: food.name),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Appcolors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Appcolors.mainColor.withOpacity(0.8),
                ),
                child: Center(
                  child: Icon(
                    Icons.restaurant_menu,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Appcolors.mainColor,
                                size: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SmallText(text: '${food.rating}'),
                          const SizedBox(width: 10),
                          SmallText(text: '${food.reviews}'),
                          const SizedBox(width: 5),
                          const SmallText(text: 'comments'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconTextWidget(
                            icon: Icons.circle,
                            text: food.category,
                            iconColor: Appcolors.iconColor1,
                          ),
                          IconTextWidget(
                            icon: Icons.location_on,
                            text: '${food.distance}km',
                            iconColor: Appcolors.mainColor,
                          ),
                          IconTextWidget(
                            icon: Icons.access_time_rounded,
                            text: food.timeToDeliver,
                            iconColor: Appcolors.iconColor2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      BigText(
                        text: 'Description',
                        size: 22,
                        color: Appcolors.mainBlackColor,
                      ),
                      const SizedBox(height: 10),
                      SmallText(
                        text: food.description,
                        height: 1.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Appcolors.buttonBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Appcolors.signColor),
                  const SizedBox(width: 5),
                  BigText(text: "0"),
                  const SizedBox(width: 5),
                  Icon(Icons.add, color: Appcolors.signColor),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Appcolors.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  BigText(
                    text: "\$${food.price} | ",
                    color: Colors.white,
                  ),
                  const BigText(
                    text: "Add to cart",
                    color: Colors.white,
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
