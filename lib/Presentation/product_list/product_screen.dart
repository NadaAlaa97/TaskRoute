import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Domain/injections.dart';
import '../widgets/SearchTextField.dart';
import 'Cubit/product_cubit.dart';
import 'Cubit/product_state.dart';


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
          height: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              children: [
                Expanded(child: SearchTextField()),
                SizedBox(width: 20,),
                Icon(FontAwesomeIcons.cartShopping,color: Colors.blue,size: 30,)
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
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
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
                                  width: 2,
                                  color: Colors.blue.withOpacity(0.3),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Stack(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: (state is ProductLoaded)? state.productResponse[index].thumbnail : '',
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
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
                                                      width: 30,
                                                      height: 30,
                                                      child: Icon(Icons.favorite_border_outlined, color: Colors.blue,),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          (state is ProductLoaded)? state.productResponse[index].title : '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              (state is ProductLoaded)? 'EGP ${state.productResponse[index].price}' : '',
                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 4.5,),
                                            Text((state is ProductLoaded)? '${state.productResponse[index].price * 2}' : '',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                decorationColor: Colors.blue,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              (state is ProductLoaded)? 'Review (${state.productResponse[index].rating})' : '',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            SizedBox(width: 3,),
                                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                                            SizedBox(width: 12,),
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              width: 30,
                                              height: 30,
                                              child: Icon(Icons.add, color: Colors.white, size: 20,),
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
