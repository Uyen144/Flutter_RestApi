class data {
  final String ClientName;
  final String ClientCode;
  final String IpClient;
  final String Jwt;
  data(
      {required this.ClientCode,
      required this.ClientName,
      required this.IpClient,
      required this.Jwt});
  factory data.fromJson(dynamic json) {
    return data(
      ClientCode: json['ClientCode'] as String,
      ClientName: json['ClientCode'] as String,
      IpClient: json['IpClient'] as String,
      Jwt: json['Jwt'] as String,
    );
  }
}

class User {
  final int Code;
  final String Message;
  final data Data;

  User({
    required this.Code,
    required this.Message,
    required this.Data,
  });

  factory User.fromJson(dynamic json) {
    return User(
      Code: json['Code'] as int,
      Message: json['Message'] as String,
      Data: data.fromJson(json['Data']),
    );
  }
  //print{User}
  @override
  String toString() {
    return '{${this.Code},${this.Message},${this.Data}}';
  }
}

class dataGet {
  final String price;
  final String nameCK;

  dataGet({
    required this.price,
    required this.nameCK,
  });

  factory dataGet.fromJson(dynamic json) {
    return dataGet(
      price: json['price'] as String,
      nameCK: json['nameCK'] as String,
    );
  }
  @override
  String toString() {
    return '{${this.price},${this.nameCK}}';
  }
}

class tableGet {
  final String ASTOCKCODE;
  final String ALASTPX;
  final String AHIGHPX;
  final String ALOWPX;

  tableGet({
    required this.ASTOCKCODE,
    required this.ALASTPX,
    required this.AHIGHPX,
    required this.ALOWPX,
  });

  factory tableGet.fromJson(dynamic json) {
    return tableGet(
      ASTOCKCODE: json['ASTOCKCODE'] as String,
      ALASTPX: json['ALASTPX'] as String,
      AHIGHPX: json['AHIGHPX'] as String,
      ALOWPX: json['ALOWPX'] as String,
    );
  }
  @override
  String toString() {
    return '{${this.ASTOCKCODE},${this.ALASTPX},${this.AHIGHPX},${this.ALOWPX}}';
  }
}

class GetData {
  final int Code;
  final String Message;
  final dataGet Data;

  GetData({
    required this.Code,
    required this.Message,
    required this.Data,
  });

  factory GetData.fromJson(dynamic json) {
    return GetData(
      Code: json['Code'] as int,
      Message: json['Message'] as String,
      Data: dataGet.fromJson(json['Data']),
    );
  }
  @override
  String toString() {
    return '{${this.Code},${this.Message},${this.Data}}';
  }
}
