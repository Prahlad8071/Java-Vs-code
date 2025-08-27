class Onlineclass extends Student{
    String platform;
    int internetspeed;
    public Onlineclass(int RollNumber, String Name, String Department, char Section, String platform, int internetspeed){
        super(RollNumber, Name, Department, Section);
        this.platform = platform;
        this.internetspeed = internetspeed;

    }

    public void displayInfo(){
        super.displayInfo();
        System.out.println("The student is attending the class on "+platform);
        System.out.println("The student has an internet speed of "+internetspeed+" mbps.");
    }

    
}