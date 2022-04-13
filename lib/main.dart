import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled17/kisilerCubit.dart';
import 'package:untitled17/kisilerDaoRepository.dart';
import 'package:untitled17/kisilerDurum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => kisilerCubit(kisilerDaoRepository()),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<kisilerCubit>().kisileriAlVeTetikle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: BlocBuilder<kisilerCubit,kisilerDurum>(
        builder: (context,kisilerDurum)
        {
          if(kisilerDurum is kisilerYuklendi)
            {

              var kisiListesi = kisilerDurum.kisiListesi;


              return ListView.builder(

                  itemCount: kisiListesi.length,
                  itemBuilder: (context,indeks)
              {
                var kisi = kisiListesi[indeks];

                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                        ],
                      ),
                    ),
                  ),
                );

              }
              );


            }
          else
            {
              return Center(child: Text("Sayfa Yüklenemedi"),);
            }
        },

      ),

    );
  }
}
