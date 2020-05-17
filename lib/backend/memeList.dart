import 'package:MemeApplicationFirebaseHackathon/backend/models/meme.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/screens/memeCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class memeList extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<memeList> {
  @override
  Widget build(BuildContext context) {

    final memes = Provider.of<List<Meme>>(context);

    // print(memes.documents);

    return ListView.builder(
      itemCount: memes.length,
      itemBuilder: (context, index) {
        return MemeCard(meme: memes[index]);
      },
    );
  }
}