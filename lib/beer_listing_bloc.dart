
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'beer_repository.dart';

class BeerListingState {}

class BeerListingBloc extends Bloc<Event, BeerListingState> {
  final PagingController<int, String> pagingController = PagingController(firstPageKey: 0);
  final BeerRepository repos = BeerRepository();

  BeerListingBloc() : super(BeerListingState()) {
    on<NewPage>((event, emit) {
      final newPage = repos.getBeers(event.pageKey);
      pagingController.appendPage(newPage, event.pageKey + 1);
    });
  }
}

abstract class Event {}

class FetchEvent extends Event {}

class NewPage extends Event {
  NewPage(this.pageKey);

  final int pageKey;
}
