class LoginModel{
  String CreatedAt = "2022-03-09T07:20:39Z";
   String UpdatedAt = "2022-03-09T07:20:39Z";
  String ?DeletedAt;
  String username = "唐3";
  String phone = "17608242415";
  String create_city = "成都";
   String CreateAddress = "成都高新区";
  String NowIp = "::1";
   String ?Token;
  String UserId = "8563157";
   String invitePerson = "";
   String userContent = "";
  String profilePicture = "http://cdn.tlapp.club/pet.png";
  LoginModel(value){
   CreatedAt = value["CreatedAt"];
    UpdatedAt = value["UpdatedAt"];
    DeletedAt = value["DeletedAt"];
    username = value["username"];
   userContent = value["userContent"];
    phone = value["phone"];
    create_city = value["create_city"];
    CreateAddress = value["CreateAddress"];
    NowIp = value["NowIp"];
    Token = value["Token"];
    UserId = value["UserId"]["String"];
    invitePerson = value["invitePerson"];
    profilePicture = value["profilePicture"];
  }

}