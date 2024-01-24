import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tick_watch/util/app_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<CartItem> cartItems = [
    CartItem('Watch 1', '50', 'assets/images/watch9.jpg', 2),
    CartItem('Watch 2', '30', 'assets/images/watch11.jpg', 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
        leading: const SizedBox(),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return buildCartItem(cartItems[index]);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            showCheckoutDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
          ),
          child: const Text('Checkout'),
        ),
      ),
    );
  }

  Widget buildCartItem(CartItem cartItem) {
    return ListTile(
      leading: Image.asset(
        cartItem.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        cartItem.name,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Price: \$${cartItem.price}'),
      trailing: Text('Quantity: ${cartItem.quantity}'),
    );
  }

  void showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
          content: Material(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _clearForm();
                  _submitForm();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Order is placed successfully"),
                    backgroundColor: Color.fromARGB(255, 38, 245, 1),
                  ));
                }
              },
              child: const Text('Place Order'),
            ),
            TextButton(
              onPressed: () {
                _clearForm();
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    Navigator.pop(context);
  }

  void _clearForm() {
    setState(() {
      _nameController.text = "";
      _addressController.text = "";
      _emailController.text = "";
    });
  }
}

class CartItem {
  String name, price, image;
  int quantity;

  CartItem(this.name, this.price, this.image, this.quantity);
}
