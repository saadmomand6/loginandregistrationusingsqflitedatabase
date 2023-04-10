class UserModel {
  late String? name;
  late String? email;
  late String? phone;
  late String? password;

  UserModel({  this.name ,  this.email , this.phone,   this.password});

  //create data to Map function
  Map<String , dynamic> toMap(){
    var map = <String , dynamic>{
      "name": name,
      "email": email,
      "phone": phone,
      "password": password
    };
    return map;
  }


UserModel.fromMap(Map<String , dynamic> map){
  name = map["name"];
  email = map["email"];
  phone = map["phone"];
  password = map["password"];

}
}