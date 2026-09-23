import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final String? phoneNumber;
  final bool isOnline;
  final bool isAuthenticated;
  final Timestamp? lastSeen;
  final String? about;

  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
    this.phoneNumber,
    this.isOnline = false,
    this.isAuthenticated = false,
    this.about,
    this.lastSeen,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    avatarUrl,
    phoneNumber,
    isOnline,
    isAuthenticated,
    about,
    lastSeen,
  ];
}
