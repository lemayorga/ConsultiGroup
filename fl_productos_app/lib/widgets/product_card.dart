import 'package:fl_productos_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50 ),
          width: double.infinity,
          height: 400,
          decoration:  _carBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
               _BackgroundImage(url: product.picture),

              _ProductDetails(
                title: product.name,
                subTitle:  product.id!,
              ),

              Positioned(
                top: 0,
                right: 0,
                child: _PriceTap(price: product.price)
              ),

              if(!product.available)   
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: _NoAvailable()
                  ),
            ],
          ),
      ),
    );
  }

  BoxDecoration _carBorders() {
    return BoxDecoration(
      color:  Colors.white,
        borderRadius:  BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset:  Offset(0,7),
            blurRadius: 10
          )
        ]    
      );
  }
}

class _NoAvailable extends StatelessWidget {
  const _NoAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration:  const BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.only( topRight:  Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal:  10),
          child: Text('No disponible', style: TextStyle(color:  Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}

class _PriceTap extends StatelessWidget {

  final double price;
  
  const _PriceTap({
     required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration:  const BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.only( topRight:  Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
      child:  FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal:  10),
          child: Text('\$$price', style: const TextStyle(color:  Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {

  final String title;
  final String subTitle;

  const _ProductDetails({required this.title, required this.subTitle});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10) ,
          width: double.infinity,
          height: 70,
          decoration: _buldBoxDecoration(),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, 
                style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
               subTitle, 
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
      ),
    );
  }

  BoxDecoration _buldBoxDecoration() {
    return const BoxDecoration(
          color: Colors.indigo,
        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(25), topRight:   Radius.circular(25))
        );
  }
}

class _BackgroundImage extends StatelessWidget {

  final String? url;
  
  const _BackgroundImage({
    super.key, this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child:  url == null 
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            :  FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image:  NetworkImage(url!),
                fit: BoxFit.cover,
            ),
      ),
    );
  }
}