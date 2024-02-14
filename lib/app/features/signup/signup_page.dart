import 'package:flutter/material.dart';
import 'package:forms_class/app/features/signup/signup_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupPage extends StatefulWidget {
  final SignupController signupController;
  const SignupPage({super.key, required this.signupController});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  SignupController get signupController => widget.signupController;
  late GlobalKey<FormState> formKey;
  late MaskTextInputFormatter phoneMask;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: signupController.viewModel.name.value);
    phoneController = TextEditingController(text: signupController.viewModel.phone.maskedValue);
    phoneMask = MaskTextInputFormatter(
      filter: {
        '#': RegExp(r'[0-9]'),
      },
      mask: '(##) # ####-####',
    );
    phoneMask.formatEditUpdate(TextEditingValue.empty, phoneController.value);
    formKey = GlobalKey();
  }

  @override
  void dispose() {
    nameController.dispose();
    signupController.updateNameErrorMessage(null);
    formKey.currentState?.dispose();
    super.dispose();
  }

  void validate() {
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        actions: [
          TextButton(
            onPressed: validate,
            child: const Text('Sign up'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: AnimatedBuilder(
              animation: signupController,
              builder: (context, child) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        onChanged: (value) {
                          signupController.updateName(value);
                          final validationResult = signupController.viewModel.name.validator(value);
                          signupController.updateNameErrorMessage(validationResult);
                        },
                        validator: signupController.viewModel.name.validator,
                        decoration: InputDecoration(
                          errorText: signupController.nameErrorMessage,
                          hintText: 'e.g. Adby Santos',
                          label: const Text('Nome'),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: phoneController,
                        inputFormatters: [phoneMask],
                        onChanged: (value) {
                          final unmaskedText = phoneMask.getUnmaskedText();
                          signupController.updatePhone(unmaskedText, value);
                          final validationResult = signupController.viewModel.phone.validator(unmaskedText);
                          signupController.updatePhoneErrorMessage(validationResult);
                        },
                        validator: signupController.viewModel.phone.validator,
                        decoration: InputDecoration(
                          errorText: signupController.phoneErrorMessage,
                          hintText: 'e.g. 11 9 11223344',
                          label: const Text('Telefone'),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
