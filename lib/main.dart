import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal,
  ),
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Utils App"),),
      body: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {

  AlertDialog dialog= AlertDialog(
    title: Text("Hii"),
    content: Text("The dialog Box is up...", style: TextStyle(fontSize: 30.0),),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ElevatedButton(
            child: Icon(Icons.add,),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("\nYOu clicked me.\n"),
               // duration: Duration(seconds: 3),
            ),
            ),
      ),
            ElevatedButton(
                child: Icon(Icons.add,),
              onPressed: ()=>showDialog(
                context: context,
                builder: (BuildContext context) => dialog,
              ),
              ),
            Stepfunc(),
          ]
                  ),
               ),

    );
  }
}

class Stepfunc extends StatefulWidget {
  @override
  State<Stepfunc> createState() => _StepfuncState();
}

class _StepfuncState extends State<Stepfunc> {

  int current_step=0;
  List<Step> my_steps = [
    Step(
        title: Text("Step 1"),
        content: Text("Some Content 1"),
        isActive: true
    ),
    Step(
        title: Text("Step 2"),
        content: Text("Some Content 2"),
        isActive: true
    ),
    Step(
        title: Text("Step 3"),
        content: Text("Some Content 3"),
        isActive: true
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stepper(
          steps: my_steps,
          currentStep: this.current_step,
          type: StepperType.vertical,
          onStepContinue: () {
            final isLastStep = current_step == my_steps.length - 1;
            if(isLastStep)
              print("completed");
            else
            setState(() => current_step++);
            },
          onStepCancel: () {
            current_step == 0 ? null :
            setState(() => current_step--);},
        )
    );
  }
}



