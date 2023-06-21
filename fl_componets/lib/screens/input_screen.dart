import 'package:fl_componets/screens/screens.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
   
  const InputScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Map<String , String> formValues = {
      'firts_name': 'Fernando',
      'last_name': 'Fernando',
      'email': 'f@gmail.com',
      'password': '123',
      'role': 'admin'
                                    
    };

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
           child: Form(
            key: myFormKey,
             child: Column(
              children:  [
                  CustomInputField( labelText: 'Nombre', hintText: 'Nombre de usuario', formProperty: 'firts_name', formValues: formValues ),
                 const SizedBox(height: 30),
           
                  CustomInputField( labelText: 'Apellido', hintText: 'Apellido de usuario', formProperty: 'last_name', formValues: formValues ),
                 const SizedBox(height: 30),
           
                  CustomInputField( labelText: 'Correo', hintText: 'Correo de usuario' , textInputType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues ),
                 const SizedBox(height: 30),
           
                  CustomInputField( labelText: 'Contraseña', hintText: 'Contraseña de usuario' , textInputType: TextInputType.emailAddress, obscureText:  true, formProperty: 'password', formValues: formValues ),
                 const SizedBox(height: 30),
           
                  DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'Admin',child: Text('Admin')),
                      DropdownMenuItem(value: 'Superuser',child: Text('Superuser')),
                      DropdownMenuItem(value: 'Developer',child: Text('Developer')),
                      DropdownMenuItem(value: 'Jr. Developer',child: Text('Jr. Developer'))
                    ], 
                    onChanged:(value) {
                        formValues['role'] = value ?? 'Admin';
                    }
                  ),

                  ElevatedButton(
                    onPressed: () { 
                    FocusScope.of(context).requestFocus(FocusNode());

                      if(!myFormKey.currentState!.validate()){
                        print('formulario no valido');
                        return;
                      }

                      print(formValues);
                   },
                  child:  const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))
                  )
                )
              ],
             ),
           ),
         ),
      ),
    );
  }
}
