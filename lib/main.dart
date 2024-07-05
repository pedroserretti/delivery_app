import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/delivery_app.dart';
import 'package:delivery_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  runApp(const DwDeliveryApp());
}
