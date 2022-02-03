import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_coding_test/bloc/home_page_bloc.dart';
import 'package:white_rabbit_coding_test/bloc/state/home_state.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({Key? key}) : super(key: key);

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final CarouselController _controller = CarouselController();
  //Current item loaded
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomeState>(
        buildWhen: (prev, current) => prev.carousel != current.carousel,
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                //Slider
                CarouselSlider(
                  items: state.carousel
                          ?.map(
                            (item) => CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: item,
                            ),
                          )
                          .toList() ??
                      [],
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                //Bottom dots for slider
                Positioned.fill(
                  bottom: 8,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            (state.carousel ?? []).asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.grey
                                          : Colors.white)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
