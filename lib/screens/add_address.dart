import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  String? _required(String? value, String field) {
    if (value == null || value.trim().isEmpty) {
      return '$field is required';
    }
    return null;
  }

  void _onSave() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      // البيانات سليمة، خد القيم من الـ controllers
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final address = addressController.text.trim();
      final city = cityController.text.trim();
      final state = stateController.text.trim();
      final zip = zipCodeController.text.trim();
      final phone = phoneController.text.trim();

      // TODO: ابعت البيانات أو احفظها
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(isBlack: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      // Title
                      Center(
                        child: CustomText(
                          text: 'Add shipping adress'.toUpperCase(),
                          spacing: 5,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(5),
                      Center(
                        child: Image.asset(
                          'assets/svgs/line.png',
                          width: 190,
                          color: const Color(0xff555555),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // First name | Last name
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'First name',
                              controller: firstNameController,
                              validator: (v) => _required(v, 'First name'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Last name',
                              controller: lastNameController,
                              validator: (v) => _required(v, 'Last name'),
                            ),
                          ),
                        ],
                      ),

                      // Address
                      CustomTextField(
                        hintText: 'Address',
                        controller: addressController,
                        validator: (v) => _required(v, 'Address'),
                      ),

                      // City
                      CustomTextField(
                        hintText: 'City',
                        controller: cityController,
                        validator: (v) => _required(v, 'City'),
                      ),

                      // State | ZIP code
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'State',
                              controller: stateController,
                              validator: (v) => _required(v, 'State'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'ZIP code',
                              controller: zipCodeController,
                              keyboardType: TextInputType.number,
                              validator: (v) => _required(v, 'ZIP code'),
                            ),
                          ),
                        ],
                      ),

                      // Phone number
                      CustomTextField(
                        hintText: 'Phone number',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Phone number is required';
                          }
                          if (v.trim().length < 10) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            // Save button (ثابت تحت)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
              child: CustomButton(
                text: "Add now",
                image: false,
                onTap: _onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
