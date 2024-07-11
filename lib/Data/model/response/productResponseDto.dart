import 'package:equatable/equatable.dart';
import 'package:route/Domain/entities/ProductResponseEntity.dart';

class ProductModel extends Product with EquatableMixin{
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.thumbnail,

  });
  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title']?? '',
      description: json['description']??'',
      price: (json['price']??0).toDouble(),
      discountPercentage: (json['discountPercentage']??0).toDouble(),
      rating: (json['rating']??0).toDouble(),
      thumbnail: json['thumbnail']??'',
    );
  }
  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    discountPercentage,
    rating,
    thumbnail,
  ];
}
