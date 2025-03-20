import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_models/shared_models.dart';


class VehicleRepository {
  final FirebaseFirestore _firestore;

  VehicleRepository(this._firestore);
  

  Future<String> save(Vehicle vehicle) async {
    final data = vehicle.toMap();
    
    if (vehicle.id == null) {
      final docRef = await _firestore.collection('vehicles').add(data);
      return docRef.id;
    } else {
      await _firestore.collection('vehicles').doc(vehicle.id).set(data);
      return vehicle.id!;
    }
  }

  Future<void> delete(String id) async {
    await _firestore.collection('vehicles').doc(id).delete();
  }

  Future<List<Vehicle>> loadVehicles() async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('vehicles')
          .orderBy('date', descending: true)
          .get();
          
      final loadedVehicles = snapshot.docs
          .map((doc) => Vehicle.fromFirestore(doc))
          .toList();
      
      return loadedVehicles;
      
    } catch (e) {
      throw Exception('Error al cargar vehículos: $e');
    }
  }
}