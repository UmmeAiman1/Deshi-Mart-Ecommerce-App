import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/styles/textsize.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firebase = FirebaseAuth.instance;

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _form = GlobalKey<FormState>();

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool isLogin = true;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      Navigator.of(context).pushReplacementNamed('/home_screen');
    }
  }

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    try {
      if (isLogin) {
        final userCredential = await firebase.signInWithEmailAndPassword(
          email: _loginEmailController.text,
          password: _loginPasswordController.text,
        );
        print('User logged in successfully: ${userCredential.user}');

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        Navigator.of(context).pushReplacementNamed('/BottomNavigation');
      } else {
        final userCredential = await firebase.createUserWithEmailAndPassword(
          email: _signupEmailController.text,
          password: _signupPasswordController.text,
        );
        print('User registered successfully: ${userCredential.user}');

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        Navigator.of(context).pushReplacementNamed('/home');
      }
    } on FirebaseAuthException catch (error) {
      print('FirebaseAuthException: ${error.code}, Message: ${error.message}');
    }
  }

  void _logout() async {
    await firebase.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Center(child: Image.asset('assets/images/carrot.png')),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    isLogin ? 'Loging' : 'Sign Up',
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gilroy'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    isLogin
                        ? 'Enter your emails and password'
                        : 'Enter your credentials to continue',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightText,
                        fontFamily: 'Gilroy'),
                  ),
                  Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: isLogin ? 0 : 45,
                          ),
                          if (!isLogin) ...[
                            Text(
                              'Username',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.lightText,
                                  fontFamily: 'Gilroy'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                              ),
                              child: TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a username.';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 20, top: 10),
                                ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                          SizedBox(
                            height: isLogin ? 45 : 42,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightText,
                                fontFamily: 'Gilroy'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: TextFormField(
                              controller: isLogin
                                  ? _loginEmailController
                                  : _signupEmailController,
                              decoration: InputDecoration(
                                suffixIcon: !isLogin
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 22,
                                      )
                                    : null,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 20, top: 10),
                              ),
                              validator: (value) {
                                if (value == null || !value.contains('@')) {
                                  return 'Please enter a valid email address.';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 42,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightText,
                                fontFamily: 'Gilroy'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: TextFormField(
                              controller: isLogin
                                  ? _loginPasswordController
                                  : _signupPasswordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 20, top: 10),
                                suffixIcon: IconButton(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 27,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, top: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: isLogin
                              ? const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'Gilroy'),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'By continuing you agree to our  ',
                                        style: TextStyle(
                                            color: AppColors.lightText,
                                            fontSize:
                                                AppTextSize.subheadingSize,
                                            fontFamily: 'Gilroy'),
                                      ),
                                      TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(
                                            color: AppColors.buttonColor,
                                            fontSize:
                                                AppTextSize.subheadingSize,
                                            fontFamily: 'Gilroy'),
                                      ),
                                      TextSpan(
                                        text: ' and',
                                        style: TextStyle(
                                            color: AppColors.lightText,
                                            fontSize:
                                                AppTextSize.subheadingSize,
                                            fontFamily: 'Gilroy'),
                                      ),
                                      TextSpan(
                                        text: ' Privacy Policy.',
                                        style: TextStyle(
                                            color: AppColors.lightText,
                                            fontSize:
                                                AppTextSize.subheadingSize,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    text: isLogin ? 'Login' : 'Sign Up',
                    onPressed: _submit,
                    backgroundColor: AppColors.buttonColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: RichText(
                        text: TextSpan(
                          text: isLogin
                              ? 'Don\'t have an account? '
                              : 'Already have an account ',
                          style: TextStyle(
                              fontSize: AppTextSize.subheadingSize,
                              fontWeight: FontWeight.w600,
                              color: AppColors.boldtext,
                              fontFamily: 'Gilroy'),
                          children: <TextSpan>[
                            TextSpan(
                              text: isLogin ? 'Sign Up' : 'Login',
                              style: TextStyle(
                                  fontSize: AppTextSize.subheadingSize,
                                  color: AppColors.buttonColor,
                                  fontFamily: 'Gilroy'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
