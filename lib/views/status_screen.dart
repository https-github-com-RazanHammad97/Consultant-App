

import 'package:consultant_app/views/widgets/kbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/statuscontroller.dart';

class StatusScreen extends StatefulWidget {

  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  late int clickedItem=0;
  @override
  Widget build(BuildContext context) {
     final myProvider = Provider.of<ProviderStatus>(context);
    myProvider.getStatus();
    return Scaffold(
      backgroundColor:Color(0xffF7F6FF),
      body:  SingleChildScrollView(
        child: SafeArea(child:
        Padding(
          padding:EdgeInsets.all(16),
          child: Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    kTextButton(text:'Cancel',
                        onPressed: () {Navigator.pop(context);}
                    ),
                    Text('Statuses',style:TextStyle(
                        color: Colors.black,
                        fontWeight:FontWeight.bold,
                        fontSize:24
                    ),),
                    kTextButton(text:'Done', onPressed: () {
                       myProvider.getSingleStatus(clickedItem);
                      Navigator.pop(context);
                    })

                  ],
                ),
                SizedBox(height:80,),
                Container(
                  key:UniqueKey(),
                  padding:EdgeInsets.all(8),
                  decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(25)
                  ),
                  height:300,
                  width:double.infinity,
                  child:ListView.separated(
                      itemBuilder:(context,index)=>ListTile(
                        onTap:(){
                          clickedItem=index+1;
                        },
                        leading:Container(
                          width:40,
                          height:40,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                           color:Color(int.parse(myProvider.temp[index].color.substring(2), radix: 16))
                          ),
                        ),
                         title:
                        Text(myProvider.temp[index].name,style:TextStyle(
                            fontSize:20,
                            color: Colors.black
                        ),),
                        trailing: myProvider.temp[index].id==clickedItem?
                        IconButton(onPressed:(){}, icon:Icon(
                          Icons.check,
                          color:Colors.blueAccent,
                        ))
                            :null,
                      ),
                      separatorBuilder:(context,index)=>const Divider(
                        thickness: 1,
                        color: Color(0xFFAFAFAF),
                      ),
                      itemCount:myProvider.temp.length
                  ,
                ),

                ),
              ]
          ),
        ),
        ),
      ),
    );
  }
}