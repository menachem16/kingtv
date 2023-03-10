import 'package:xtream/Components/card.dart';
import 'package:xtream/Entites/movies.dart';
import 'package:xtream/Entites/Play.dart';
import 'package:xtream/providers/starred_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  final int category_id;
  final String category_name;

  const MoviesScreen({
    super.key,
    this.category_id = 50,
    this.category_name = 'Category Name',
  });

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movies> entries = [];
  bool hasBeenSet = false;
  late Starred starred;

  @override
  @override
  Widget build(BuildContext context) {
    setState(() {
      starred = context.watch<Starred>();
    });
    /* if (!hasBeenSet) {
      Movies.getAll(widget.category_id, starred.login?.get('logins'))
          .then((values) => {
                setState(() {
                  entries.addAll(values);
                  hasBeenSet = true;
                })
              });
    } */
    void openChannel(channel) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Play(
                id: channel.stream_id.toString(),
                type: 'movie',
                extension: 'mkv',
                name: channel.name,
              )));
    }

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      widget.category_name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                      for (int i = 0; i < snapshot.data.length; i++)
                        InnerCard(
                          onPressed: () {
                            openChannel(snapshot.data[i]);
                          },
                          onStar: () {},
                          content: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    snapshot.data[i].stream_icon,
                                    fit: BoxFit.contain,
                                    width: 300,
                                    height: 300,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.warning,
                                          size: 45,
                                          color: Colors.redAccent,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    snapshot.data[i].name.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ))
              ],
            );
          } else {
            return const Text('An error occured');
          }
        },
        future: Movies.getAll(widget.category_id, starred.login?.get('logins')),
      ),
    ));
  }
}
