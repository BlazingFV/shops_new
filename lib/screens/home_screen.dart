import 'package:shops/screens/product_overview.dart';
import 'package:shops/screens/auth_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shops/providers/items.dart';
import 'package:shops/widgts/slider_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgroundscafold.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Text(
                'Discount',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 25,
              ),
              Icon(Icons.person_sharp),
              SizedBox(width: 10),
              Icon(Icons.shopping_basket),
              SizedBox(width: 10),
              Icon(Icons.list),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 2, 10, 5),
              child: buildVendorRegister(context),
            ),
            buildBuyerRegister(context),
            SizedBox(height: 15),
            InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>product_overview()));
              },
              child: buildPhotos(),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildPhotos() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 2, 10, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'All Categories',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
            endIndent: 90,
            indent: 95,
          ),
          Image.asset(
            'assets/images/sweets.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/images/pastries.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/images/dates.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/images/kosha.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/images/food.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/images/wedding.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Image.asset(
            'assets/images/party_planners.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Padding buildBuyerRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 2, 10, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.person_add,
            size: 50,
            color: Color(0xffe4bf6a),
          ),
          SizedBox(height: 25),
          Text(
            'Buyer registration',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Browse between hundreds of offers and choose the best suitable for each reservation section and leave us the equipment.',
            softWrap: true,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton.icon(
            color: Color(0xffe4bf6a),
            onPressed: () {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => AuthScreen()));
            },
            icon: Icon(Icons.person_add),
            label: Text('Register a new Account'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
          ),
          Divider(
            color: Color(0xffe4bf6a),
            thickness: 1.8,
          ),
        ],
      ),
    );
  }

  Column buildVendorRegister(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          height: MediaQuery.of(context).size.height * .14,
          items: map<Widget>(
            items,
            (index, i) {
              Map stuff = items[index];
              return SliderItem(
                img: stuff['img'],
                isFav: false,
                name: stuff['name'],
                raters: 0,
              );
            },
          ).toList(),
          autoPlay: true,
//                enlargeCenterPage: true,
          viewportFraction: 1.0,
//              aspectRatio: 2.0,
          onPageChanged: (index) {
            setState(() {
              current = index;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.shop,
          size: 50,
          color: Color(0xffe4bf6a),
        ),
        SizedBox(height: 25),
        Text(
          'Vendor registration',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'You can register an account and add your products and offers to display them to thousands of users with ease',
          softWrap: true,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        SizedBox(
          height: 15,
        ),
        RaisedButton.icon(
          color: Color(0xffe4bf6a),
          onPressed: () {
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => AuthScreen()));
          },
          icon: Icon(Icons.person_add),
          label: Text('Register a new Account'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
        ),
        Divider(
          color: Color(0xffe4bf6a),
          thickness: 1.8,
        ),
      ],
    );
  }
}
