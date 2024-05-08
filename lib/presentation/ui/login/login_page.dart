import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../shared/shared.dart';
import '../../presentation.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.close : LeadingIcon.none,
        leadingIconColor: context.theme.colorScheme.secondary,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: 'Login',
        backgroundColor: context.theme.colorScheme.primary,
        titleTextStyle: context.textTheme.labelMedium,
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.rps),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.images.appIcon.path),
                  fit: BoxFit.cover,
                  width: 100,
                ),
                SizedBox(height: 24.rps),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        title: 'Email',
                        hintText: 'Email',
                        onChanged: (email) => bloc.add(EmailTextFieldChanged(email: email.trim())),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng điền đầy đủ thông tin';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 24.rps),
                      AppTextField(
                        title: 'Password',
                        hintText: 'Password',
                        onChanged: (pass) =>
                            bloc.add(PasswordTextFieldChanged(password: pass.trim())),
                        validator: (value) {
                          if (!ValidationUtils.isValidPassword(value!)) {
                            return 'Password phải có hơn 6 ký tự';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.rps),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.onPageError != current.onPageError,
                  builder: (_, state) => Text(
                    state.onPageError,
                    style: context.textTheme.labelMedium!.copyWith(color: AppColors.purple),
                  ),
                ),
                SizedBox(height: 10.rps),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.isLoginButtonEnabled != current.isLoginButtonEnabled,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isLoginButtonEnabled ? _onLogin : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.primary
                            .withOpacity(state.isLoginButtonEnabled ? 1 : 0.5)),
                      ),
                      child: Text('Login', style: context.textTheme.labelMedium),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    bloc.add(const LoginButtonPressed());
  }
}
