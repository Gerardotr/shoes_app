import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:shoes_app/constants.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<ImageProvider> imagesList = [];
  bool autoRotate = false;
  int rotationCount = 22; // 22 images;
  int swiperSensitivity = 2; // range 1 -5;
  bool allowSwiperToRotate = true;

  @override
  void initState() {
    updateImageList(context);
    // TODO: implement initState
    super.initState();
  }

  void updateImageList(BuildContext context) {
    for (var i = 1; i <= 21; i++) {
      imagesList.add(AssetImage('assets/s$i.png'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Men's Shoes",
          style: TextStyle(color: Constants.myOrange),
        ),
        elevation: 0,
        actions: [Image.asset('assets/ic_search.png')],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: size.width - 30,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Image.asset('assets/ring.png'),
                      ),
                    ),
                    ImageView360(
                      key: UniqueKey(),
                      imageList: imagesList,
                      autoRotate: autoRotate,
                      rotationCount: rotationCount,
                      swipeSensitivity: swiperSensitivity,
                      allowSwipeToRotate: allowSwiperToRotate,
                    )
                  ],
                ),

                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
