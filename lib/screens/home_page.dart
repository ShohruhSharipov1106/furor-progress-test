import 'package:furor_progress_test/screens/components/form_field.dart';
import 'package:intl/intl.dart';

import 'package:furor_progress_test/constants/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int time = int.parse(DateFormat("yyyyMMdd").format(DateTime.now()));
  int deletingValue = datas.length;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String updatingItemValue = "name_uz";
  String currentData = "null";
  String updatingName = "0";

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FormFieldPage(),
            SizedBox(
              child: Wrap(
                children: [
                  // Get Data Function
                  _functionButton(
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetDataPage(),
                      ),
                    ),
                    "Get Data",
                    kBlackColor,
                  ),
                  const SizedBox(width: 30.0),
                  // Post Data Function
                  _functionButton(
                    () => ServiceProduct.postProductService(
                      int.parse(context
                          .read<ProductProvider>()
                          .typeIdController
                          .text),
                      context
                          .read<ProductProvider>()
                          .nameUzController
                          .text
                          .toString(),
                      double.parse(
                          context.read<ProductProvider>().costController.text),
                      context
                          .read<ProductProvider>()
                          .addressController
                          .text
                          .toString(),
                      time,
                    ),
                    "Post Data to Api",
                    kGreenColor,
                  ),
                  const SizedBox(width: 30.0),
                  // Update Data Function
                  _functionButton(
                    () {
                      List<DropdownMenuItem<String>> listItems = List.generate(
                        datas.length,
                        (index) => DropdownMenuItem<String>(
                          child: Text("Product's name: " +
                              datas[index].nameUz.toString()),
                          value: index.toString(),
                        ),
                      );
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: const Text("Select updating data"),
                                content: Column(
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        items: listItems,
                                        value: updatingName,
                                        onChanged: (v) {
                                          updatingName = v!;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField<String>(
                                        items: <String>[
                                          "product_type_id",
                                          "name_uz",
                                          "cost",
                                          "address",
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        value: updatingItemValue,
                                        onChanged: (v) {
                                          switch (v) {
                                            case "name_uz":
                                              {
                                                currentData = datas[
                                                        int.parse(updatingName)]
                                                    .nameUz
                                                    .toString();
                                              }
                                              break;
                                            case "cost":
                                              {
                                                currentData = datas[
                                                        int.parse(updatingName)]
                                                    .cost
                                                    .toString();
                                              }
                                              break;
                                            case "address":
                                              {
                                                currentData = datas[
                                                        int.parse(updatingName)]
                                                    .address
                                                    .toString();
                                              }
                                              break;
                                            case "product_type_id":
                                              {
                                                currentData = datas[
                                                        int.parse(updatingName)]
                                                    .productTypeId
                                                    .toString();
                                              }
                                              break;
                                            default:
                                          }
                                          setState(
                                            () {
                                              updatingItemValue = v!;
                                            },
                                          );
                                        },
                                        onSaved: (v) {
                                          updatingItemValue = v!;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Visibility(
                                      visible:
                                          currentData == "null" ? false : true,
                                      child: Text(
                                        "Current Data: $currentData",
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    _inputField(
                                      context,
                                      context
                                          .watch<ProductProvider>()
                                          .newValueController,
                                      "Enter new value",
                                      TextInputType.visiblePassword,
                                    ),
                                  ],
                                ),
                                actions: [
                                  _functionButton(
                                    () {
                                      ServiceProduct.putProductService(
                                        datas[int.parse(updatingName)].id!,
                                        datas[int.parse(updatingName)]
                                            .productTypeId!,
                                        datas[int.parse(updatingName)].nameUz!,
                                        datas[int.parse(updatingName)].cost!,
                                        datas[int.parse(updatingName)].address!,
                                        datas[int.parse(updatingName)]
                                            .createdDate!,
                                        updatingItemValue,
                                        context
                                            .read<ProductProvider>()
                                            .newValueController
                                            .text,
                                      );
                                      Navigator.pop(context);
                                    },
                                    "Update Data",
                                    kBlueColor,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    "Put Data",
                    kBlueColor,
                  ),
                  const SizedBox(width: 30.0),
                  // Delete Data Function
                  _functionButton(
                    () {
                      List<DropdownMenuItem<int>> listItems = List.generate(
                        datas.length,
                        (index) => DropdownMenuItem<int>(
                          child: Text(
                            "Name: " +
                                datas[index].nameUz.toString() +
                                "\nTypeId:" +
                                datas[index].productTypeId.toString(),
                          ),
                          value: index,
                        ),
                      );
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: const Text("Select deleting data"),
                                content: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    items: listItems,
                                    value: deletingValue,
                                    onChanged: (v) {
                                      deletingValue = v!;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                actions: [
                                  _functionButton(
                                    () {
                                      ServiceProduct.deleteProductService(
                                        datas[deletingValue].id!,
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    "Delete Data",
                                    kRedColor,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    "Delete Data",
                    kRedColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  ElevatedButton _functionButton(
    void Function() function,
    String title,
    Color kolor,
  ) {
    return ElevatedButton(
      onPressed: function,
      child: Text(title),
      style: ElevatedButton.styleFrom(primary: kolor),
    );
  }

  TextFormField _inputField(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    TextInputType keyboard,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
      ),
      keyboardType: keyboard,
    );
  }
}
