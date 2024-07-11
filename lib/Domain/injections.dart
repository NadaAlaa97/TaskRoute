import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../Data/model/repository/product_repository.dart';
import '../Presentation/product_list/Cubit/product_cubit.dart';
import 'UseCases/getProducts.dart';

final getIt = GetIt.instance;
void injectionGetIt(){
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<ProductRepository>(()=> ProductRepository(getIt<http.Client>()));
  getIt.registerLazySingleton<GetProducts>(()=> GetProducts(getIt<ProductRepository>()));
  getIt.registerFactory<ProductCubit>(()=> ProductCubit(getIt<GetProducts>()));
}
