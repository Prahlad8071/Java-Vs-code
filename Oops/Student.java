// public class Student{
//     // public static void main(String args[]){
//     //     System.out.println("Hello World");
//     int RollNumber;
//     String Name;
//     String Department;
//     char section;
//     static String collegeName = "ABC University";

//     public Student(int rollNumber, String name, String department, char section) {
//         this.RollNumber = rollNumber;
//         this.Name = name;
//         this.Department = department;
//         this.section = section;
//     }

//     public void studying (int No_of_hours){
//         System.out.println("the student is Studying for " + No_of_hours + " hours");
//     }
//     public void playing(){
//         System.out.println("the student is playing");
//     }
//     public void DispalyInfo(){
//         System.out.println("Roll Number: " + RollNumber);
//         System.out.println("Name: " + Name);
//         System.out.println("Department: " + Department);
//         System.out.println("Section: " + section);
//     }
//     public static void main(String args[]){
//         Student student1 = new Student(1,"Rohit", "Computer Science", 'A'  );
//         // Student student2 = new Student();
//         // student1.RollNumber = 20;
//         // student1.Name = "Paras Jain";
//         // student1.Department = "AI";
//         // student1.section = 'C';
//         // student1.DispalyInfo();
//         // student1.playing();
//         // student1.studying(5);
//         // //   student2.DispalyInfo();
//         student1.displayInfo();

//     }
    
// }

// public class Student{
//     int RollNumber;
//      String Name;
//     protected String Department;
//     char Section;
//     static String collegename = "KIET";


//     public Student(int RollNumber, String Name,String Department, char Section){
//         this.RollNumber = RollNumber;
//         this.Name = Name;
//         this.Department = Department;
//         this.Section = Section;
//     } 
//     public Student(){
//         this.RollNumber = 0;
//         this.Name = "unknown";
//         this.Department = "AI";
//         this.Section = 'V';
//     } 


//     public void studying(int No_of_hrs){
//       System.out.println("The student is studying for " + No_of_hrs + " hours.");
//     }
//     public void playing(){
//         System.out.println("The student is playing.");
//     }
//     public void displayInfo(){
//         System.out.println("The student name is "+Name+" And The college name is "+collegename);
//         System.out.println("The student roll number is "+RollNumber);
//         System.out.println("The student department is "+Department);
//         System.out.println("The student section is "+Section);

        
//     }


//     // public static void main(String[] args) {
//     //     Student student1 = new Student(1, "Rohan", "AI", 'C');
//     //     Student student2 = new Student();
//     //     student1.displayInfo();
//     //     Student.collegename = "IIT";
//     //     student1.displayInfo();
//     //     student2.RollNumber = 2;
//     //     student2.Name = "Paras";
//     //     student2.Department = "AI";
//     //     student2.Section = 'D';

//     //     student1.studying(5);
//     //     student1.playing();
//     //     student2.collegename = "NIT";
//     //     student2.displayInfo();

//     // }
// }



// public class Student{
//     int RollNumber;
//      String Name;
//     protected String Department;
//     char Section;
//     static String collegename = "KIET";


//     public Student(int RollNumber, String Name,String Department, char Section){
//         this.RollNumber = RollNumber;
//         this.Name = Name;
//         this.Department = Department;
//         this.Section = Section;
//     } 
//     public Student(){
//         this.RollNumber = 0;
//         this.Name = "unknown";
//         this.Department = "AI";
//         this.Section = 'V';
//     } 


//     public void studying(int No_of_hrs){
//       System.out.println("The student is studying for " + No_of_hrs + " hours.");
//     }
//     public void playing(){
//         System.out.println("The student is playing.");
//     }
//     public void displayInfo(){
//         System.out.println("The student name is "+Name+" And The college name is "+collegename);
//         System.out.println("The student roll number is "+RollNumber);
//         System.out.println("The student department is "+Department);
//         System.out.println("The student section is "+Section);

        
//     }


//     // public static void main(String[] args) {
//     //     Student student1 = new Student(1, "Rohan", "AI", 'C');
//     //     Student student2 = new Student();
//     //     student1.displayInfo();
//     //     Student.collegename = "IIT";
//     //     student1.displayInfo();
//     //     student2.RollNumber = 2;
//     //     student2.Name = "Paras";
//     //     student2.Department = "AI";
//     //     student2.Section = 'D';

//     //     student1.studying(5);
//     //     student1.playing();
//     //     student2.collegename = "NIT";
//     //     student2.displayInfo();

//     // }
// }


/// je date 26 aug 2025 -|>

public class Student{
    int RollNumber;
    String Name;
    public String Department;
    char Section;
    static String collegename = "KIET";


    public Student(int RollNumber, String Name,String Department, char Section){
        this.RollNumber = RollNumber;
        this.Name = Name;
        this.Department = Department;
        this.Section = Section;
    } 
    public Student(){
        this.RollNumber = 0;
        this.Name = "unknown";
        this.Department = "AI";
        this.Section = 'V';
    } 


    public void studying(int No_of_hrs){
      System.out.println("The student is studying for " + No_of_hrs + " hours.");
    }
    public void playing(){
        System.out.println("The student is playing.");
    }
    public void displayInfo(){
        System.out.println("The student name is "+Name+" And The college name is "+collegename);
        System.out.println("The student roll number is "+RollNumber);
        System.out.println("The student department is "+Department);
        System.out.println("The student section is "+Section);
        // System.out.println("the student is " +platform+ " student.");
        // System.out.println("the student internet speed is " +internetspeed+ " mbps.");

        
    }
    public  void payFee(){
        System.out.println("The student"+Name+ " has paid the fee.");

    }


    // public static void main(String[] args) {
    //     Student student1 = new Student(1, "Rohan", "AI", 'C');
    //     Student student2 = new Student();
    //     student1.displayInfo();
    //     Student.collegename = "IIT";
    //     student1.displayInfo();
    //     student2.RollNumber = 2;
    //     student2.Name = "Paras";
    //     student2.Department = "AI";
    //     student2.Section = 'D';

    //     student1.studying(5);
    //     student1.playing();
    //     student2.collegename = "NIT";
    //     student2.displayInfo();

     }




