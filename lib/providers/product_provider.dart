import 'package:furor_progress_test/constants/exports.dart';

class ProductProvider extends ChangeNotifier {
  TextEditingController typeIdController = TextEditingController();
  TextEditingController nameUzController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController newValueController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
}
