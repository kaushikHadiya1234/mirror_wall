import 'package:flutter/material.dart';
import 'package:mirror_wall/OTT/Model/ott-Model.dart';

class OttProvider extends ChangeNotifier
{
  List SliderList = [
    'assets/images/ot1.jpg',
    'assets/images/ot2.jpg',
    'assets/images/ot3.jpg',
    'assets/images/ot4.jpg',
    'assets/images/ot5.jpg',
    'assets/images/ot7.jpg',
  ];

  List<OttModel> OttList = [
    OttModel(name: 'Netflix',img: 'assets/images/b1.png',link: 'https://www.netflix.com/in/'),
    OttModel(name: 'Disney+\nhostar',img: 'assets/images/b2.png',link: 'https://www.hotstar.com/in/home?ref=%2Fin'),
    OttModel(name: 'amazon prime',img: 'assets/images/b3.png',link: 'https://www.primevideo.com/offers/nonprimehomepage/ref=dv_web_force_root'),
    OttModel(name: 'Sony liv',img: 'assets/images/b4.png',link: 'https://www.sonyliv.com/'),
    OttModel(name: 'Voot',img: 'assets/images/b5.png',link: 'https://www.voot.com/'),
    OttModel(name: 'jio Cinema',img: 'assets/images/b6.png',link: 'https://www.jiocinema.com/'),
  ];

  int SliderIndex=0;

  void ChangeIndex(int index)
  {
    SliderIndex=index;
    notifyListeners();
  }


}