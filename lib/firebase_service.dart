import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/user_model.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> getEventCollection() =>
      FirebaseFirestore.instance
          .collection('events')
          .withConverter<EventModel>(
            fromFirestore:
                (docSnapshot, _) => EventModel.fromJson((docSnapshot.data()!)),
            toFirestore: (event, _) => event.toJson(),
          );

  static CollectionReference<UserModel> getUserCollection() => FirebaseFirestore
      .instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore:
            (docSnapshot, _) => UserModel.fromJson((docSnapshot.data()!)),
        toFirestore: (user, _) => user.toJson(),
      );

  static Future<void> createEvent(EventModel event) {
    CollectionReference<EventModel> eventsCollection = getEventCollection();
    DocumentReference<EventModel> doc = eventsCollection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<void> updateEvent(EventModel event) async {
    await FirebaseFirestore.instance
        .collection('events')
        .doc(event.id) // 👈 This MUST match the original event
        .set(event.toJson()); // 👈 overwrite the data
  }

  static Future<void> deleteEvent(String eventId) async {
    await FirebaseFirestore.instance.collection('events').doc(eventId).delete();
  }

  static Future<List<EventModel>> getEvent() async {
    CollectionReference<EventModel> eventCollection = getEventCollection();
    QuerySnapshot<EventModel> querySnapshot =
        await eventCollection.orderBy('timestamp').get();
    return querySnapshot.docs.map((docSnapShot) => docSnapShot.data()).toList();
  }

  static Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserModel user = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
    );
    CollectionReference<UserModel> usersCollection = getUserCollection();
    await usersCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    CollectionReference<UserModel> usersCollection = getUserCollection();
    DocumentSnapshot<UserModel> documentSnapshot =
        await usersCollection.doc(credential.user!.uid).get();
    return documentSnapshot.data()!;
  }

  static Future<void> logout() => FirebaseAuth.instance.signOut();
}
