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
          "address": address,
          "created_date": time,
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }

  static Future putProductService(
    int itemID,
    int typeId,
    String name,
    double cost,
    String address,
    int time,
    String whichChange,
    dynamic newValue,
  ) async {
    Uri url = Uri.parse("http://94.158.54.194:9092/api/product");
    print(whichChange);
    print(newValue);
    print(itemID);
    http.Response res = await http.put(
      url,
      body: jsonEncode(
        {
          "id": itemID,
          "product_type_id": typeId,
          "name_uz": name,
          "cost": cost,
          "address": address,
          "created_date": time,
          whichChange: newValue,
        },
      ),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
    print(res.body);
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }

  static Future deleteProductService(int deletingItem) async {
    Uri url = Uri.parse("http://94.158.54.194:9092/api/product/$deletingItem");
    http.Response res = await http.delete(url,
        body: jsonEncode(
          {
            "id": deletingItem,
          },
        ),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        });

    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato bor: ${res.statusCode}");
    }
  }
}
