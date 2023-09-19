import 'dart:convert';

import 'package:add_to_cart/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key, required this.products});

  List<ProductModel> products = [];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override

  void initState(){

    _getData();

    super.initState();
  }

  List <ProductModel> cartProducts = [];



  _getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var element in widget.products) {
      if (prefs.containsKey(element.name!)) {
        cartProducts.add(element);
        
      }
      
    }

    setState(() {
      
    });
    // String data = prefs.getString("shoes") ?? "";
    // Map <String, dynamic> map = jsonDecode(data);
    // print(map);

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurpleAccent, title: Text("the cart"),),
      body:  ListView.builder( itemCount: cartProducts.length
        ,itemBuilder:(context, index){

        return Card(
          child: ListTile(
            trailing: InkWell(
            onTap:() async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(cartProducts[index].name!);
              cartProducts.remove(cartProducts[index]!);
              setState(() {
                
              });
            },
            child: Text("Remove from cart")),
            title: Text(cartProducts[index].name!),
            subtitle: Text(cartProducts[index].category!),
            leading: Text(cartProducts[index].price.toString()),
          ),
          
        );
        
      }),
    );
  }
}