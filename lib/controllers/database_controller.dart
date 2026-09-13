import 'package:ecommerce_app/services/firestore_services.dart';

import '../models/Product.dart';

abstract class Database {
  Stream<List<Product>>productsStream();
}
class FirestoreDatabse implements Database{
  final _service = FirestoreServices.instance;
  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
      path: 'products/',
      builder: (data,documentId)=>Product.fromMap(data!,documentId),
  );
}