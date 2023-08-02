import 'package:aumettask_1/screen/homepage/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../controller/product_controller.dart';
import '../../module/product.dart';

class Home extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_HomeState();

}

class _HomeState extends ConsumerState<Home> {
  final PagingController<int, Products> _productsListPaginationController =
  PagingController(firstPageKey: 0);
 int offset=0;
 int limit=5;
  @override
  void initState() {
    super.initState();
    _productsListPaginationController.addPageRequestListener((pageKey) {
      _fetchData();
    });
  }
  Future<void> _fetchData() async {
    List<Products> products = await ref.read(productProvider).getProducts(offset, limit );
    offset += products.length;
    _productsListPaginationController.appendPage(products, offset);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("image/logo.png"),
        centerTitle: true,
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: PagedGridView<int, Products>(
          pagingController: _productsListPaginationController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.9,

          ),
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, products, index) => InkWell(
              onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>DetailesPage(
                    products.name,products.price,
                    products.photoUrl,products.createdAt,
                    products.description,products.category,
                    products.updatedAt,
                  )));
              },
              child: Container(
                width: 162,
                // height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 30),
                  ],
                ),
                child: Column(
                  children: [
                    Text(products.name!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        products.photoUrl!,
                        width: 70,
                        height: 60,
                      ),
                    ),
                    Expanded(child: Text(products.description!,textAlign: TextAlign.center,)),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top:0,bottom: 5),
                      width: 140,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.cyan[200],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>DetailesPage(
                              products.name,products.price,
                              products.photoUrl,products.createdAt,
                              products.description,products.category,
                              products.updatedAt,
                            )));
                          }, child: const Text("See More",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



