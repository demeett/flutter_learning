import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../200/image_learn_202.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_cubit_state.dart';
import '../service/login_service.dart';
import '../../../../product/service/vexana_network_manager.dart';
import 'package:kartal/kartal.dart';
part 'login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginText = 'Login';
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
          appBar: AppBar(title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(
                      color: context.colorScheme.error,
                    )
                  : const SizedBox();
            },
          )),
          body: Form(
              key: _formLoginKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const PagePadding.all(),
                child: Column(
                  children: [
                    _LoginEmailFields(
                      controller: _emailController,
                      passwordController: _passwordController,
                    ),
                    _LoginButton(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        loginText: loginText)
                  ],
                ),
              ))),
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(10);
}
