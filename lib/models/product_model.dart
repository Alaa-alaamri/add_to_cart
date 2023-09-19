class ProductModel{
  String? name;
  String? category;
  double? price;

  ProductModel({this.name, this.category, this.price});

Map<String, dynamic> toMap(){
  return{
    "name": name,
    "category": category,
    "price":price

    

  };
}

}