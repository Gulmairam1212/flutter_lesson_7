import 'package:flutter/material.dart';

class RegistrationApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistrationPageState();
}

class  RegistrationPageState extends State<RegistrationPage>{

final _formKey = GlobalKey<FormState>();

 final nameController = TextEditingController();
final surnameController  = TextEditingController();
final phoneController = TextEditingController();
final emailController = TextEditingController();
 final loginController = TextEditingController();
 final passowordController = TextEditingController();





  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passowordController.dispose();
    super.dispose();
  }
  void submitForm() {
    if(_formKey.currentState!.validate()){
      showDialog(
        context: context,
         builder: (BuildContext context){
          return AlertDialog(
           title:const Text('Потверждение данных'),
           content:Column(
            children: [
              Text('Имя:${nameController.text}'),
              Text('Фамилия:  ${surnameController.text}'),
              Text('Телефон: $phoneController.text'),
              Text('Email: ${emailController.text}'),
              Text('Логин: ${loginController.text}'),
              Text('Паспорт: ${passowordController.text}')
            ],
           ),
           actions:[
            TextButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child:const Text('Отмена'),
            ),
            TextButton (
              onPressed: (){
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Успешно зарегистрирован')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        name: nameController.text, 
                        surname: surnameController.text,
                        phone: phoneController.text ,
                      email:emailController.text,
                      login: loginController.text,
                      passoword: passowordController.text,

                        ),
                      ),
                    );
              },
              child:const Text('ok')
              ),
              
            ],
          );
         }
      );
    
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    
      title: Text('Экран регистрации'),
    backgroundColor: const Color.fromRGBO(26, 100, 129, 1),

    centerTitle: true,
    ),
    body:SingleChildScrollView(
      padding:EdgeInsets.all(16),
      child:Form(
        key:_formKey,
        child: Column(
          children: [

            buildTextField(
              controller: nameController, 
              label: 'Имя',
              hint:'Введите имя',
               validator: (value){
                if(value == null || value.isEmpty){
                  return 'Введите имя';
                }
                if(!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)){
                  return 'только буквы';
                }
                return null;
               }),

                buildTextField(
              controller: surnameController, 
              label: 'Фамилия',
              hint:'Введите фамилию',
               validator: (value){
                if(value == null || value.isEmpty){
                  return 'Введите фамилию';
                }
                if(!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)){
                  return 'только буквы';
                }
                return null;
               }),

                buildTextField(
                  controller: phoneController, 
                  label: 'Телефон', 
                  hint:'Введите номер телефона',
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Введите номер телефона';
                    }
                    return null;
                  }),

                   buildTextField(
                    controller:emailController , 
                    label: 'Email',
                    hint: 'Введите email',
                     validator: (value){
                      if(value == null || value.isEmpty) {
                        return 'Введите email';
                      }
                      return null;
                     }
                     ),

                      buildTextField(
                    controller:loginController , 
                    label: 'Логин',
                    hint: 'Введите логин',
                     validator: (value){
                      if(value == null || value.isEmpty) {
                        return 'Введите логин';
                      }
                      return null;
                     }
                     ),


                      buildTextField(
                    controller:passowordController , 
                    label: 'Пароль',
                    hint: 'Введите пароль',
                    obscureTezt: true,
                     validator: (value){
                      if(value == null || value.isEmpty) {
                        return 'Введите пароль';
                      }
                      if(value.length < 6){
                        return 'Пароль должен содержать от 6 символов';
                      }
                      return null;
                     }
                     ),

                      buildTextField(
                    controller:TextEditingController(), 
                    label: 'Повтор пароля',
                    hint: 'Повторите пароль',
                    obscureTezt: true,
                     validator: (value){
                      if(value == null || value.isEmpty) {
                        return 'повторите пароль';
                      }
                      if(value != passowordController.text){
                        return 'Пароли не совподают';
                      }
                      return null;
                     }
                     ),

                   

               SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                   child: Text('Заригистрироваться'),),
               ),
               
            
          ],
        ),
      )
    ),
    );
  }
  Widget buildTextField ({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool obscureTezt = false,
    TextInputType keyboardType = TextInputType.text,

    required String? Function(String?) validator
  }) {
    return Padding(padding: EdgeInsets.only(bottom:18),
    child: TextFormField(
      controller: controller,
      obscureText: obscureTezt,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ), validator: validator
    ),
    );
  }
  }
  class ResultPage extends StatelessWidget {
    final String name;
    final String surname;
    final String phone;
    final String email;
    final String login;
    final String passoword;

    const ResultPage({
      super.key,
      required this.name,
      required this.surname,
      required this.phone,
      required this.email,
      required this.login,
      required this.passoword,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Данные пользователя'),
      backgroundColor: Colors.blueGrey,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' Имя: $name'),
          const SizedBox(height:10),
          Text('Фамилия: $surname'),
          const SizedBox(height:10),
          Text('Телефон: $phone'),
          const SizedBox(height: 10),
          Text('Email: $email'),
          const SizedBox(height: 10),
          Text('Логин: $login'),
          const SizedBox(height: 10),
          Text('Пароль: &passoword'),
          const SizedBox(height:10),

          
        ],
      ) ,
      ),

    );
  }
    
  }