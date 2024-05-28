class DHT {
  final double temperature;
  final double humidity;

  DHT({required this.temperature, required this.humidity});

  factory DHT.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return DHT(
      temperature: parser(json['temperature']),
      humidity: parser(json['humidity']),
    );
  }
}
