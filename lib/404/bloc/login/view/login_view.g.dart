part of './login_view.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.loginText,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String loginText;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isCompleted) {
          context.navigateToPage(const ImageLearn202());
        }
      },
      builder: (context, state) {
        return SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().checkUser(_emailController.text, _passwordController.text);
                  },
                  child: Text('$loginText - ${state.model?.email ?? ''}'),
                );
              },
            ));
      },
    );
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields({
    Key? key,
    required TextEditingController controller,
    required TextEditingController passwordController,
  })  : _emailController = controller,
        _passwordController = passwordController,
        super(key: key);
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(hintText: "Email"),
          validator: (String? data) => (data?.isValidEmail ?? false) ? null : "error",
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
          validator: (String? data) => ((data?.length ?? 0) > 6) ? null : "error",
        ),
      ],
    );
  }
}