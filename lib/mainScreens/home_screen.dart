import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodify_user_app/widgets/my_drawer.dart';

import '../authentication/auth_screen.dart';
import '../global/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final items=[
        "slider/0.jpg",
        "slider/1.jpg",
        "slider/2.jpg",
        "slider/3.jpg",
        "slider/4.jpg",
        "slider/5.jpg",
        "slider/6.jpg",
        "slider/7.jpg",
        "slider/8.jpg",
        "slider/9.jpg",
        "slider/10.jpg",
        "slider/11.jpg",
        "slider/12.jpg",
        "slider/13.jpg",
        "slider/14.jpg",
        "slider/15.jpg",
        "slider/16.jpg",
        "slider/17.jpg",
        "slider/18.jpg",
        "slider/19.jpg",
        "slider/20.jpg",
        "slider/21.jpg",
        "slider/22.jpg",
        "slider/23.jpg",
        "slider/24.jpg",
        "slider/25.jpg",
        "slider/26.jpg",
    "slider/27.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.black
          ),
        ),
        title: Text(sharedPreferences!.getString("name")!,style: const TextStyle(
          color: Colors.orange,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          // fontStyle:
        ),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon:const Icon(Icons.menu_rounded,size: 25,color: Colors.red,),
              onPressed: (){
                  Scaffold.of(context).openDrawer(
                  );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer:  const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white70,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(options: CarouselOptions(
                          height: MediaQuery.of(context).size.height*0.25,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 500),
                      autoPlayCurve: Curves.decelerate,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                      items: items.map((index) {
                        return Builder(builder:(BuildContext context){
                          return Container(
                            height: MediaQuery.of(context).size.height*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage(index),fit:BoxFit.cover),
                              ),
                          );
                        },
                        );
                      }).toList(),
                  ),
                )
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
