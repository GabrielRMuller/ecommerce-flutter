import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of<UserProvider>(context);
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    if (_userProvider.isLogado) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Destinatário:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${_userProvider.user.firstName} ${_userProvider.user.lastName}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Endereço:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${_cartProvider.addressModel.street}, ${_cartProvider.addressModel.number} - ${_cartProvider.addressModel.zipCode}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Produto(s):",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[800],
                ),
              ),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _cartProvider.items.length,
                    itemBuilder: (_, index) {
                      return CartItem(_cartProvider.items[index]);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  print('finalizar');
                },
                elevation: 0,
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    "CONFIRMAR",
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.LOGIN);
        },
        child: Text("LOGIN"),
      ),
    );
  }
}
