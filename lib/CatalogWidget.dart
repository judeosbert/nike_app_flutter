import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/ItemTile.dart';
import 'package:music_app/dummy/DataManager.dart';


class CatalogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(10), ScreenUtil.getInstance().setHeight(22), ScreenUtil.getInstance().setWidth(10), 0),
      child: GridView.count(crossAxisCount: 2,
        children: List.generate(DataManager.getDataSize()*2,(index){
          return ItemTile(itemData: DataManager.getDataAt(getModedIndex(index)),);
        })
      ),
    );
  }
}

int getModedIndex(int index){
  int totalSize = DataManager.getDataSize();
  return index % totalSize;
}
