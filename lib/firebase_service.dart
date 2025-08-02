import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_application/models/event_model.dart';

class FirebaseService {
  static CollectionReference<EventModel> getEventCollection() =>
      FirebaseFirestore.instance
          .collection('events')
          .withConverter<EventModel>(
            fromFirestore:
                (docSnapshot, _) => EventModel.fromJson((docSnapshot.data()!)),
            toFirestore: (event, _) => event.toJson(),
          );

  static Future<void> createEvent(EventModel event) {
    CollectionReference<EventModel> eventsCollection = getEventCollection();
    DocumentReference<EventModel> doc = eventsCollection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getEvent() async {
    CollectionReference<EventModel> eventCollection = getEventCollection();
    QuerySnapshot<EventModel> querySnapshot =
        await eventCollection.orderBy('timestamp').get();
    return querySnapshot.docs.map((docSnapShot) => docSnapShot.data()).toList();
  }
}
