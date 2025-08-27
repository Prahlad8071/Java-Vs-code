// import Student;
public class TESTstudent extends Student {
    public static void main(String[] args) {
        Student s1 = new Student(48, "ashu", "AIml", 'h');
       
        TESTstudent obj= new TESTstudent();
        obj.Department = "mecatronics";
        s1.displayInfo();
        // obj.Name="shreyansh";
        // obj.displayInfo();    privwate variable cannot be accessed
        obj.Department = "electrical engineering ";
        obj.displayInfo();


    }
}