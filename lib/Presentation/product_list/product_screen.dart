import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Domain/injections.dart';
import '../widgets/SearchTextField.dart';
import 'Cubit/product_cubit.dart';
import 'Cubit/product_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/images/logo.png'),
          height: 30.h,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              children: [
                Expanded(child: SearchTextField()),
                SizedBox(width: 20.w,),
                Icon(Icons.shopping_cart_outlined,color: Color(0xFF3f6c99),size: 35,)
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: BlocProvider(
                create: (context) => getIt<ProductCubit>()..fetchProducts(),
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoad) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.h,
                        mainAxisSpacing: 5.h,
                        childAspectRatio: 1 / 1.5,
                      ),
                      itemCount: (state is ProductLoaded)? state.productResponse.length : 0,
                      itemBuilder: (context, index) {
                        return Material(
                          borderRadius: BorderRadius.circular(15),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2.w,
                                  color: Color(0xFFb2c8da),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: 250.h,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(25),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: (state is ProductLoaded)? state.productResponse[index].thumbnail : '',
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 5,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 8, right: 4),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      width: 30.w,
                                                      height: 30.h,
                                                      child: Icon(Icons.favorite_border_outlined, color: Color(0xFF38608b),),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text(
                                            (state is ProductLoaded)? state.productResponse[index].title : '',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text(
                                            (state is ProductLoaded)? state.productResponse[index].description : '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Text(
                                                (state is ProductLoaded)? 'EGP ${state.productResponse[index].price}' : '',
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            SizedBox(width: 4.3.w,),
                                            Text((state is ProductLoaded)? '${state.productResponse[index].price * 2}' : '',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF6e96b7),
                                                decorationColor: Color(0xFF6e96b7),
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Text(
                                                (state is ProductLoaded)? 'Review (${state.productResponse[index].rating})' : '',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(width: 4.w,),
                                            Icon(Icons.star, color: Color(0xFFfed506), size: 20,),
                                            SizedBox(width: 20.w,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 4),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF06417e),
                                                ),
                                                width: 35.w,
                                                height: 35.h,
                                                child: Center(child: Icon(Icons.add, color: Colors.white, size: 20,)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
