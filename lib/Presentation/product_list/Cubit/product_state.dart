import 'package:equatable/equatable.dart';

import '../../../Domain/entities/ProductResponseEntity.dart';

abstract class ProductState extends Equatable{
  const ProductState();
  @override
  List<Object> get props => [];

}
class ProductStart extends ProductState{}
class ProductLoad extends ProductState{}
class ProductLoaded extends ProductState{
  final List<Product> productResponse;
  const ProductLoaded(this.productResponse);
  @override
  List<Object> get props => [productResponse];
}
class ProductError extends ProductState{
  final String message;
  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}

