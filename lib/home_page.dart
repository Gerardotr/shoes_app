import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoes_app/constants.dart';
import 'package:shoes_app/data.dart';
import 'package:shoes_app/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Widget> buildCategories() {
    return Data.generateCategories()
        .map((e) => Container(
              padding: EdgeInsets.only(left: 15, bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: Constants.myBlack,
                          child: Image.asset(e.image),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        e.title,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        e.id == 1 ? Colors.white : Constants.myBlack),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        e.id == 1 ? Constants.myOrange : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/ic_menu.png'),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset('assets/ic_search.png')],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset('assets/img_banner.png'),
                  borderRadius: BorderRadius.circular(12),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: 'New Release',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16))),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: 'Nike Air\nMax 90',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 28))),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Constants.myBlack),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          onPressed: () {},
                          child: Text("Buy Now".toLowerCase()))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: buildCategories(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: "New Man's",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            childAspectRatio: 0.9,
            padding: EdgeInsets.all(5),
            children: Data.generateProducts()
                .map((e) => Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailsPage(),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                e.image,
                                height: 90,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: e.type,
                                      style: TextStyle(
                                          color: Constants.myOrange,
                                          fontSize: 16))),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: e.title,
                                      style: TextStyle(
                                          color: Constants.myBlack,
                                          fontSize: 18))),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                          text: "\n ${e.price}",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black87),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30)))),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Constants.myOrange,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/ic_shop.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/ic_wishlist.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/ic_notif.png')),
          ],
        ),
      ),
    );
  }
}
