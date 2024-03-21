// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/screens/error_screen/error_page.dart';
import 'package:acp_app/view_model/providers/auth_provider/login_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool obscureText = true;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  final _formKey = GlobalKey<FormState>();
  bool isFormValid = true;
  CustomThemes customThemes = CustomThemes();
  String errorMessage = '';
  bool isLoading = false;
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  double responsiveWidth(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  double responsiveHeight(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  bool validateForm() {
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      setState(() {
        isFormValid = false;
        errorMessage = 'Please enter username and password';
      });
      showErrorMessageSnackbar(context, errorMessage);
      return false;
    } else if (usernameController.text.isEmpty) {
      setState(() {
        isFormValid = false;
        errorMessage = 'Please enter username';
      });
      showErrorMessageSnackbar(context, errorMessage);
      return false;
    } else if (passwordController.text.isEmpty) {
      setState(() {
        isFormValid = false;
        errorMessage = 'Please enter password';
      });
      showErrorMessageSnackbar(context, errorMessage);
      return false;
    } else {
      setState(() {
        isFormValid = true;
        errorMessage = '';
      });
      return true;
    }
  }

  void showErrorMessageSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 4), // Optional: set the duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Sign in Screen', // Add a meaningful label for accessibility
      child: Scaffold(
        backgroundColor: ref.watch(darkModeProvider)
            ? CustomThemes().gettheme().darkmodeblack
            : CustomThemes().gettheme().whitecolor,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: ref.watch(darkModeProvider)
              ? CustomThemes().gettheme().darkmodeblack
              : CustomThemes()
                  .gettheme()
                  .whitecolor, // Set the background color to white
          iconTheme: IconThemeData(
              color: ref.watch(darkModeProvider)
                  ? CustomThemes().gettheme().whitecolor
                  : CustomThemes()
                      .gettheme()
                      .darkmodeblack), // Set back button color
          leading: Semantics(
            label: 'Sign in Screen Back button double tap to activate',
            excludeSemantics: true,
            child: IconButton(
              icon: const Icon(
                  Icons.keyboard_arrow_left_rounded), // Back button icon
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back when pressed
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: setUserForm(ref),
        ),
      ),
    );
  }

  Widget usernameField() {
    double activeFont = ref.watch(fontProvider).size;
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Text(
            'Username',
            style: TextStyle(
              fontSize: isIpad
                  ? (CustomThemes().gettheme().fontsize2 +
                          CustomThemes().gettheme().ipadfontsize) *
                      activeFont
                  : CustomThemes().gettheme().fontsize2 * activeFont,
              fontWeight: FontWeight.w600,
              fontFamily: CustomThemes().gettheme().font2,
            ),
          ),
        ),
        Semantics(
          label:
              'Enter your username', // Add a semantic label for accessibility
          child: TextFormField(
            key: const ValueKey('usernameField'),
            controller: usernameController,
            focusNode: usernameFocusNode,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: responsiveHeight(10),
                horizontal: responsiveWidth(10),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe7e8ea)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe7e8ea)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe7e7e9)),
              ),
              hintText: 'Enter username',
            ),
            autofocus: false,
          ),
        ),
      ],
    );
  }

  Widget passwordField(bool isDark) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    double activeFont = ref.watch(fontProvider).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: isIpad
                  ? (CustomThemes().gettheme().fontsize2 +
                          CustomThemes().gettheme().ipadfontsize) *
                      activeFont
                  : CustomThemes().gettheme().fontsize2 * activeFont,
              fontWeight: FontWeight.w600,
              fontFamily: CustomThemes().gettheme().font2,
            ),
          ),
        ),
        Semantics(
          label:
              'Enter your password', // Add a semantic label for accessibility
          child: TextFormField(
            key: const ValueKey('passwordField'),
            obscureText: obscureText,
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: responsiveHeight(4),
                horizontal: responsiveWidth(13),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe7e7e9)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe7e8ea)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe7e8ea)),
              ),
              hintText: 'Enter password',
              suffixIcon: FocusScope(
                child: Semantics(
                  excludeSemantics: true,
                  label: obscureText
                      ? 'Show password button double tap to activate'
                      : 'Hide password button double tap to activate',
                  child: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().hintcolorlight,
                    ),
                    onPressed: () async {
                      if (obscureText) {
                        SemanticsService.announce(
                            passwordController.text, TextDirection.ltr);
                      }
                      await AnalyticsService.userInteractionTrack();
                      setState(() {
                        obscureText = !obscureText;
                        passwordFocusNode.requestFocus();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget setUserForm(WidgetRef ref) {
    final bool isDark = ref.watch(darkModeProvider);
    double activeFont = ref.watch(fontProvider).size;
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    // CustomThemes customThemes = CustomThemes.gettheme();
    // CustomColors currentTheme = customThemes.gettheme();
    return Semantics(
      label: 'Sign in Form', // Provide an overall label for the form
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    customThemes.gettheme().bgColor,
                    customThemes.gettheme().bgColor,
                  ],
                ),
              ),
              height: responsiveHeight(300),
            ),
            Positioned(
              top: responsiveHeight(70),
              left: 0.0,
              right: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    CustomThemes().gettheme().acpicon,
                    width: responsiveWidth(40),
                    height: responsiveHeight(20),
                  ),
                  Image.asset(
                    CustomThemes().gettheme().logo,
                    fit: BoxFit.contain,
                    height: responsiveHeight(50),
                    width: responsiveWidth(100),
                  ),
                ],
              ),
              // ),
            ),
            Card(
              surfaceTintColor: isDark
                  ? CustomThemes().gettheme().darkmodegrey
                  : CustomThemes().gettheme().whitecolor,
              color: isDark
                  ? CustomThemes().gettheme().darkmodegrey
                  : CustomThemes().gettheme().whitecolor,
              elevation: 0.0,
              margin: EdgeInsets.only(
                left: responsiveWidth(35),
                right: responsiveWidth(35),
                top: responsiveHeight(190),
                bottom: responsiveHeight(120),
              ),
              child: Padding(
                padding: EdgeInsets.all(responsiveWidth(20)),
                child: Column(
                  children: <Widget>[
                    header(activeFont, context),
                    SizedBox(height: responsiveHeight(20)),
                    usernameField(),
                    SizedBox(height: responsiveHeight(20)),
                    passwordField(isDark),
                    SizedBox(height: responsiveHeight(35)),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FocusScope(
                        child: Semantics(
                          label: 'Sign in Button double tap to activate',
                          excludeSemantics: true,
                          enabled: isFormValid && errorMessage == '',
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: responsiveHeight(10),
                                horizontal: responsiveWidth(35),
                              ),
                              foregroundColor:
                                  const Color.fromARGB(255, 230, 229, 229),
                              backgroundColor: isDark
                                  ? CustomThemes().gettheme().whitecolor
                                  : CustomThemes().gettheme().bgColor,
                              textStyle: TextStyle(
                                fontSize: isIpad
                                    ? (CustomThemes().gettheme().fontsize3 +
                                            CustomThemes()
                                                .gettheme()
                                                .ipadfontsize) *
                                        activeFont
                                    : CustomThemes().gettheme().fontsize3 *
                                        activeFont,
                                fontWeight: FontWeight.w100,
                                fontFamily: CustomThemes().gettheme().font2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            // Inside your onPressed callback:
                            onPressed: () async {
                              bool isDataEntered = validateForm();
                              String resMessage = '';
                              if (isDataEntered) {
                                setState(() {
                                  isLoading = true;
                                });
                                // Verify credentials
                                List<dynamic> result = await ref
                                    .watch(loginProvider.notifier)
                                    .verifyCredentials(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                bool isValid = result[0];
                                if (isValid) {
                                  resMessage = 'Successfully Signed In';
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(resMessage),
                                    ),
                                  );
                                } else {
                                  if (result[1] == -1) {
                                    usernameController.clear();
                                    passwordController.clear();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ErrorScreen(
                                                  errorCode: 404,
                                                  isHeader: true)),
                                    );
                                  } else {
                                    resMessage = "Invalid username or password";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(resMessage),
                                      ),
                                    );
                                  }
                                }
                                setState(() {
                                  isLoading = false;
                                });
                                if (isValid) {
                                  Navigator.pop(context);
                                }
                              } else {
                                await Future.delayed(const Duration(
                                    seconds:
                                        2)); // Adjust the delay duration as needed
                                if (errorMessage ==
                                        'Please enter username and password' ||
                                    errorMessage == 'Please enter username') {
                                  setState(() {
                                    usernameFocusNode.requestFocus();
                                  });
                                } else {
                                  setState(() {
                                    passwordFocusNode.requestFocus();
                                  });
                                }
                              }
                            },

                            child: isLoading
                                ? CircularProgressIndicator(
                                    color: isDark
                                        ? CustomThemes().gettheme().bgColor
                                        : CustomThemes().gettheme().whitecolor,
                                  ) // Show loading indicator
                                : Text(
                                    key: const ValueKey('signInButton'),
                                    'Sign In',
                                    style: TextStyle(
                                      color: isDark
                                          ? CustomThemes().gettheme().bgColor
                                          : CustomThemes()
                                              .gettheme()
                                              .whitecolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: isIpad
                                          ? (CustomThemes()
                                                      .gettheme()
                                                      .fontsize3 +
                                                  CustomThemes()
                                                      .gettheme()
                                                      .ipadfontsize) *
                                              activeFont
                                          : CustomThemes()
                                                  .gettheme()
                                                  .fontsize3 *
                                              activeFont,
                                      fontFamily:
                                          CustomThemes().gettheme().font2,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget header(activeFont, BuildContext context) {
  final isIpad =
      Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
  return Row(
    children: [
      Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: isIpad
                    ? const EdgeInsets.fromLTRB(210, 5, 0, 0)
                    : const EdgeInsets.fromLTRB(85, 5, 0, 0),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: isIpad
                          ? 35.0 * activeFont +
                              CustomThemes().gettheme().ipadfontsize
                          : 35.0 * activeFont,
                      fontFamily: CustomThemes().gettheme().font1),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
