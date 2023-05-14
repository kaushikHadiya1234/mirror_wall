import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/Education/Provider/education_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EduProvider? pf;
  EduProvider? pt;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<EduProvider>(context, listen: false);
    pt = Provider.of<EduProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
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
                      Text("Hello",style: TextStyle(fontSize: 15,color: Colors.grey),),
                      SizedBox(height: 8),
                      Text(
                        "Kaushik",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
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
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                    hintText: "Search"),
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
                                ? Colors.black
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
                      Navigator.pushNamed(context, 'web',arguments: pf!.l1[index].link);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            // color: Colors.deepOrangeAccent[50],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("${pf!.l1[index].img}"),
                            )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("${pf!.l1[index].name}",style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  );
                },
                itemCount: pf!.l1.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
