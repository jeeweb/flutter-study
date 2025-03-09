import 'package:flutter/material.dart';
import '../../../core/core.dart';

class FLDatePickerField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Function(String?) onSaved;

  const FLDatePickerField({
    super.key,
    this.labelText = "Date",
    this.hintText = "Select the date.",
    required this.onSaved,
  });

  @override
  FLDatePickerFieldState createState() => FLDatePickerFieldState();
}

class FLDatePickerFieldState extends State<FLDatePickerField> {
  late TextEditingController _dateController = TextEditingController();

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    //print(date); // date 값 확인하기
    initialDate = DateTime.now();
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _dateController.value = TextEditingValue(text: textDate);
  }

  void _selectDate() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (dateTime != null) {
      setState(() {
        initialDate = dateTime;
        _setTextFieldDate(initialDate);
      });
    }
  }

  void resetDate() {
    setState(() {
      initialDate = DateTime.now();
      _dateController = TextEditingController();
      _setTextFieldDate(initialDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(208, 208, 208, 0.3),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _selectDate,
              child: TextFormField(
                controller: _dateController,
                //initialValue: "${DateTime.now()}",
                decoration: InputDecoration(
                  enabled: false,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: widget.labelText,
                  labelStyle: FLTextStyles.inputLabel,
                  hintText: widget.hintText,
                  hintStyle: FLTextStyles.inputHint,
                  border: InputBorder.none,
                ),
                onSaved: widget.onSaved,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
