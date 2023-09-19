import 'dart:convert';

import 'package:add_to_cart/models/product_model.dart';
import 'package:add_to_cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 List <ProductModel> products = [ 
  ProductModel(
    name: "shoes", category: "shoes", price: 22
  ),
    ProductModel(
    name: "tote bag", category: "bag", price: 12
  ),
    ProductModel(
    name: "sport watch", category: "watch", price: 122
  ),

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurpleAccent, title: Text("Products"),actions: [IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(products: products), 
        ));
      }, icon: Icon(Icons.add_shopping_cart))],),
      body: ListView.builder( itemCount: products.length
        ,itemBuilder:(context, index){
        return Card(
          child: ListTile(
            trailing: IconButton(onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();

              // Map<String, dynamic> item = {
              //   "name": products[index].name!,
              //   "category": products[index].category!,
              //   "price": products[index].price!,
              // };

              String data = jsonEncode(products[index].toMap());
              prefs.setString(products[index].name!, data);

            },
             icon:Icon(Icons.add_shopping_cart) ),
            title: Text(products[index].name!),
            subtitle: Text(products[index].category!),
            leading: Text(products[index].price.toString()),
          ),
          
        );
        
      }),
    );
  }
}