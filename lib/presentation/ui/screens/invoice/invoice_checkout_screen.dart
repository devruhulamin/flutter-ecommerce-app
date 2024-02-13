import 'package:crafty_bay_ruhulaminjr/data/model/invoice_model.dart';
import 'package:flutter/material.dart';

class InvoiceCheckOutScreen extends StatelessWidget {
  final InvoiceModel invoiceData;
  const InvoiceCheckOutScreen({super.key, required this.invoiceData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "${invoiceData.payable}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "${invoiceData.vat}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "${invoiceData.total}",
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
  }
}
