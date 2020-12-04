

class GroupManager{

  List<Function> onInteractFunctions = [];

  int register(Function onInteractFunction)
  {
    //print("Registered!");
    onInteractFunctions.add(onInteractFunction);
    return onInteractFunctions.length - 1;
  }

  void onActionPerformed(int performerId)
  {
    for(int i = 0; i < onInteractFunctions.length; i++) {
      if (i != performerId)
        onInteractFunctions[i]();
        //print(i);
    }
    //print(onInteractFunctions);
    //print("Group action performed!");
  }


}