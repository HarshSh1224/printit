import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:printit/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

var _formData = {
  'name': '',
  'email': '',
  'password': '',
};

final GlobalKey<FormState> _formKey = GlobalKey();

class _AuthScreenState extends State<AuthScreen> {
  final _passwordController = TextEditingController();

  bool _isLogin = true, agree = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleLogin() {
    setState(() {
      _isLogin = _isLogin ? false : true;
    });
  }

  // void _showErrorDialog(String errorMessage) {
  //   final start = errorMessage.indexOf(']');
  //   String croppedMessage =
  //       errorMessage.substring(start + 2, errorMessage.length - 1).trim();

  //   print('CROPPED $croppedMessage');

  //   if (croppedMessage.contains('Failed to connect')) {
  //     croppedMessage = 'Connection error. Please Retry.';
  //   }
  //   if (croppedMessage.contains('password is invalid')) {
  //     croppedMessage = 'The password is invalid!';
  //   }
  //   if (croppedMessage.contains('no user record')) {
  //     croppedMessage =
  //         'There is no user corresponding to this email address. Try Signing Up if you are a new user.';
  //   }

  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
  //           title: Text(
  //             'An Error Occurred!',
  //             style: TextStyle(
  //                 fontSize: 20,
  //                 color: Theme.of(context).colorScheme.onSecondaryContainer,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           content: Text(
  //             croppedMessage,
  //             style: TextStyle(
  //                 color: Theme.of(context).colorScheme.onPrimaryContainer),
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Okay'),
  //             ),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
          // AnimatedOpacity(
          //   duration: Duration(seconds: 2),
          //   opacity: _isLogin ? 0 : 1,
          //   child: _isLogin
          //       ? null
          //       : Text(
          //           'Welcome to',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontFamily: 'Raleway',
          //             // fontWeight: FontWeight.w800,
          //           ),
          //         ),
          // ),

          // AnimatedContainer(
          //   duration: Duration(milliseconds: 2000),
          //   curve: Curves.easeOutCirc,
          //   height: _isLogin ? 0 : 50,
          //   child: AnimatedOpacity(
          //     duration: Duration(seconds: 2),
          //     opacity: _isLogin ? 0 : 1,
          //     child: Text(
          //       'ExEngg',
          //       style: TextStyle(
          //         fontSize: 30,
          //         fontFamily: 'Raleway',
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          // AnimatedOpacity(
          //   duration: Duration(seconds: 2),
          //   opacity: _isLogin ? 0 : 1,
          //   child: _isLogin ? null : ImagePickerWidget(getProfilePic),
          // ),

          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 46),
            constraints: const BoxConstraints(minHeight: 200),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isLogin ? 'Login to continue' : 'Create a new account',
                    style: const TextStyle(
                      fontFamily: 'MoonBold',
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // if (!_isLogin)
                  NameTextFormField(_isLogin),
                  SizedBox(
                    height: _isLogin ? 0 : 10,
                  ),
                  const EmailTextFormField(),
                  SizedBox(
                    height: _isLogin ? 10 : 10,
                  ),
                  PasswordTextFormField(_passwordController),
                  if (_isLogin)
                    const SizedBox(
                      height: 10,
                    ),
                  if (_isLogin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.of(context)
                            //     .pushNamed(ForgotPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              fontFamily: 'MoonBold',
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: _isLogin ? 25 : 10,
                  ),
                  // if (!_isLogin)
                  ConfirmPasswordTextFormField(_passwordController, _isLogin),
                  SizedBox(
                    height: _isLogin ? 0 : 30,
                  ),
                  if (!_isLogin) agreeToTerms(context),
                  ElevatedButton(
                    onPressed: _isLogin || agree
                        ? () {
                            Navigator.of(context)
                                .pushNamed(HomeScreen.routeName);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        elevation: 8,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        _isLogin ? 'LOGIN' : 'SIGN UP',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontFamily: 'MoonBold'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isLogin
                                ? 'Dont have an account?'
                                : 'Already Have an account?',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: 'MoonBold'),
                          ),
                          TextButton(
                              onPressed: _toggleLogin,
                              child: Text(
                                _isLogin ? 'Sign Up' : 'Login',
                                style: const TextStyle(fontFamily: 'MoonBold'),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Row agreeToTerms(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            checkColor: Theme.of(context).colorScheme.background,
            activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
            value: agree,
            onChanged: (value) {
              setState(() {
                agree = value ?? false;
              });
            },
          ),
        ),
        Transform.translate(
          offset: const Offset(-10, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Roboto',
                // fontSize: 12,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              children: [
                const TextSpan(
                  text: 'I agree to the ',
                  // textAlign: TextAlign.center,
                ),
                TextSpan(
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    text: 'Privacy Policy',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // print('TAP Policy');
                        // final Uri url = Uri.parse(
                        //     'https://github.com/HarshSh1224/ExEngg-privacy/blob/main/privacy_policy.md');
                        // if (await canLaunchUrl(url)) {
                        //   await launchUrl(url,
                        //       mode: LaunchMode.externalApplication);
                        // }
                      }),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // height: 47,
      constraints: const BoxConstraints(
        minHeight: 47,
      ),
      width: double.infinity,
      // padding: EdgeInsets.all(7),
      // color: Colors.black,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('ab'),
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.email_outlined,
                      size: 35,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
              child: TextFormField(
            style: const TextStyle(
                fontFamily: 'Raleway', fontWeight: FontWeight.w700),
            keyboardType: TextInputType.emailAddress,
            // maxLength: 20,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontFamily: 'Raleway'),
              // border: OutlineInputBorder(),
              // contentPadding: EdgeInsets.symmetric(vertical: ),
            ),
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Invalid email!';
              }
              return null;
            },
            onSaved: (value) {
              _formData['email'] = value!;
            },
            // style: TextStyle(fontSize: 10),
          )),
        ],
      ),
    );
  }
}

class NameTextFormField extends StatelessWidget {
  final isLogin;
  const NameTextFormField(
    this.isLogin, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // color: Colors.red,
      duration: const Duration(milliseconds: 300),
      height: isLogin ? 0 : 70,
      constraints: const BoxConstraints(
          // minHeight: 47,
          ),
      width: double.infinity,
      // padding: EdgeInsets.all(7),
      // color: Colors.black,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isLogin ? 0 : 1,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('ab'),
                  Card(
                    color: Theme.of(context).colorScheme.primary,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
                child: TextFormField(
              style: const TextStyle(
                  fontFamily: 'Raleway', fontWeight: FontWeight.w700),
              keyboardType: TextInputType.emailAddress,
              // maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(fontFamily: 'Raleway'),
                // border: OutlineInputBorder(),
                // contentPadding: EdgeInsets.symmetric(vertical: ),
              ),
              validator: (value) {
                if (!isLogin && value!.length < 3) {
                  return 'Name should be min 3 character long';
                }
                return null;
              },
              onSaved: (value) {
                _formData['name'] = value!;
              },
              // style: TextStyle(fontSize: 10),
            )),
          ],
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  final _passwordController;
  const PasswordTextFormField(
    this._passwordController, {
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        // height: 47,
        constraints: const BoxConstraints(
          minHeight: 47,
        ),
        width: double.infinity,
        // padding: EdgeInsets.all(7),
        // color: Colors.black,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('ab'),
                  Card(
                    color: Theme.of(context).colorScheme.primary,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        size: 35,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
                child: TextFormField(
              style: const TextStyle(
                  fontFamily: 'Raleway', fontWeight: FontWeight.w700),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _hidePassword,
              // maxLength: 100,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      _hidePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                ),
                labelText: 'Password',
                labelStyle: const TextStyle(fontFamily: 'Raleway'),
                // border: OutlineInputBorder(),
                // contentPadding: EdgeInsets.symmetric(vertical: ),
              ),
              controller: widget._passwordController,
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Password Should be 8 characters long';
                }
                return null;
              },
              onSaved: (value) {
                _formData['password'] = value!;
              },
              // style: TextStyle(fontSize: 10),
            )),
          ],
        ));
  }
}

class ConfirmPasswordTextFormField extends StatefulWidget {
  final _passwordController, isLogin;
  const ConfirmPasswordTextFormField(
    this._passwordController,
    this.isLogin, {
    Key? key,
  }) : super(key: key);

  @override
  State<ConfirmPasswordTextFormField> createState() =>
      _ConfirmPasswordTextFormFieldState();
}

class _ConfirmPasswordTextFormFieldState
    extends State<ConfirmPasswordTextFormField> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        // color: Colors.red,
        duration: const Duration(milliseconds: 300),
        height: widget.isLogin ? 0 : 75,
        constraints: const BoxConstraints(
            // minHeight: 47,
            ),
        width: double.infinity,
        // padding: EdgeInsets.only(bottom: 7),
        // color: Colors.black,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: widget.isLogin ? 0 : 1,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('ab'),
                    Card(
                      color: Theme.of(context).colorScheme.primary,
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          size: 35,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                  child: TextFormField(
                style: const TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.w700),
                keyboardType: TextInputType.visiblePassword,
                obscureText: _hidePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    icon: Icon(_hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(fontFamily: 'Raleway'),
                  // border: OutlineInputBorder(),
                  // contentPadding: EdgeInsets.symmetric(vertical: ),
                ),
                validator: (value) {
                  if (!widget.isLogin &&
                      value != widget._passwordController.text) {
                    return 'Passwords dont match!';
                  }
                  return null;
                },
                onSaved: (value) {},
                // style: TextStyle(fontSize: 10),
              )),
            ],
          ),
        ));
  }
}
