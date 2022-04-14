import 'package:flutter/cupertino.dart';
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
            return snap.hasData
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
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
                    ),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(
                      color: kBlueColor,
                      radius: 30.0,
                    ),
                  );
          }),
    );
  }
}
