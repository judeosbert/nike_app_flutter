import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/custom/nike_icons_icons.dart';

import 'DetailScreenWidget.dart';

class ItemTile extends StatelessWidget {
  final ItemTileData itemData;
  ItemTile({@required this.itemData});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,DetailScreenWidget.routeName,arguments: {
          "id":itemData.itemId,
        });
      },
      child: Container(
        margin: EdgeInsets.all(ScreenUtil.getInstance().setWidth(7)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(8))
        ),
        child: SizedBox.fromSize(
          size: Size(ScreenUtil.getInstance().setWidth(171), ScreenUtil.getInstance().setWidth(182)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox.fromSize(
                size: Size(ScreenUtil.getInstance().setWidth(160), ScreenUtil.getInstance().setWidth(88)),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(itemData.photoUrl)),
              ),
              Text("Rs ${itemData.price.toString()}",
                style: TextStyle(
                  color: Color(0xff6858C8)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon: Icon(
                      NikeIcons.heart_filled,
                    color: itemData.isLiked?Colors.red:Colors.black,
                  ),
                      onPressed: (){

                  }),
                  IconButton(icon: Icon(
                      Icons.add_shopping_cart
                  ),
                      onPressed: (){

                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class ItemTileData{
  String photoUrl;
  double price;
  bool isLiked;
  int itemId;
  ItemTileData.create({this.photoUrl, this.price, this.isLiked, this.itemId});

}