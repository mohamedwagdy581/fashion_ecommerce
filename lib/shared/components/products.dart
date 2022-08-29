import 'package:flutter/material.dart';

import '../../modules/product_details.dart';
import 'components.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
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
    {
      'productName': 'Hills',
      'productPicture': 'assets/images/products/hills1.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
    {
      'productName': 'Pants',
      'productPicture': 'assets/images/products/pants2.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
    {
      'productName': 'Hills 2',
      'productPicture': 'assets/images/products/hills2.jpeg',
      'productPrice': 100.00,
      'productOldPrice': 80.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: singleProduct(
          prodName: productList[index]['productName'],
          prodPicture: productList[index]['productPicture'],
          prodPrice: productList[index]['productPrice'],
          prodOldPrice: productList[index]['productOldPrice'],
        ),
      ),
    );
  }

  Widget singleProduct({
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
