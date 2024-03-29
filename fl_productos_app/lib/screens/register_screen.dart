import 'package:fl_productos_app/providers/login_form_provider.dart';
import 'package:fl_productos_app/services/services.dart';
import 'package:fl_productos_app/ui/input_decorations.dart';
import 'package:fl_productos_app/widgets/widgtes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),

              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height:  10),

                    Text('Crear cuenta', style : Theme.of(context).textTheme.headlineSmall),


                     SizedBox(height:  0),

                     ChangeNotifierProvider(
                      create: (BuildContext context) => LoginFormProvider(),
                      child:  _LoginForm(),
                     ),
                    

                  ],
                )
              ),


              SizedBox(height: 50,),

              Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 18),),

              SizedBox(height: 50,),
            ],
          ),
        )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {


    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formkey,
       autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType:  TextInputType.emailAddress,
                decoration:  InputDecorations.authInputDecoration(
                  hintText: 'jon@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded
                ),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                  ? null : 'EL valor de correo no es  correcto';
                },
              ),
             TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType:  TextInputType.emailAddress,
                decoration:  InputDecorations.authInputDecoration(
                  hintText: '*******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                      if(value != null && value.length >=6 ) return null;

                      return 'La contraseña debe de ser de 6 caracteres';
                },
              ),

              SizedBox( height:  30,),

              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation:  0,
                color:  Colors.deepPurple,
                child:  Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15 ),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: TextStyle(color:  Colors.white),
                    ),
                ),
                onPressed:  loginForm.isLoading  ? null :  ()async {

                    FocusScope.of(context).unfocus();
                    final authService = Provider.of<AuthService>(context, listen: false);
                    
                    if( !loginForm.isValidForm() ) return;

                    loginForm.isLoading = true;


                    // TODO: validar si el login es correcto
                    final String? errorMessage = await authService.createUser(loginForm.email, loginForm.password);

                    if ( errorMessage == null ) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      // TODO: mostrar error en pantalla
                      print( errorMessage );
                      loginForm.isLoading = false;
                    }
                },
              )
            ],
          )
        ),
    );
  }
}