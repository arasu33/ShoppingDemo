import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_coding_test/bloc/home_page_bloc.dart';
import 'package:white_rabbit_coding_test/bloc/state/home_state.dart';

class ProductBanners extends StatelessWidget {
  const ProductBanners({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomeState>(
        buildWhen: (prev, current) => prev.banner != current.banner,
        builder: (context, state) {
          return Column(
            children: (state.banner ?? [])
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: item,
                    ),
                  ),
                )
                .toList(),
          );
        });
  }
}
