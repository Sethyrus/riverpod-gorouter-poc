import 'package:flutter/widgets.dart';
import 'package:riverpod101/models/user_profile.dart';

// GENERAL
const appName = 'Riverpod 101';

// COLORS
const primary = Color(0xFF1E88E5);

// DEBUG
const List<UserProfile> users = [
  UserProfile(uid: '1', name: 'Seth', email: 'seth@mail.com'),
  UserProfile(uid: '2', name: 'Alex', email: 'alex@mail.com'),
  UserProfile(uid: '3', name: 'Raúl', email: 'raul@mail.com'),
];

const defaultDuration = Duration(seconds: 1);
