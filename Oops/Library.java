public class Library {
    String BookName;
    String Author;
    int No_of_pages;
    String Publisher;

    public void IssuedBook(String StudentName){
        System.out.println("The book is issued to " + StudentName);
    }
    public void ReturnBook(String StudentName){
        System.out.println("The book is returned by " + StudentName);
    }
    public void DisplayInfo(){
        System.out.println("Book Name: " + BookName);
        System.out.println("Author: " + Author);
        System.out.println("No of pages: " + No_of_pages);
        System.out.println("Publisher: " + Publisher);
    }
    public static void main(String args[]){
        Library book1 = new Library();
        Library book2 = new Library();
        book1.BookName = "Java Programming";
        book1.Author = "John Doe";
        book1.No_of_pages = 500;
        book1.Publisher = "Tech Books Publishing";
        book1.DisplayInfo();
        book1.IssuedBook("Paras Jain");
        book1.ReturnBook("Paras Jain");
        //   book2.DisplayInfo();

    }   
}
