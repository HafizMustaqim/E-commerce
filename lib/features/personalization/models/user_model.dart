import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';

//model class representing user data
class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture
  });

  //Helper function toget the full name
  String get fullName => '$firstName $lastName';

  //Helper function to format phone number
  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);

  //Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //Static function to generate a username from the full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName"; //combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; //add "cwt_" prefix
    return usernameWithPrefix;
  }

  //static function to create an empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  //convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  //Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
    );
  }
}