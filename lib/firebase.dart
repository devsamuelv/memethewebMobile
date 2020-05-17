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

void CreateMeme(var image, title, subtitle, username, tag, time) async {
  final StorageReference storageReference = FirebaseStorage().ref().child("posts2");
  StorageUploadTask file = await storageReference.putFile(image);

  var downloadUrl = await (await file.onComplete).ref.getDownloadURL().toString();

  if (downloadUrl == null) { throw new Error(); }

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
Widget _memeList(BuildContext context, List<DocumentSnapshot> snapshot) {}

// Widget _memeListItem(BuildContext context, DocumentSnapshot data) {
//   final record = 
// }