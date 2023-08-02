import 'package:aumettask_1/screen/homepage/detailspage.dart';
import 'package:flutter/cupertino.dart';
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
 int _offset=0;
  @override
  void initState() {
    super.initState();
    _productsListPaginationController.addPageRequestListener((pageKey) {
      _fetchData();
    });
  }
  Future<void> _fetchData() async {
    List<Products> products = await ref.read(productProvider).getProducts();
    _offset += products.length;
    _productsListPaginationController.appendPage(products, _offset);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("image/logo.png"),
        centerTitle: true,
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: PagedGridView<int, Products>(
          pagingController: _productsListPaginationController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 8,
          ),
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, products, index) => InkWell(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>DetailesPage(Products as Products)));
              },
              child: Container(
                width: 162,
                height: 308,
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
                    Text(products.name!),
                    Image.network(
                      products.photoUrl!,
                      width: 94,
                      height: 82,
                    ),
                    Expanded(child: Text(products.description!,style: TextStyle(),textAlign: TextAlign.center,)),
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: MaterialButton(
                          onPressed: () {}, child: const Text("See More")),
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



