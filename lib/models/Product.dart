import 'package:ecommerce_app/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int discount;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discount = 0,
    this.category = 'Other',
    this.rate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':   id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discount': discount,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map,String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      discount: map['discount'] as int,
      category: map['category'] as String,
      rate: map['rate'] as double,
    );
  }
}


List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.tempProductAsset1,
    discount: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.tempProductAsset1,
    discount: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.tempProductAsset1,
    discount: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.tempProductAsset1,
    discount: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.tempProductAsset1,
    discount: 20,
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.tempProductAsset1,
    discount: 20,
  ),
];
