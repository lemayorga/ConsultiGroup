import 'package:fl_productos_app/models/models.dart';
import 'package:fl_productos_app/screens/screens.dart';
import 'package:fl_productos_app/services/services.dart';
import 'package:fl_productos_app/widgets/widgtes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if( productsService.isLoading ) return LoadingScreen();

    return  Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        leading: IconButton(
          icon: Icon( Icons.login_outlined ),
          onPressed: () {

            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');

          },
        ),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            productsService.selectedProduct = productsService.products[index].copy();
             Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
             product: productsService.products[index]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          productsService.selectedProduct = Product(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
        child: Icon(Icons.add),  
      ),
    );
  }
}