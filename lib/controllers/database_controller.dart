import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utilities/api_path.dart';

import '../models/Product.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();
  Stream<List<Product>> newProductsStream();
}

class FirestoreDatabse implements Database {
  final String uid;

  final _service = FirestoreServices.instance;

  FirestoreDatabse(this.uid);

  @override
  Stream<List<Product>> salesProductsStream() => _service.collectionsStream(
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
    queryBuilder: (query) => query.where('discount', isNotEqualTo: 0),
  );
  @override
  Stream<List<Product>> newProductsStream() => _service.collectionsStream(
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
  );
  Future<void> setProduct(Product product) async =>
      _service.setData(path: 'products/${product.id}', data: product.toMap());
}
