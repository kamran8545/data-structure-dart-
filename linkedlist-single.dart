import 'dart:math';


void main(){
  
  var linkedList  = SingleLinkedList();
  linkedList.generateSingleLinked(noOfNodes:5);
  linkedList.traverseSingleLinked();
  print('\n');
//   linkedList.addNodeEnd(data: Random().nextInt(100));
//   linkedList.addNodeStart(data: Random().nextInt(100));
  linkedList.addNodeAt(position:3, data: Random().nextInt(100));
  linkedList.traverseSingleLinked();
  
}  


class SingleLinkedList{
  
  int data = -1;
  SingleLinkedList? link;
  
  SingleLinkedList({this.data = -1, this.link});
  
  /// This method will generate Single Linked List with n nodes
  void generateSingleLinked({required int noOfNodes}){
    SingleLinkedList? previousNode;
    for(int i = 1;i <= noOfNodes; i++){
      if(previousNode == null){
        link = SingleLinkedList(data:  Random().nextInt(100));
        previousNode = link;
      }else{
        previousNode.link = SingleLinkedList(data:  Random().nextInt(100));
        previousNode = previousNode.link;
      }
    }
  }
  
  void traverseSingleLinked(){
    SingleLinkedList? headNode = link;
    if(headNode == null){
      print('Linked List is empty!');
    }else{
      while(headNode!.link != null){
        print('Current Node Data => ${headNode.data}');
        headNode = headNode.link;
      }
      print('Current Node Data => ${headNode.data}');
    }
  }
  
  ///Time complexity of this method in 0(1)
  ///Time complexity of array will be 0(n) because we have shift all elements of arrays
  void addNodeStart({required int data}){
    if(link == null){
      link = SingleLinkedList(data: data);
    }else{
      SingleLinkedList? temp = link;
      link = SingleLinkedList(data: data);
      link!.link = temp;
    }
  }
  
  
  ///Time complexity of this method in 0(n) because we are traversing to the end of linked list
  ///If we do not traverse and store the last node some then add the element at the end then Time Complexity will be 0(1)
  ///For arrays if array has some empty slots then Time complexity will 0(1)
  ///and if arrays is full then Time compexity will be 0(n) because we have to create new array copy all the elements and add new element
  void addNodeEnd({required int data}){
    SingleLinkedList? headNode = link;
    if(headNode == null){
      link = SingleLinkedList(data: data);
    }else{
      while(headNode!.link != null){
        headNode = headNode.link;
      }
      headNode.link = SingleLinkedList(data:  data,);
    }
  }
  
  /// Time complexity of this method is O(n) because will have to traverse n to to add node at particular position
  void addNodeAt({required int position, required int data}){
    SingleLinkedList? headNode = link;
    if(headNode == null){
      link = SingleLinkedList(data: data);
    }else if(position <= 1){
      link = SingleLinkedList(data: data, link: headNode);
    }else{
      position--;
      while(position > 1 && headNode != null && headNode.link != null){
        headNode = headNode.link;
        position--;
      }
      SingleLinkedList? suffixNode = headNode!.link;
      headNode.link = SingleLinkedList(data: data, link: suffixNode);
    }
  }
  
}
