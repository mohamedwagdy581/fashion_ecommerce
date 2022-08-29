import 'package:flutter/material.dart';

import '../../modules/product_details.dart';
import 'components.dart';

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var similarProductList = [
    {
      'productName': 'Blazer',
      'productPicture': 'assets/images/products/blazer1.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
    {
      'productName': 'Blazer',
      'productPicture': 'assets/images/products/blazer2.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
    {
      'productName': 'Dress',
      'productPicture': 'assets/images/products/dress1.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
    {
      'productName': 'Skt',
      'productPicture': 'assets/images/products/skt1.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: similarProductList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => singleSimilarProduct(
        prodName: similarProductList[index]['productName'],
        prodPicture: similarProductList[index]['productPicture'],
        prodPrice: similarProductList[index]['productPrice'],
        prodOldPrice: similarProductList[index]['productOldPrice'],
      ),
    );
  }

  Widget singleSimilarProduct({
    required prodName,
    required prodPicture,
    required prodPrice,
    required prodOldPrice,
  }) =>
      Card(
        child: Hero(
            tag: Text(prodName),
            child: Material(
              child: InkWell(
                onTap: () {
                  navigateTo(
                    context,
                    ProductDetailsScreen(
                      productDetailsName: prodName,
                      productDetailsPicture: prodPicture,
                      productDetailsPrice: prodPrice,
                      productDetailsOldPrice: prodOldPrice,
                    ),
                  );
                },
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 1.0,bottom: 1.0,),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              prodName,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '\$$prodPrice',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prodPicture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
      );
}
