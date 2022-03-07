import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      height: double.infinity,
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
          title: Text('Islami', textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/moshaf.png'),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xffB7935F)),
          child: BottomNavigationBar(
            items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/moshaf_gold.png')), label: 'Quran'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')), label: 'Sebha'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/hadis.png')), label: 'Hadis'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/radio_blue.png')), label: 'Radio'),
          ],),
        ),
      ),
    ));
  }
}
