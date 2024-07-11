import 'package:bloc/bloc.dart';
import 'package:route/Presentation/product_list/Cubit/product_state.dart';
import '../../../Domain/UseCases/getProducts.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  ProductCubit(this.getProducts) : super(ProductStart());
  Future<void> fetchProducts() async{
    try{
      emit(ProductLoad());
      final products = await getProducts();
      emit(ProductLoaded(products));
    } catch(e){
      emit(ProductError(e.toString()));
    }
  }
}
