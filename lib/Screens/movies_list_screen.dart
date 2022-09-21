import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Providers/MovieListProvider/bloc/movies_provider_bloc.dart';
import 'package:movie_app/Widgets/MovieListScreen/movies_list_widget.dart';



class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      
      body: BlocProvider(
        create: (_) => MoviesProviderBloc()..add(MovieLoading()),
        child: const MoviesListWidget(),
      ),
    );
  }
}