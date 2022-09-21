import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/Providers/MovieListProvider/bloc/movies_provider_bloc.dart';
import 'package:movie_app/Widgets/MovieListScreen/movie_list_item.dart';
import 'package:movie_app/Widgets/MovieListScreen/movie_list_loading_shimmer_page.dart';

import '../Utils/bottom_loader.dart';

class MoviesListWidget extends StatefulWidget {
  const MoviesListWidget({super.key});

  @override
  State<MoviesListWidget> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesListWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesProviderBloc, MoviesProviderState>(
      builder: (context, state) {
        switch (state.movieStatus) {
          case MovieStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case MovieStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MovieStatus.success:
            if (state.moviesList.size() <= 0) {
              return const Center(child: Text('no movies'));
            }
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.49,
              controller: _scrollController,
              children: List.generate(
                state.hasReachedMax
                    ? state.moviesList.size()
                    : state.moviesList.size() + 1,
                (index) => index >= state.moviesList.size()
                    ? const BottomLoader()
                    : MovieListItem(
                        movie: state.moviesList.get(
                          index,
                        ),
                      ),
              ),
            );
          case MovieStatus.initial:
            return const Center(child: MovieListsLoadingPage());
          default:
            return const Center(child: Text('Unknown State'));
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MoviesProviderBloc>().add(MovieLoading());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
