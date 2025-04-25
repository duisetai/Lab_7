import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constants/constants.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  bool obscurePassword = true;
  bool acceptTerms = false;
  String? selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              focusNode: nameFocus,
              decoration: InputDecoration(labelText: tr("name")),
              validator: (value) =>
                  value!.isEmpty ? tr("name") + " " + tr("required") : null,
            ),
            TextFormField(
              controller: emailController,
              focusNode: emailFocus,
              decoration: InputDecoration(labelText: tr("email")),
              validator: (value) {
                if (value!.isEmpty) return tr("email") + " " + tr("required");
                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                return emailRegex.hasMatch(value) ? null : "Invalid email";
              },
            ),
            TextFormField(
              controller: phoneController,
              focusNode: phoneFocus,
              decoration: InputDecoration(labelText: tr("phone")),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) return tr("phone") + " " + tr("required");
                final digitsOnly = RegExp(r'^\d+$');
                return digitsOnly.hasMatch(value)
                    ? null
                    : "Only digits allowed";
              },
            ),
            TextFormField(
              controller: passwordController,
              focusNode: passwordFocus,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: tr("password"),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return tr("password") + " " + tr("required");
                return value.length >= 6
                    ? null
                    : "Password must be at least 6 characters";
              },
            ),
            TextFormField(
              controller: confirmPasswordController,
              focusNode: confirmPasswordFocus,
              obscureText: obscurePassword,
              decoration: InputDecoration(labelText: tr("confirm_password")),
              validator: (value) {
                if (value!.isEmpty)
                  return tr("confirm_password") + " " + tr("required");
                return value == passwordController.text
                    ? null
                    : "Passwords do not match";
              },
            ),
            SizedBox(height: 16.h),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: [
                DropdownMenuItem(value: "male", child: Text(tr("male"))),
                DropdownMenuItem(value: "female", child: Text(tr("female"))),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              decoration: InputDecoration(labelText: tr("gender")),
              validator: (value) =>
                  value == null ? "Please select gender" : null,
            ),
            SizedBox(height: 16.h),
            CheckboxListTile(
              value: acceptTerms,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value!;
                });
              },
              title: Text(tr("accept_terms")),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate() && acceptTerms) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Registration Successful!")),
                  );
                } else if (!acceptTerms) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please accept terms.")),
                  );
                }
              },
              child: Text(
                tr("register"),
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
