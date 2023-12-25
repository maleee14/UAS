// shopping_cart.dart
import 'package:flutter/material.dart';
import 'package:project_uas/main.dart';

class ShoppingCartScreen extends StatelessWidget {
  final List<Product> productsInCart;

  ShoppingCartScreen({required this.productsInCart});

  @override
  Widget build(BuildContext context) {
    double subtotal = productsInCart.fold(
        0, (double sum, Product product) => sum + product.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Subtotal section
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart Subtotal:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${subtotal.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          // "Proceed to Checkout" button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                // Add logic for handling the button press to proceed to checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          // Products section
          Expanded(
            child: ListView.builder(
              itemCount: productsInCart.length,
              itemBuilder: (context, index) {
                Product product = productsInCart[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '\$${product.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          leading: Image.asset(
                            product.imageUrl,
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Dropdown for quantity
                            DropdownButton<int>(
                              value:
                                  1, // Replace with the actual quantity value
                              onChanged: (value) {
                                // Add logic to handle quantity change
                              },
                              items: List.generate(10, (index) => index + 1)
                                  .map((value) => DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      ))
                                  .toList(),
                            ),
                            // "Delete" button
                            TextButton(
                              onPressed: () {
                                // Add logic for handling the delete button press
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // "Save for Later" button
                            TextButton(
                              onPressed: () {
                                // Add logic for handling the save for later button press
                              },
                              child: Text(
                                'Save for Later',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
