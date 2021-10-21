

class Driver {
  String username;
  String email;
  String phone;
  // String uid;


  // Driver(this.username, this.email, this.phone, this.uid);
  Driver( this.phone, this.email, this.username);

  factory Driver.fromJson(dynamic json) {
    print(json['username']);
    // return Driver(json['username'] as String, json['email'] as String, json['phone'] as String, json['uid'] as String);
    return Driver(json['phone'] as String , json['email'] as String, json['username'] as String);
  }

  // @override
  // String toString() {
  //   return '{ ${this.username}, ${this.email},  ${this.phone} }';
  // }
}