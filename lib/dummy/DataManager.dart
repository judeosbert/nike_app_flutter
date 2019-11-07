import '../ItemTile.dart';

class DataManager{

  static List _dummyShoesData = [
    ItemTileData.create(
        photoUrl: "assets/images/shoes/1.png",
        price: 260,
        isLiked: true,
        itemId: 1
    ),
    ItemTileData.create(
        photoUrl: "assets/images/shoes/2.png",
        price: 260,
        isLiked: false,
        itemId: 2
    ),
    ItemTileData.create(
        photoUrl: "assets/images/shoes/3.png",
        price: 260,
        isLiked: true,
        itemId: 3
    ),
    ItemTileData.create(
        photoUrl: "assets/images/shoes/4.png",
        price: 260,
        isLiked: false,
        itemId: 4
    ),
    ItemTileData.create(
        photoUrl: "assets/images/shoes/5.png",
        price: 260,
        isLiked: true,
        itemId: 5
    ),
    ItemTileData.create(
        photoUrl: "assets/images/shoes/6.png",
        price: 260,
        isLiked: false,
        itemId: 6
    ),

  ];
  static int getDataSize() => _dummyShoesData.length;
  static List<ItemTileData> getDummyData() => _dummyShoesData;

  static getDataAt(int index) => _dummyShoesData[index];
  static ItemTileData getByItemId(int id){
    for(int i = 0 ; i < _dummyShoesData.length;i++){
      if(id == _dummyShoesData[i].itemId){
        return _dummyShoesData[i];
      }
    }
    return null;
  }
}