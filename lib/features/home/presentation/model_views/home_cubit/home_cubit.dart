import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/product_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/repos/product_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ProductRepo _productRepo = GetIt.instance<ProductRepoImpl>();

  List<ProductEntity> _products = [];

  List<ProductEntity> get products => [..._products];

  Future<void> getProducts() async {
    emit(HomeProductsLoading());
    final result = await _productRepo.getProducts();
    result.fold((failure) {
      log('error in HomeCubit: getProducts ${failure.message}');
      emit(HomeProductsFailure());
    }, (success) {
      log('success in HomeCubit: getProducts ${success.length}');
      _products = success;
      emit(HomeProductsSuccess());
    });
  }
}
