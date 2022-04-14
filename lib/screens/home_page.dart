import 'package:furor_progress_test/constants/exports.dart';
import 'package:furor_progress_test/providers/product_provider.dart';
import 'package:furor_progress_test/screens/get_data_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int time = int.parse(DateTime.now().toString());

  // static const _pageSize = 10;

  // final PagingController<int, ProductModel> _pagingController =
  //     PagingController(firstPageKey: 1);

  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener(
  //     (pageKey) {
  //       _fetchPage(pageKey);
  //     },
  //   );
  //   print(_pagingController);
  //   super.initState();
  // }

  // Future<void> _fetchPage(int pageKey) async {
  //   print(_pagingController.itemList);
  //   try {
  //     final List<ProductModel> newItems =
  //         await ServiceProduct.getProductService(pageKey, _pageSize);
  //     final bool isLastPage = newItems.length < _pageSize;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + newItems.length;
  //       _pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     print(_pagingController.error);
  //     _pagingController.error = error;
  //     print(error);
  //   }
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: context.watch<ProductProvider>().formKey,
              child: Column(
                children: [
                  // ProductTypeId
                  _inputField(
                    context,
                    context.watch<ProductProvider>().typeIdController,
                    "Enter product's type ID",
                    TextInputType.number,
                  ),
                  const SizedBox(height: 30.0),
                  // NameUz
                  _inputField(
                    context,
                    context.watch<ProductProvider>().nameUzController,
                    "Enter produt's name",
                    TextInputType.name,
                  ),
                  const SizedBox(height: 30.0),
                  // Cost
                  _inputField(
                    context,
                    context.watch<ProductProvider>().costController,
                    "Enter product's cost",
                    TextInputType.number,
                  ),
                  const SizedBox(height: 30.0),
                  // Address
                  _inputField(
                    context,
                    context.watch<ProductProvider>().addressController,
                    "Enter product's address",
                    TextInputType.streetAddress,
                  ),
                  const SizedBox(height: 30.0),
                  // PagedListView<int, ProductModel>(
                  //   pagingController: _pagingController,
                  //   builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                  //     itemBuilder: (context, item, index) => Text(
                  //       item.nameUz.toString(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              child: Wrap(
                children: [
                  _functionButton(
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetDataPage(),
                      ),
                    ),
                    "Get Data",
                  ),
                  const SizedBox(width: 30.0),
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
                            double.parse(context
                                .read<ProductProvider>()
                                .costController
                                .text),
                            context
                                .read<ProductProvider>()
                                .addressController
                                .text
                                .toString(),
                            time,
                          ),
                      "Post Data to Api"),
                  const SizedBox(width: 30.0),
                  _functionButton(() {}, "Get"),
                  const SizedBox(width: 30.0),
                  _functionButton(() {}, "Delete"),
                ],
              ),
            ),
          ],
        ),
      );

  ElevatedButton _functionButton(
    void Function() function,
    String title,
  ) {
    return ElevatedButton(
      onPressed: function,
      child: Text(title),
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

  // @override
  // void dispose() {
  //   _pagingController.dispose();
  //   super.dispose();
  // }
}
