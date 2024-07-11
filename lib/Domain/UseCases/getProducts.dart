
import '../../Data/model/repository/product_repository.dart';
import '../entities/ProductResponseEntity.dart';

class GetProducts{
  final ProductRepository repository;
  GetProducts(this.repository);
  Future<List<Product>> call() async{
    final products = await repository.fetchProducts();
    return products.map((ProductModel) => Product(
      id:ProductModel.id,
      title: ProductModel.title,
      description: ProductModel.description,
      price: ProductModel.price,
      discountPercentage: ProductModel.discountPercentage,
      rating: ProductModel.rating,
      thumbnail: ProductModel.thumbnail,
    )).toList();
  }
}
