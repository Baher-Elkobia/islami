import 'package:flutter/material.dart';
import 'package:islami/screens/quran/quranScreen.dart';
import 'package:islami/screens/radio/radioScreen.dart';
import 'package:islami/screens/sebha/sebhaScreen.dart';

import 'ahadeth/ahadethScreen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  Widget getScreen() {
    if (pageIndex == 0) {
      return QuranScreen();
    } else if (pageIndex == 1) {
      return AhadethScreen();
    } else if (pageIndex == 2) {
      return SebhaScreen();
    } else{
      return RadioScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/defaultBackground.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Islami',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: getScreen(),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Color(0xffB7935F)),
            child: BottomNavigationBar(
              onTap: (value) {
                pageIndex = value;
                setState(() {});
              },
              currentIndex: pageIndex,
              selectedItemColor: Colors.black54,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/quran.png')),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/hadis.png')),
                    label: 'Hadis'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/radio_blue.png')),
                    label: 'Radio'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
