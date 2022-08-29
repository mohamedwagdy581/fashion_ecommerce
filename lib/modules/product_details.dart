
import 'package:flutter/material.dart';

import '../shared/components/components.dart';
import '../shared/components/similar_products.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic productDetailsName;
  final dynamic productDetailsPicture;
  final dynamic productDetailsPrice;
  final dynamic productDetailsOldPrice;

  const ProductDetailsScreen({
    super.key,
    required this.productDetailsName,
    required this.productDetailsPicture,
    required this.productDetailsPrice,
    required this.productDetailsOldPrice,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: (){
            navigateAndFinish(context, const HomeScreen());
          },
            child: Text(widget.productDetailsName),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()
            {
              navigateTo(context, const CartScreen());
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 300.0,
            child: GridTile(
              footer: Container(
                padding: const EdgeInsets.only(left: 10.0),
                height: 45.0,
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailsName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '\$${widget.productDetailsPrice}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${widget.productDetailsOldPrice}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: Image.asset(
                widget.productDetailsPicture,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // =============== The First Button ==============
          Row(
            children: [
              customButtons(
                title: 'Size',
                onPressed: () {
                  customShowingDialog(
                    context: context,
                    title: 'Size',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Small'),
                        Text('Medium'),
                        Text('Large'),
                        Text('X-Large'),
                      ],
                    ),
                  );
                },
              ),
              customButtons(
                title: 'Color',
                onPressed: () {
                  customShowingDialog(
                    context: context,
                    title: 'Color',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Red'),
                        Text('Blue'),
                        Text('Black'),
                        Text('White'),
                      ],
                    ),
                  );
                },
              ),
              customButtons(
                title: 'Quantity',
                fontSize: 13.0,
                onPressed: () {
                  customShowingDialog(
                    context: context,
                    title: 'Quantity',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('1'),
                        Text('2'),
                        Text('3'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),

          // ============== The Second Button ==============
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.5,
                  child: const Text('Buy Now'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),

          const Divider(
            thickness: 1.0,
          ),

          const Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              top: 10.0,
              bottom: 5.0,
            ),
            child: ListTile(
              title: Text(
                'Product Details : ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              ),
            ),
          ),

          const Divider(
            thickness: 1.0,
          ),

          productDetailsShowing(
            hintTitle: 'Product Name : ',
            title: '${widget.productDetailsName}',
          ),
          productDetailsShowing(
            hintTitle: 'Product Brand : ',
            title: '${widget.productDetailsName}',
          ),
          productDetailsShowing(
            hintTitle: 'Product Condition : ',
            title: '${widget.productDetailsName}',
          ),

          const Divider(
            thickness: 1.0,
          ),

          // =================== Similar Products Text ==================
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Similar Products',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          //================= Similar Products =================
          const SizedBox(
            height: 300.0,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }

  Widget customButtons({
    required String title,
    required VoidCallback onPressed,
    double? fontSize,
  }) =>
      Expanded(
        child: MaterialButton(
          onPressed: onPressed,
          color: Colors.white,
          textColor: Colors.grey,
          elevation: 0.2,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
              const Expanded(
                child: Icon(
                  Icons.arrow_drop_down,
                ),
              ),
            ],
          ),
        ),
      );

  Future customShowingDialog({
    required context,
    required String title,
    required dynamic content,
  }) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            MaterialButton(
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );

  Widget productDetailsShowing({
    required String hintTitle,
    required String title,
  }) =>
      Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 5.0,
        ),
        child: Row(
          children: [
            Text(
              hintTitle,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
