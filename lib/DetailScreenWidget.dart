import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/custom/nike_icons_icons.dart';
import 'package:music_app/dummy/DataManager.dart';

import 'ItemTile.dart';

class DetailScreenWidget extends StatefulWidget {
  static const String routeName = "/details";

  @override
  _DetailScreenWidgetState createState() => _DetailScreenWidgetState();
}

class _DetailScreenWidgetState extends State<DetailScreenWidget> {
  int _scrollIndicatorSelectedPosition = 0;
  @override
  Widget build(BuildContext context) {
    final Map argument = ModalRoute.of(context).settings.arguments;
    final itemId = argument["id"];
    final ItemTileData itemData = DataManager.getDataAt(itemId);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Container(
           child: SvgPicture.asset("assets/images/NIKE.svg")
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.square(MediaQuery.of(context).size.width),
            child: PageView.builder(itemBuilder: (context,index){
              if(index == 0){
                return Image.asset(itemData.photoUrl,
                  fit: BoxFit.fitWidth,
                );
              }
              else{
                return Image.asset("assets/images/shoes/$index.png",
                  fit: BoxFit.fitWidth,);
              }
            },
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            onPageChanged: (index){
              setState(() {
                _scrollIndicatorSelectedPosition = index;
              });
            },
            ),
          ),
          Divider(),
          SizedBox.fromSize(
            size: Size(MediaQuery.of(context).size.width,100),
            child: ListView.builder(itemBuilder: (context,index){
              return Image.asset("assets/images/shoes/$index.png",
                fit: BoxFit.fitWidth,);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 4,),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("NIKE AIR MAX SUPERSKY",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                    ),),
                    Text("Men's Running Shoe",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 19,
                    ),),

                  ],
                ),
                Text("\$${itemData.price}",
                style: TextStyle(
                  color: Color(0xff6858C8),
                  fontSize: 23,
                ),)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                    child:Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color:Colors.grey[300])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: (Icon(NikeIcons.doted_heart,
                          color: Color(0xff6858C8),)),
                        ),
                      ),
                    ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 8,
                    child:Container(
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                            color:Colors.grey[300]
                        ))
                      ),
                      child: DropdownButton(
                        underline: null,
                        hint: Text("Select your size"),
                        items: [
                       DropdownMenuItem(child: Text("S")),
                       DropdownMenuItem(child: Text("M")),
                       DropdownMenuItem(child: Text("L")),
                       DropdownMenuItem(child: Text("XL")),
                       DropdownMenuItem(child: Text("XXL")),
                      ], onChanged: (item){

                      },
                      ),
                    ) ),
              ],
            ),
          )
        ],
          ),
      ),

    );
  }

}

// ListView.builder(itemBuilder: (context,index){
//              return Icon(Icons.minimize,
//                  color: (index == _scrollIndicatorSelectedPosition)?Colors.black:Colors.grey[300]);
//            },
//              itemCount: 7,
//              scrollDirection: Axis.horizontal,
//            )


