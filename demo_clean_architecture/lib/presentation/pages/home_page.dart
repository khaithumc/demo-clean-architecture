import 'package:demo_clean_architecture/di/injection.dart';
import 'package:demo_clean_architecture/domain/entities/list_movie.dart';
import 'package:demo_clean_architecture/domain/entities/result.dart';
import 'package:demo_clean_architecture/presentation/bloc/movie_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ListMovieBloc _listMovieBloc;

  @override
  void initState() {
    super.initState();
    _listMovieBloc = getIt<ListMovieBloc>();
    _listMovieBloc.searchMovie("", 1);
  }

  @override
  void dispose() {
    _listMovieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Search Movie"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildSearchField(),
        const SizedBox(
          height: 50,
        ),
        StreamBuilder<ListMovie>(
          stream: _listMovieBloc.stream,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var listMovie = snapshot.data;
              return _buildListView(listMovie);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(hintText: 'Search movie...'),
        onSubmitted: (value) => _listMovieBloc.searchMovie(value, 1),
      ),
    );
  }

  Widget _buildListView(ListMovie? listMovie) {
    return Expanded(
      child: ListView.builder(
        itemCount: listMovie?.results.length,
        itemBuilder: (_, index) {
          return _buildListItem(listMovie?.results[index]);
        },
      ),
    );
  }

  Widget _buildListItem(Result? result) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${result?.poster_path}"),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                (result != null) ? result.title : "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
