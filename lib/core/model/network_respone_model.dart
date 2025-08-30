class NetworkReponse {
  bool isSucess;
  int statesCode;
  Map<String, dynamic>? data;
  String? errorMassage;

  NetworkReponse({
    required this.isSucess,
    required this.statesCode,
    this.data,
    this.errorMassage,
  });
}