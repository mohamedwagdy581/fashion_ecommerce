import 'package:flutter/material.dart';

import 'components.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          category(
            onTapped: () {},
            categoryImage: 'assets/images/cats/tshirt.png',
            categoryCaption: 'Shirt',
          ),
          category(
            onTapped: () {},
            categoryImage: 'assets/images/cats/dress.png',
            categoryCaption: 'Shirt',
          ),
          category(
            onTapped: () {},
            categoryImage: 'assets/images/cats/informal.png',
            categoryCaption: 'Informal',
          ),
          category(
            onTapped: () {},
            categoryImage: 'assets/images/cats/formal.png',
            categoryCaption: 'Formal',
          ),
          category(
            onTapped: () {},
            categoryImage: 'assets/images/cats/shoe.png',
            categoryCaption: 'Shoe',
          ),
          category(
            onTapped: () {},
            categoryImage: 'assets/images/cats/accessories.png',
            categoryCaption: 'Accessories',
          ),
        ],
      ),
    );
  }

  Widget category({
    required VoidCallback onTapped,
    required String categoryImage,
    required categoryCaption,
  }) =>
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: 78,
          child: customListTileWidget(
            onTapped: () {},
            title: Image.asset(
              categoryImage,
              width: 60.0,
              height: 55.0,
            ),
            subTitle: Text(
              categoryCaption,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}
