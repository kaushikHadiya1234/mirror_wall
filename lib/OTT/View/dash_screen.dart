import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/OTT/Provider/ott_provider.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  OttProvider? pf;
  OttProvider? pt;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<OttProvider>(context,listen: false);
    pt = Provider.of<OttProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello",style: TextStyle(fontSize: 15,color: Colors.white70),),
                      SizedBox(height: 8),
                      Text(
                        "Kaushik",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/a1.jpg"))),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(Icons.search,color: Colors.white,),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),
                    hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),
            SizedBox(height: 15),
            CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${pf!.SliderList[index]}"),
                          fit: BoxFit.cover),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[100]),
                );
              },
              itemCount: pf!.SliderList.length,
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  pf!.ChangeIndex(index);
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pf!.SliderList
                  .asMap()
                  .entries
                  .map((e) => Container(
                height: 7,
                width: 7,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pt!.SliderIndex == e.key
                        ? Colors.white
                        : Colors.grey),
              ))
                  .toList(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'web',arguments: pf!.OttList[index].link);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            // color: Colors.deepOrangeAccent[50],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("${pf!.OttList[index].img}"),
                                fit: BoxFit.cover
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("${pf!.OttList[index].name}",style: TextStyle(fontSize: 20,color: Colors.white),)
                      ],
                    ),
                  );
                },
                itemCount: pf!.OttList.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

