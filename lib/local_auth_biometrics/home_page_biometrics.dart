
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';

class localAuthBiometrics extends StatefulWidget {

  @override
  State<localAuthBiometrics> createState() => _localAuthBiometricsState();
}

class _localAuthBiometricsState extends State<localAuthBiometrics> {

  final LocalAuthentication auth = LocalAuthentication();

  bool _isAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ui(),
      floatingActionButton: bottonAuth(),
    );
  }

  Widget bottonAuth(){
    return FloatingActionButton(
        onPressed: () async {
          print('step 1');


          if(!_isAuth){
            print('step 2');
            final bool canLocalAuth = await auth.canCheckBiometrics;
            print('*******************');
            print(canLocalAuth);
            if(canLocalAuth){
              try{
              final bool didAuth = await auth.authenticate(
                  localizedReason: 'Scan your fingerprint' ,
                options: const AuthenticationOptions(biometricOnly: false)
              );
              setState(() {
                _isAuth = didAuth;
              }
              );
            }catch(e){
                print('here catch ${e.toString()}');
              }
            }

          }else{
            setState(() {
              _isAuth = false;
            });
          }


        },
        child: Icon(_isAuth ? Icons.lock : Icons.lock_open),
    );
  }

  Widget Ui(){
    
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text('Testing Biometrics here ' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          if(_isAuth )  const Text('18-1-2024 ' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          if(!_isAuth ) const Text('******* ' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),

        ],
      ),
    );

  }
  
}


