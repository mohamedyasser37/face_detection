import 'package:flutter/material.dart';
const  defaultColor=Color(0xff0D83B9);
const kPrimaryColor=Color(0xff2b475e);
const kLogo = 'assets/images/logo.png';
const kMessagesCollections = 'messages';
const kMessage = 'message';
const kCreatedAt='createdAt';
var uid;
var userEmail;
var changeBubble=false;

bool isAdmin = false;

var name;
num angry = 0;
num disgust = 0;
num fear = 0;
num happy = 0;
num neutral = 0;
num sad = 0;
num surprise = 0;
num sumOfResults = 0;

num totalangry = 0;
num totaldisgust = 0;
num totaleFear = 0;
num totalhappy = 0;
num totalneutral = 0;
num totalsad = 0;
num totalsurprise = 0;
num totalsumOfResults = 0;