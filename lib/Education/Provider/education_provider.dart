
import 'package:flutter/material.dart';
import 'package:mirror_wall/Education/Model/edu_Model.dart';

class EduProvider extends ChangeNotifier
{
  List SliderList = [
    'assets/images/ed1.jpg',
    'assets/images/ed2.jpg',
    'assets/images/ed3.jpg',
    'assets/images/ed4.jpg',
    'assets/images/ed5.jpg',
  ];

  List<EduModel> l1 = [
    EduModel(name: 'Wikipedia',img: 'assets/images/logo1.png',link: 'https://www.wikipedia.org/'),
    EduModel(name: 'W3Schools',img: 'assets/images/logo2.png',link: 'https://www.w3schools.com/'),
    EduModel(name: 'JavatPoint',img: 'assets/images/logo3.png',link: 'https://www.javatpoint.com/'),
    EduModel(name: 'TutorialsPoint',img: 'assets/images/logo4.png',link: 'https://www.tutorialspoint.com/index.htm'),
    EduModel(name: 'python',img: 'assets/images/logo5.png',link: 'https://www.python.org/'),
    EduModel(name: 'Flutter',img: 'assets/images/logo6.png',link: 'https://flutter.dev/'),
    EduModel(name: 'Php',img: 'assets/images/logo7.png',link: 'https://www.tutorialspoint.com/php/index.htm'),
    EduModel(name: 'Figma',img: 'assets/images/logo10.png',link: 'https://www.figma.com/files/recent?fuid=1232575372985595792'),

  ];
  int SliderIndex=0;

  void ChangeIndex(int index)
  {
    SliderIndex=index;
    notifyListeners();
  }
}