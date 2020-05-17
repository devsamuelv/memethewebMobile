import 'package:MemeApplicationFirebaseHackathon/backend/models/meme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

class MemeCard extends StatelessWidget {

  final Meme meme;

  MemeCard({ this.meme });

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 500),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                      meme.photoUrl),
                    ),
                    ListTile(
                      title: Text(meme.title),
                      subtitle: Text(meme.description),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Like'),
                          color: redColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                ],
              ),
            ),
          )
    );
  }
}