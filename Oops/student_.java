public class Student_{
    // public static void main(String args[]){
    //     System.out.println("Hello World");
    int RollNumber;
    String Name;
    String Department;
    char section;

    public void studying (int No_of_hours){
        System.out.println("the student is Studying for " + No_of_hours + " hours");
    }
    public void playing(){
        System.out.println("the student is playing");
    }
    public void DispalyInfo(){
        System.out.println("Roll Number: " + RollNumber);
        System.out.println("Name: " + Name);
        System.out.println("Department: " + Department);
        System.out.println("Section: " + section);
    }
    public static void main(String args[]){
        Student_ student1 = new Student_();
        Student_ student2 = new Student_();
        student1.RollNumber = 20;
        student1.Name = "Paras Jain";
        student1.Department = "AI";
        student1.section = 'C';
        student1.DispalyInfo();
        student1.playing();
        student1.studying(5);
        //   student2.DispalyInfo();

    }
    
}

