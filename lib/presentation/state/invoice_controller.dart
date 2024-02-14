import 'package:crafty_bay_ruhulaminjr/data/model/invoice_model.dart';
import 'package:crafty_bay_ruhulaminjr/data/service/newtwork_caller.dart';
import 'package:crafty_bay_ruhulaminjr/data/utility/api_url.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  InvoiceModel _invoiceModel = InvoiceModel();
  String _errorMessage = '';
  bool _isloading = false;
  InvoiceModel get inVoice => _invoiceModel;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isloading;

  Future<bool> loadInvoiced() async {
    try {
      _isloading = true;
      update();
      final response =
          await NetworkCaller().getRequiest(url: ApiUrl.createInvoice);

      if (response.isSuccess) {
        if (response.responseData['data'].isEmpty) {
          return true;
        }
        _invoiceModel = InvoiceModel.fromJson(response.responseData['data'][0]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isloading = false;
      update();
    }
  }
}
