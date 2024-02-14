import 'package:crafty_bay_ruhulaminjr/data/model/invoice_model.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/invoice_controller.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/center_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceCheckOutScreen extends StatefulWidget {
  const InvoiceCheckOutScreen({
    super.key,
  });

  @override
  State<InvoiceCheckOutScreen> createState() => _InvoiceCheckOutScreenState();
}

class _InvoiceCheckOutScreenState extends State<InvoiceCheckOutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<InvoiceController>().loadInvoiced();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: GetBuilder<InvoiceController>(builder: (controller) {
        final InvoiceModel invoiceData = controller.inVoice;
        return Visibility(
          visible: controller.isLoading == false,
          replacement: const CenterLoading(),
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Payable: ${invoiceData.payable}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Vat: ${invoiceData.vat}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Total: ${invoiceData.total}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final paymentMethod = invoiceData.paymentMethod![index];
                        return ListTile(
                          leading: Image.network(paymentMethod.logo ?? ''),
                          title: Text(paymentMethod.name ?? ''),
                          trailing: const Icon(Icons.arrow_right),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            height: 2,
                          ),
                      itemCount: invoiceData.paymentMethod?.length ?? 0))
            ],
          ),
        );
      }),
    );
  }
}
