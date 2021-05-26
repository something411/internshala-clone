import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserModel {
  String uid;
  String name;
  String email;
  String password;
  String urlProfilePicture;
  File image;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.urlProfilePicture,
    this.image,
  });
}
