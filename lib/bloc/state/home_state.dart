import 'package:equatable/equatable.dart';
import 'package:white_rabbit_coding_test/model/product_discounts.dart';

class HomeState extends Equatable {
  final List<String>? carousel;
  final List<String>? banner;
  final List<ProductDiscounts>? products;

  const HomeState({this.carousel, this.banner, this.products});
  HomeState copyWith(
      {List<String>? carousel,
      List<String>? banner,
      List<ProductDiscounts>? products}) {
    return HomeState(
        carousel: carousel ?? this.carousel,
        products: products ?? this.products,
        banner: banner ?? this.banner);
  }

  @override
  List<Object> get props => [];
}
