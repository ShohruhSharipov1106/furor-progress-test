import 'package:furor_progress_test/constants/exports.dart';

class FormFieldPage extends StatelessWidget {
  const FormFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
        ],
      ),
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
