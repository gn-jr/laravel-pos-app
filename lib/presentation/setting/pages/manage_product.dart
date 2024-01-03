import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/core/assets/assets.gen.dart';
import 'package:flutter_pos_app/core/components/spaces.dart';
import 'package:flutter_pos_app/presentation/home/models/product_category.dart';
import 'package:flutter_pos_app/presentation/home/models/product_model.dart';
import 'package:flutter_pos_app/presentation/setting/pages/add_product_page.dart';

import '../../home/bloc/product/product_bloc.dart';
import '../widgets/menu_product_item.dart';

class ManageProductPage extends StatefulWidget {
  const ManageProductPage({super.key});

  @override
  State<ManageProductPage> createState() => _ManageProductPageState();
}

class _ManageProductPageState extends State<ManageProductPage> {
  final List<ProductModel> products = [
    ProductModel(
      image: Assets.images.f1.path,
      name: 'Vanilla Late',
      category: ProductCategory.drink,
      price: 28700,
      stock: 5,
    ),
    ProductModel(
      image: Assets.images.f2.path,
      name: 'V60 Drip',
      category: ProductCategory.drink,
      price: 22500,
      stock: 5,
    ),
    ProductModel(
      image: Assets.images.f3.path,
      name: 'Ice Americano',
      category: ProductCategory.drink,
      price: 18500,
      stock: 5,
    ),
    ProductModel(
      image: Assets.images.f4.path,
      name: 'Cappuccino',
      category: ProductCategory.food,
      price: 36000,
      stock: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Product'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            'Product List',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(20.0),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (products) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  separatorBuilder: (context, index) => const SpaceHeight(22.0),
                  itemBuilder: (context, index) => MenuProductItem(
                    data: products[index],
                  ),
                );
              });
              // return ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: products.length,
              //   separatorBuilder: (context, index) => const SpaceHeight(22.0),
              //   itemBuilder: (context, index) => MenuProductItem(
              //     data: products[index],
              //   ),
              // );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AddProductPage();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
