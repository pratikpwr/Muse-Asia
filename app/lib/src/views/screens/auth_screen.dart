import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/modules/auth/bloc/auth_bloc.dart';

enum AuthValue { SignUp, SignIn }

class AuthScreen extends StatefulWidget {
  final bool isSignUp;

  AuthScreen({this.isSignUp = true});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp;
  bool isLoading = false;

  final TextEditingController _emailController = new TextEditingController();

  final TextEditingController _passwordController = new TextEditingController();

  final TextEditingController _userNameController = new TextEditingController();

  @override
  void initState() {
    isSignUp = widget.isSignUp;
    super.initState();
  }

  //TODO : Sign Up Bug Solve

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: GoogleFonts.montserrat(fontSize: 12),
    )));
  }

  @override
  Widget build(BuildContext context) {
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) {
              return HomeScreen();
            }));
          }
          if (state is AuthFailure) {
            showSnackBar(state.error.toString());
          }
        },
        child: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: isSignUp ? signUpWidget() : signInWidget()),
        )),
      ),
    );
  }

  Widget signUpWidget() {
    return Column(
      children: [
        _museLogo(),
        TextField(
          controller: _userNameController,
          style: GoogleFonts.montserrat(fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_rounded,
              ),
              hintText: 'Username',
              hintStyle: GoogleFonts.montserrat(fontSize: 14),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          controller: _emailController,
          style: GoogleFonts.montserrat(fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_rounded,
              ),
              hintText: 'Email',
              hintStyle: GoogleFonts.montserrat(fontSize: 14),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          controller: _passwordController,
          style: GoogleFonts.montserrat(fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_rounded,
              ),
              hintText: 'Password',
              hintStyle: GoogleFonts.montserrat(fontSize: 14),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        SizedBox(
          height: 16,
        ),
        _authButton(
            onTap: () {
              if (_userNameController.text.length < 5) {
                return showSnackBar('Enter valid username!');
              }
              if (_emailController.text.length < 6 &&
                  !_emailController.text.contains('@')) {
                return showSnackBar('Enter valid email!');
              }
              if (_passwordController.text.length < 6) {
                return showSnackBar('Password is too short!');
              }
              BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
                  userName: _userNameController.text,
                  email: _emailController.text,
                  password: _passwordController.text));
            },
            text: 'Sign Up'),
        _authToggleButton(
            text: 'Already a member? Sign In',
            onTap: () {
              setState(() {
                isSignUp = false;
              });
            })
      ],
    );
  }

  Widget signInWidget() {
    return Column(
      children: [
        _museLogo(),
        TextField(
          controller: _emailController,
          style: GoogleFonts.montserrat(fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_rounded,
              ),
              hintText: 'Email',
              hintStyle: GoogleFonts.montserrat(fontSize: 14),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          controller: _passwordController,
          style: GoogleFonts.montserrat(fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_rounded,
              ),
              hintText: 'Password',
              hintStyle: GoogleFonts.montserrat(fontSize: 14),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        SizedBox(
          height: 16,
        ),
        _authButton(
            text: 'Sign In',
            onTap: () {
              if (_emailController.text.length < 6 &&
                  !_emailController.text.contains('@')) {
                return showSnackBar('Enter valid email!');
              }
              if (_passwordController.text.length < 6) {
                return showSnackBar('Password is too short!');
              }
              BlocProvider.of<AuthBloc>(context).add(SignInEvent(
                  email: _emailController.text,
                  password: _passwordController.text));
            }),
        _authToggleButton(
            text: 'New member? Sign Up',
            onTap: () {
              setState(() {
                isSignUp = true;
              });
            })
      ],
    );
  }

  Center _museLogo() {
    return Center(
      child: Image.asset(
        AllImages().museAsiaNoBg,
        width: MediaQuery.of(context).size.width * 0.7,
      ),
    );
  }

  Widget _authButton({String text, Function onTap}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            primary: ColorConstants.accentColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onTap,
        child: Text(
          text,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
        ));
  }

  Widget _authToggleButton({String text, Function onTap}) {
    return TextButton(
        onPressed: onTap,
        child: Text(text,
            style: GoogleFonts.montserrat(
                fontSize: 14, color: ColorConstants.primaryColor)));
  }
}
