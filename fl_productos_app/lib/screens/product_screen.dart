import 'package:fl_productos_app/providers/product_form_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fl_productos_app/services/services.dart';
import 'package:fl_productos_app/widgets/widgtes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProducScreen extends StatelessWidget {
  const ProducScreen({super.key});

  @override
  Widget build(BuildContext context) {

  final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
        create: ( _ ) => ProductFormProvider( productService.selectedProduct ),
        child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productService,
  });

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {

  final productForm = Provider.of<ProductFormProvider>(context);
  
    return Scaffold(
        body: SingleChildScrollView(
         // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Stack(
                children: [
                   ProductImage(url: productService.selectedProduct.picture),

                  Positioned(
                    top: 60,
                    left:  20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_outlined, size: 40, color: Colors.white,),
                    )
                  ),

                  Positioned(
                    top: 60,
                    left:  20,
                    child: IconButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                          // source: ImageSource.gallery,
                          source: ImageSource.camera,
                          imageQuality: 100
                        );

                        if( pickedFile == null ) {
                          print('No seleccionó nada');
                          return;
                        }

                        productService.updateSelectedProductImage(pickedFile.path);
                                              
                      }, // Navigator.of(context).pop(),
                      icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,),
                    )
                  )

                ],
              ),

              const _ProductForm(),

              const SizedBox(height: 100,)
            ],
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
        onPressed: productService.isSaving 
              ? null
              : () async {
              
              if ( !productForm.isValidForm() ) return;

              final String? imageUrl = await productService.uploadImage();

              if ( imageUrl != null ) productForm.product.picture = imageUrl;

              await productService.saveOrCreateProduct(productForm.product);

          },
        child: productService.isSaving 
          ? const CircularProgressIndicator( color: Colors.white )
          : const Icon( Icons.save_outlined ),
        ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    var boxDecoration = BoxDecoration(
      color:  Colors.white,
      borderRadius:  const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color:  Colors.black.withOpacity(0.05),
          blurRadius: 5,
          offset:  const Offset(0,5)
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width:  double.infinity,
          decoration: boxDecoration,
          child: Form(
            key:  productForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                  SizedBox(height: 10),

                  TextFormField(
                    initialValue: product.name,
                    onChanged: (value) => product.name = value,
                    validator: (value) {
                      if(value == null ||  value.length < 1)
                          return 'El nombre es obligatorio';
                    },
                      decoration: const InputDecoration(
                        hintText: 'Nombre del producto',
                         labelText: 'Nombre'
                      ),
                  ),


                 SizedBox(height: 30),

                  TextFormField(
                    initialValue: '${product.price}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    onChanged: (value){
                      if(double.tryParse(value) == null){
                            product.price =  0;
                      }else{
                          product.price = double.parse(value);
                      }
                    },
                    keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '\$150',
                         labelText: 'Precio'
                      ),
                  ),

                  SizedBox(height: 30),

                  SwitchListTile(
                    value: product.available, 
                    title: Text('Disponible'),
                    activeColor: Colors.indigo,
                     onChanged: productForm.updateAvailability
                  ),

                 SizedBox(height: 30),

              ],
            ),
          ),
      ),
    );
  }
}