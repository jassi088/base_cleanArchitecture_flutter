import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../presentation.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.close : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: 'Login',
        backgroundColor: AppColors.current.primaryColor,
        titleTextStyle: AppTextStyles.s14w400Primary(),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimens.d16.responsive()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.images.appIcon.path),
                  fit: BoxFit.cover,
                  width: 100,
                ),
                SizedBox(height: Dimens.d24.responsive()),
                AppTextField(
                  title: 'Email',
                  hintText: 'Email',
                  onChanged: (email) => bloc.add(EmailTextFieldChanged(email: email.trim())),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: Dimens.d24.responsive()),
                AppTextField(
                  title: 'Password',
                  hintText: 'Password',
                  onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass.trim())),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: Dimens.d15.responsive()),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.onPageError != current.onPageError,
                  builder: (_, state) => Text(
                    state.onPageError,
                    style: AppTextStyles.s14w400Secondary(),
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.isLoginButtonEnabled != current.isLoginButtonEnabled,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isLoginButtonEnabled
                          ? () => bloc.add(const LoginButtonPressed())
                          : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor
                            .withOpacity(state.isLoginButtonEnabled ? 1 : 0.5)),
                      ),
                      child: Text('Login', style: AppTextStyles.s14w400Primary()),
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
}
