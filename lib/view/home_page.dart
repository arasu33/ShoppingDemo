import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_coding_test/Utils/app_strings.dart';
import 'package:white_rabbit_coding_test/bloc/events/home_event.dart';
import 'package:white_rabbit_coding_test/bloc/home_page_bloc.dart';
import 'package:white_rabbit_coding_test/view/product_carousel.dart';
import 'package:white_rabbit_coding_test/view/product_offers.dart';

import 'banners.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageBloc()..add(LoadDataEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(AppStrings.homeTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              // Products carousel
              ProductCarousel(),
              // Products details
              ProductOffers(),
              // Products banners
              ProductBanners(),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
    ;
  }
}
