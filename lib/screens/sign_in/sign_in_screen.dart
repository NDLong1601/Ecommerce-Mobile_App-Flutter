import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_mobile_app/theme/theme.dart';
import 'package:ecommerce_mobile_app/shared/shared.dart';
import 'package:ecommerce_mobile_app/router/route_name.dart';
import 'package:ecommerce_mobile_app/cubit/cubit.dart';
import 'package:ecommerce_mobile_app/di/injector.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: const _SignInScreenContent(),
    );
  }
}

class _SignInScreenContent extends StatefulWidget {
  const _SignInScreenContent();

  @override
  State<_SignInScreenContent> createState() => _SignInScreenContentState();
}

class _SignInScreenContentState extends State<_SignInScreenContent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    context.read<SignInCubit>().signInWithEmail(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.go(RouteName.homeRoute);
        } else if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Text('Sign in', style: AppTypography.headline1),
                  SizedBox(height: 32.h),
                  AppTextField(
                    hintText: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    text: 'Continue',
                    onPressed: state.isLoading
                        ? null
                        : () => _handleSignIn(context),
                    isLoading: state.isLoading,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an Account ? ',
                        style: AppTypography.bodyText2,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(RouteName.createAccountRoute);
                        },
                        child: Text(
                          'Create One',
                          style: AppTypography.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 48.h),
                  AppButton(
                    text: 'Continue With Apple',
                    onPressed: () {
                      // Handle Apple sign in
                    },
                    isOutlined: true,
                    prefixIcon: Icon(
                      Icons.apple,
                      color: AppColors.text,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    text: 'Continue With Google',
                    onPressed: () {
                      // Handle Google sign in
                    },
                    isOutlined: true,
                    prefixIcon: Icon(
                      Icons.g_mobiledata,
                      color: AppColors.text,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    text: 'Continue With Facebook',
                    onPressed: () {
                      // Handle Facebook sign in
                    },
                    isOutlined: true,
                    prefixIcon: Icon(
                      Icons.facebook,
                      color: AppColors.text,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
