public class regularStudent extends Student{
    int attend_per;
    String class_room;
    public regularStudent(int RollNumber, String Name, String Department, char Section, int attend_per, String class_room){
        super(RollNumber, Name, Department, Section);
        this.attend_per = attend_per;
        this.class_room = class_room;
    }

    public void submitAssignment(){
        System.out.println("The student "+Name+" has submitted the assignment.");
    } 

    public void payFee(){
        super.payFee();
        System.out.println("The regular student "+class_room+" has paid the fee + library + class.");
    } 

    public void displayInfo(){
        super.displayInfo();
        System.out.println("The student attendence percentage is "+attend_per);
        System.out.println("The student class room is "+class_room);
        

    } 
}