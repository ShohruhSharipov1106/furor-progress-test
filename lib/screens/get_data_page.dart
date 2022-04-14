import 'package:flutter/cupertino.dart';
import 'package:furor_progress_test/components/datas.dart';
import 'package:furor_progress_test/constants/colors.dart';
import 'package:furor_progress_test/constants/exports.dart';

class GetDataPage extends StatelessWidget {
  const GetDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ServiceProduct.getProductService(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snap) {
          if (snap.hasData) {
            datas = snap.data!;
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                  child: Column(
                    children: [
                      Text(
                        "\nType ID:" +
                            snap.data![index].productTypeId.toString(),
                      ),
                      Text(
                        "Name:" + snap.data![index].nameUz.toString(),
                      ),
                      Text(
                        "Cost:" + snap.data![index].cost.toString(),
                      ),
                      Text(
                        "CreatedDate:" +
                            snap.data![index].createdDate.toString(),
                      ),
                      Text(
                        "Address:" +
                            snap.data![index].address.toString() +
                            "\n",
                      ),
                    ],
                  ),
                ),
                itemCount: snap.data!.length,
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kBlueColor,
                radius: 30.0,
              ),
            );
          }
        },
      ),
    );
  }
}
