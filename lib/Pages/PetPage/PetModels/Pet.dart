import 'dart:ffi';

class PetModel{
  String CreatedAt = "";
  String UpdatedAt = "";
  String ?DeletedAt;
  int PetID = 0;
  String petMaster = "";
  String pet_name = "";
  String petCall = "";
  String petdetail = "";
  String petClass = "";
  int petBuyer = 0;
  String petPhoto = "";
  String pet_avatotr = "";
  String pet_video = "";
  int petMoney = 0;
  int ?petBuyMoney;
  String PetContent ="";
  num ?PetAge;                                                          //最终售卖价
  String ?PetGender;                                                  //最终售卖价
  int ?PetWeight;                                                //最终售卖价
  String ?PetLocation;
  PetModel(value){
    print("进入pet model赋值");
    this.CreatedAt = value["CreatedAt"];
    this.UpdatedAt = value["UpdatedAt"];
    this.DeletedAt = value["DeletedAt"];
    this.PetID = value["PetID"];
    this.petMaster = value["petMaster"];
    this.pet_name = value["pet_name"];
    this.petCall = value["petCall"];
    this.petdetail = value["petdetail"];
    this.petClass = value["petClass"];
    this.petBuyer = value["petBuyer"]["Int32"];
    this.petPhoto = value["petPhoto"];
    this.pet_avatotr = value["pet_avatotr"];
    this.pet_video = value["pet_video"];
    this.petMoney = value["petMoney"];
    this.petBuyMoney = value["petBuyMoney"];
    this.PetContent = value["petContent"];
    this.PetAge = value["petAge"];
    this.PetGender = value["petGender"];
    this.PetWeight = value["petWeight"];
    this.PetLocation = value["petLocation"];
  }

}