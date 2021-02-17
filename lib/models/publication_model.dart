import 'package:flutter/material.dart';

enum Reaction { recommend, celebrate, support, love, interest, curiosity }

class PublicationModel {
  bool isReaction;
  String userName;
  Reaction userReaction;
  bool isPerson;
  String image;
  String name;
  String levelContact;
  String description;
  String date;
  bool edit;
  bool isPublic;
  String text;
  List<String> imagePublication;
  Map<Reaction, int> reactions;
  int comment;

  PublicationModel(
      {this.isReaction,
      this.userName,
      this.userReaction,
      this.isPerson,
      @required this.image,
      @required this.name,
      this.levelContact,
      @required this.description,
      @required this.date,
      this.edit,
      @required this.isPublic,
      @required this.text,
      this.imagePublication,
      this.reactions,
      this.comment});
}
