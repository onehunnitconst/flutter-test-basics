import 'package:flutter/material.dart';
import 'package:flutter_test_basics/fetcher.dart';
import 'package:http/http.dart' as http;
import 'domain/album.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Fetcher fetcher;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    fetcher = Fetcher(client: http.Client());
    futureAlbum = fetcher.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
