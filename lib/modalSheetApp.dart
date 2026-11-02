import 'package:flutter/material.dart';

class ModalSheetApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   theme:ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    scaffoldBackgroundColor: Colors.grey.shade300
   ),

   home:HomePage(),

    );
  }
}

class HomePage extends StatelessWidget{
void showBottomSheet(BuildContext context){
showModalBottomSheet (
  context:context,
  shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top:Radius.circular(20)),
  ),
  isDismissible:true,
  builder:(context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      SizedBox(height: 16),
      Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      SizedBox(height: 16),

      bottomIten(
        context, 
        icon: Icons.group_add, 
        text: 'Novaya gruppa'
        ),
        bottomIten(
        context, 
        icon: Icons.lock, 
        text: 'Zakrytaya gruppa'
        ),
        bottomIten(
        context, 
        icon: Icons.person_add, 
        text: 'Dobavit contact'
        ),

        SizedBox(height: 16),
      ],
    );
  }
  );
}
Widget bottomIten(BuildContext context,{
  required IconData icon,
  required String text
}
){
  return ListTile(
    leading: Icon(icon,size:24),
    title: Text(text, style: TextStyle(fontSize: 16),

    ),
    onTap:(){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$text выбрано'),
          duration: Duration(seconds:3),
        )
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Modal Sheet'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(context),
        child: Icon(Icons.add) ,
      ),
      body: Center(
        child: Text('Список чатов', style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

}