import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_coding_test/bloc/state/home_state.dart';
import 'package:white_rabbit_coding_test/model/home_products_response.dart';
import 'package:white_rabbit_coding_test/repo/product_repo.dart';

import 'events/home_event.dart';

class HomePageBloc extends Bloc<HomeEvent, HomeState> {
  HomePageBloc() : super(HomeState()) {
    on<LoadDataEvent>((event, emit) async {
      HomeProductsResponse? _homeProductsResponse =
          await ProductRepo().getHomeDetailsData();
      emit(HomeState(
        products: _homeProductsResponse?.data?.productDiscounts,
        banner: _homeProductsResponse?.data?.banner,
        carousel: _homeProductsResponse?.data?.carousel,
      ));
    });
  }
}
