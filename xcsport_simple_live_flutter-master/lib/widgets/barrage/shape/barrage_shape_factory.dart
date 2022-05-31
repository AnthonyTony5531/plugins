//**********************************************************************
//* author:Sam
//* date:2020-02-24
//**********************************************************************







import '../barrage_data.dart';
import 'barrage_shape.dart';
import 'emoji_shape.dart';
import 'shape_type.dart';
import 'text_shape.dart';

class BarrageShapeFactory{

  static BarrageShape create(BarrageData data){
    switch(data.shapeType){
      case ShapeType.Text:{
        return TextShape(text: data.data, position: data.position,color: data.color,backgroundColor: data.backgroundColor,);
      }
      case ShapeType.Emoji:
        return EmojiShape(path: data.data, position: data.position,);
    }
  }

}