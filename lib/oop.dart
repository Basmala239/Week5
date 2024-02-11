class Library {
  String name;
  List<Book> books=[];

  Library(this.name);

  void addBook(Book book){
    books.add(book);
  }

  void removeBook(Book book){
    books.remove(book);
  }

  List<Book> findBooksByAuthor(String author){
    List<Book>b=[];
    for (var book in books) {
      if(book.author == author){
        b.add(book);
      }
    }
    return b;
  }

  List<Book> findAvailableBooks(){
    List<Book>b=[];
    for (var book in books) {
      if(!book.checkedOut){
        b.add(book);
      }
    }
    return b;
  }
}
class Book{
  String title;
  String author;
  String ISBN;
  bool checkedOut=false;
  Book(this.title,this.author,this.ISBN);
  
  void ckeckOut(){
    if(!checkedOut){
      checkedOut=true;
    }else{
      print('not available');
    }
  }
  
  void ckeckIn(){
    if(checkedOut){
      checkedOut=false;
    }else{
      print('already available');
    }
  }
  
}

class Member{
  String name;
  List<Book> booksCheckedOut=[];
  Member(this.name);
  void checkOutBook(Book book){
    book.ckeckOut();
  }
  void returnBook(Book book){
    book.ckeckIn();
  }
} 
