import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import '../../../../core/utilies/helper.dart';
import '../../../cart/presentation/model_views/cart_cubit/cart_cubit.dart';
import '../../../cart/presentation/model_views/cart_cubit/cart_state.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../our_products/presentation/views/our_products_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddItemSuccess) {
          Helper.successMessage(context, message: state.success);
        } else if (state is CartUpdateItemSuccess) {
          Helper.successMessage(context, message: state.success);
        } else if (state is CartAddItemFailure) {
          Helper.errorMessage(context, message: state.error);
        } else if (state is CartItemFetchFailure) {
          Helper.errorMessage(context,
              message:
                  'حدث خطأ أثناء تحميل بيانات سلتك. من فضلك حاول مره أخري');
        }
      },
      child: IndexedStack(
        index: context.watch<BottomNavigationCubit>().getSelectedIndex,
        children: [
          const HomeView(),
          const OurProductsView(),
          const CartView(),
          Container(
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
