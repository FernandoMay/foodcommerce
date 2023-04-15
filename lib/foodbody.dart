import 'package:flutter/material.dart';
import 'package:foodcommerce/constants.dart';
import 'package:foodcommerce/widgets.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var currPageValue = 0.0;
  double scaleFactor = 0.8;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  // ignore: must_call_super
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return buildPageItem(position);
          }),
    );
  }

  Widget buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();

    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
    }

    return Transform(
      transform: matrix4,
      child: Stack(children: [
        Container(
          height: 180,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index.isEven
                  ? const Color(0xFF69c5DF)
                  : const Color(0xFF9294cc),
              image: const DecorationImage(
                  image: AssetImage('assets/images/jewel.jpg'),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bangles'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Appcolors.mainColor,
                            size: 15,
                          );
                        }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const SmallText(text: '4.5'),
                      const SizedBox(
                        width: 10,
                      ),
                      const SmallText(text: '1287'),
                      const SizedBox(
                        width: 5,
                      ),
                      const SmallText(text: 'comments'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconTextWidget(
                          icon: Icons.circle,
                          text: 'Normal',
                          iconColor: Appcolors.iconColor1),
                      const SizedBox(
                        width: 25,
                      ),
                      IconTextWidget(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: Appcolors.mainColor),
                      const SizedBox(
                        width: 25,
                      ),
                      IconTextWidget(
                          icon: Icons.access_time,
                          text: '1.7km',
                          iconColor: Appcolors.iconColor2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
