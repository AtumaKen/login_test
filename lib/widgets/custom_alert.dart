import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_test/widgets/es_button.dart';

class ECAlertDialog extends StatefulWidget {
  @override
  _ECAlertDialogState createState() => _ECAlertDialogState();
}

class _ECAlertDialogState extends State<ECAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text(
          "Airtime",
          style: TextStyle(color: Theme.of(context).iconTheme.color),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Airtime Recharge", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Phone Number"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: _networkWidget(),
                        flex: 1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: _amountWidget(),
                        flex: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: ESButton(
                        text: "Buy",
                        top: 20,
                        bottom: 20,
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _selectedText = "MTN";
  List<String> _options = ["MTN", "Glo", "Airtel", "9 Mobile", "Ntel"];

  Widget _networkWidget() {
    return Column(
      children: [
        Text("Network"),
        DropdownButtonFormField<String>(
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          hint: Text("Select Your Network"),
          value: _selectedText,
          onChanged: (newValue) {
            setState(() {
              _selectedText = newValue;
              // widget._bankNameController.text = _selectedText;
            });
          },
          items: _options.map((reason) {
            return DropdownMenuItem(
              child: Text(reason),
              value: reason,
            );
          }).toList(),
          validator: (value) => value == null ? 'Select a bank' : null,
        ),
      ],
    );
  }

  Widget _amountWidget() {
    return Column(
      children: [
        Text("Amount"),
        TextField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
