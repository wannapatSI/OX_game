import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tic_tac_toe/model/game_model.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /*getMatch(Match matchData) async {
    var_dbUID = FirebaseAuth.instance;
    await _db.collection("Game_Match").doc(_db.uid);
  }*/

  addMatch(Match matchData) async {
    await _db.collection("Game_Match").add(matchData.toMap());
  }

  updateMatch(Match matchData) async {
    await _db
        .collection("Game_Match")
        .doc(matchData.matchID)
        .update(matchData.toMap());
  }

  Future<void> deleteMatch(String documentId) async {
    await _db.collection("Game_Match").doc(documentId).delete();
  }

  Future<List<Match>> retrieveMatch() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Game_Match").get();
    return snapshot.docs
        .map((docSnapshot) => Match.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  /*Future<Match> getMatchDetails(String documentId) async {
    final snapshot = await _db
        .collection("Game_Match")
        .where(documentId, isEqualTo: documentId)
        .get();
    final matchData = snapshot.docs.map((e) => Match.fromSnapshot(e)).single;
    return matchData;
  }*/
}
