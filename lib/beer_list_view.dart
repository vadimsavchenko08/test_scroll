import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_scroll_view/beer_listing_bloc.dart';

import 'beer_list_item.dart';

class BeerListView extends StatelessWidget {
  const BeerListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => BeerListingBloc(), child: BlocBuilder<BeerListingBloc, BeerListingState>(builder: (context, state) {

          final bloc = context.read<BeerListingBloc>();
          final controller = bloc.pagingController;

          controller.addPageRequestListener((pageKey) {
            bloc.add(NewPage(pageKey));
          });

          return RefreshIndicator(
            onRefresh: () => Future.sync(
              () => controller.refresh(),
            ),
            child: PagedListView<int, String>.separated(
              pagingController: controller,
              builderDelegate: PagedChildBuilderDelegate<String>(
                animateTransitions: true,
                itemBuilder: (context, item, index) => BeerListItem(
                  beer: item,
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
            ),
          );
        }));

  }
}
