  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:intl/intl.dart';
  

  class Vehicle {
    final String? id;
    final Timestamp date;
    final String patent;
    final String technician;
    final String company;
    final String order;
    final String cleanliness;
    final String water;
    final String spareTire;
    final String oil;
    final String jack;
    final String crossWrench;
    final String fireExtinguisher;
    final String lock;
    final String comment;
    final String? localImagePath;
    String? imageUrl;

    Vehicle({
      this.id,
      required this.date,
      required this.patent,
      required this.technician,
      required this.company,
      required this.order,
      required this.cleanliness,
      required this.water,
      required this.spareTire,
      required this.oil,
      required this.jack,
      required this.crossWrench,
      required this.fireExtinguisher,
      required this.lock,
      required this.comment,
      this.localImagePath,
      this.imageUrl,
    });

    factory Vehicle.fromFirestore(DocumentSnapshot doc) {
      if (!doc.exists) throw Exception("Document not found");
      final data = doc.data()! as Map<String, dynamic>;

      final dateString = data['date'] as String;
      final date = DateFormat('dd/MM/yyyy').parse(dateString);

      return Vehicle(
        id: doc.id,
        date: Timestamp.fromDate(date),
        patent: data['patent'] as String,
        technician: data['technician'] as String,
        company: data['company'] as String,
        order: data['order'] as String,
        cleanliness: data['cleanliness'] as String,
        water: data['water'] as String,
        spareTire: data['spareTire'] as String,
        oil: data['oil'] as String,
        jack: data['jack'] as String,
        crossWrench: data['crossWrench'] as String,
        fireExtinguisher: data['fireExtinguisher'] as String,
        lock: data['lock'] as String,
        comment: data['comment'] as String,
        imageUrl: data['imageUrl'] as String,
      );
    }

    Map<String, dynamic> toMap() {

      final dateString = DateFormat('dd/MM/yyyy').format(date.toDate());
      return {
        'date': dateString,
        'patent': patent,
        'technician': technician,
        'company': company,
        'order': order,
        'cleanliness': cleanliness,
        'water': water,
        'spareTire': spareTire,
        'oil': oil,
        'jack': jack,
        'crossWrench': crossWrench,
        'fireExtinguisher': fireExtinguisher,
        'lock': lock,
        'comment': comment,
        'imageUrl': imageUrl,
      };
    }
  }


    