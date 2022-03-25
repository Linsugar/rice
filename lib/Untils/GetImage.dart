
import 'package:image_picker/image_picker.dart';

class Creamer{
  static ImagePicker _imagePicker = ImagePicker();

  static Future  GetCramer()async{
    //使用照相机拍摄
    try{
      var result = await  _imagePicker.pickImage(source:ImageSource.camera);
      return result?.path;
    }catch(e){
      print("e:$e");
    }

  }
  static  Future GetGrally()async{
    //使用相册
    try{
      var result =  await _imagePicker.pickImage(source:ImageSource.gallery);

      return result?.path;
    }catch(e){
      print("e:$e");
    }

  }

}