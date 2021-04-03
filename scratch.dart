import 'dart:io';


void main(){
    performTask();
}

void performTask() async{
  task1();
  String output=await task2();                  // this used when output is needed so using with await and async we can make
  task3(output);                                // our program to wait until he is finished
}


void task1(){
  String result ='Task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async{
  Duration threesecond=Duration(seconds: 3);         //comes from dart.io
  //sleep(threesecond);   // syncrounous
  String result;
  await Future.delayed(threesecond,(){    // asyncrous--> when eg func 3 needs func 2 output then we have to apply wait
     result ='Task 2 data';                             // and async above
    print('Task 2 complete');
  });
  return result;
}


void task3(inpt){
  String result ='Task 3 data';
  print('Task 3 output$inpt');
}

