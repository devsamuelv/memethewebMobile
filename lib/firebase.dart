import 'package:MemeApplicationFirebaseHackathon/backend/memeList.dart';
import 'package:MemeApplicationFirebaseHackathon/backend/models/meme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final firestore = Firestore.instance;

Widget _memeBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: firestore.collection('Posts').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _memeList(context, snapshot.data.documents);
    },
  );
}

class Database {   
  List<Meme> _memeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Meme(
        name: doc.data['name'],
        description: doc.data['description'],
        userPhoto: doc.data['userPhoto'],
        title: doc.data['title'],
        photoUrl: doc.data['photoUrl'],
        username: doc.data['username'],
      );
    }).toList();
  }

  // get memes
  Stream<List<Meme>> get memes {
    return firestore.collection("Posts").snapshots()
      .map(_memeListFromSnapshot);
  }

  // create memes
  void CreateMeme(var image, title, subtitle, username, tag, time) async {
    final StorageReference storageReference =
        FirebaseStorage().ref().child("posts2");
    StorageUploadTask file = await storageReference.putFile(image);

    var downloadUrl =
        await (await file.onComplete).ref.getDownloadURL().toString();

    if (downloadUrl == null) {
      throw new Error();
    }

    await firestore.collection('Posts').add({
      'title': title,
      'description': subtitle,
      'photoUrl': downloadUrl,
      'tag': tag,
      'timeStamp': time
    }).then((data) => {
          // add after the doc is uploaded
        });
  }
}

// void GetMemes() async {
//   // var objs;

//   // await firestore.collection("Posts").getDocuments().then((docs) => {
//   //   objs = docs
//   // });

//   // return objs;
// }

Widget _memeList(BuildContext context, List<DocumentSnapshot> snapshot) {}

// Widget _memeListItem(BuildContext context, DocumentSnapshot data) {
//   final record =
// }
