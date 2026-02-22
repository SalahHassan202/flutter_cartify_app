import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../home/screens/home_screen.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.s24.w),
            child: SingleChildScrollView(
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),

                    Center(
                      child: Image.asset(
                        AppAssets.registerImage,
                        height: 220.h,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    Text("Create Account 🚀", style: AppTextStyles.heading1),

                    SizedBox(height: 8.h),

                    Text(
                      "Join Cartify and start shopping.",
                      style: AppTextStyles.body,
                    ),

                    SizedBox(height: 30.h),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AuthTextField(
                            controller: nameController,
                            label: "Full Name",
                            validator: Validators.validateName,
                          ),

                          SizedBox(height: AppSpacing.s16.h),

                          AuthTextField(
                            controller: phoneController,
                            label: "Phone Number",
                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            validator: Validators.validatePhone,
                          ),

                          SizedBox(height: AppSpacing.s16.h),

                          AuthTextField(
                            controller: emailController,
                            label: "Email",
                            validator: Validators.validateEmail,
                          ),

                          SizedBox(height: AppSpacing.s16.h),

                          AuthTextField(
                            controller: passwordController,
                            label: "Password",
                            obscureText: true,
                            validator: Validators.validatePassword,
                          ),

                          SizedBox(height: 30.h),

                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return AuthButton(
                                text: "Register",
                                isLoading: state is AuthLoading,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().register(
                                      name: nameController.text.trim(),
                                      phone: phoneController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                              );
                            },
                          ),

                          SizedBox(height: 20.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
