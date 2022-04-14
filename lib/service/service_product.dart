import 'package:http/http.dart' as http;
import 'package:furor_progress_test/constants/exports.dart';

class ServiceProduct {
  static Future<List<ProductModel>> getProductService() async {
    Uri url = Uri.parse("http://94.158.54.194:9092/api/product");
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }

  static Future postProductService(
    int typeId,
    String name,
    double cost,
    String address,
    int time,
  ) async {
    Uri url = Uri.parse("http://94.158.54.194:9092/api/product");
    http.Response res = await http.post(url,
        body: jsonEncode({
          "product_type_id": typeId,
          "name_uz": name,
          "cost": cost,
          "address": time,
          "created_date": 1649931824000,
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    print(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }

  static Future<List<ProductModel>> putProductService() async {
    Uri url = Uri.parse("http://94.158.54.194:9092/api/product");
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      print(res.body);
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }

  static Future<List<ProductModel>> deleteProductService() async {
    Uri url = Uri.parse("http://94.158.54.194:9092/api/product");
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      print(res.body);
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }
}
