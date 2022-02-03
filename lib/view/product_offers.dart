import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_rabbit_coding_test/Utils/app_strings.dart';
import 'package:white_rabbit_coding_test/bloc/home_page_bloc.dart';
import 'package:white_rabbit_coding_test/bloc/state/home_state.dart';

class ProductOffers extends StatelessWidget {
  const ProductOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomeState>(
        buildWhen: (prev, current) => prev.products != current.products,
        builder: (context, state) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        AppStrings.discountsForYou,
                        style: Theme.of(context).textTheme.headline5,
                      )),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.viewAll,
                            style: Theme.of(context).textTheme.bodyText2,
                          ))
                    ],
                  ),
                  GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,

                    physics: const NeverScrollableScrollPhysics(),

                    shrinkWrap: true,
                    // Generate 100 widgets that display their index in the List.
                    children:
                        (state.products ?? []).asMap().entries.map((entry) {
                      return GestureDetector(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: entry.value.image ?? "",
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                entry.value.name ?? "",
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                entry.value.offer ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: Colors.green),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
