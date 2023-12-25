import 'package:flutter/material.dart';
import 'package:project_uas/cart/shopchart.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Music Album', price: 125, imageUrl: 'assets/product1.jpg'),
    Product(
        name: 'Queen Concert |', price: 255, imageUrl: 'assets/product2.jpg'),
    Product(
        name: 'Blue Jazz Concert |',
        price: 199,
        imageUrl: 'assets/product3.jpg'),
    Product(
        name: 'The Beatles Concert |',
        price: 349,
        imageUrl: 'assets/product4.jpg'),
    Product(
        name: 'Metallica Concert |',
        price: 299,
        imageUrl: 'assets/product5.jpg'),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Add logic for handling the back button press
            },
          ),
          title: Text('Music'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add logic for handling the bell button press
              },
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingCartScreen(
                            productsInCart: List.from(products))),
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BigProductCard(product: products.first),
              ProductGrid(products: products.sublist(1)),
            ],
          ),
        ),
      ),
    );
  }
}

class BigProductCard extends StatelessWidget {
  final Product product;

  BigProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
              height: 300.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Rock music is a genre of popular music. It developed during and after the 1960s in the United Kingdom. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.0, // Adjust the height of the entire card
      child: Card(
        margin: EdgeInsets.all(3.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic for handling the button press (e.g., adding to cart)
              },
              child: Text('Buy Ticket'),
            ),
            SizedBox(height: 3.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 3.0),
          ],
        ),
      ),
    );
  }
}
