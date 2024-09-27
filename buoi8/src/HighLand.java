import java.util.Scanner;

public class HighLand {
    protected int ID;
    protected String diaChi;
    protected String name;
    protected double thu;
    protected double chi;

    public HighLand(){

    }


    public HighLand(int iD, String diaChi, String name, double thu, double chi) {
        ID = iD;
        this.diaChi = diaChi;
        this.name = name;
        this.thu = thu;
        this.chi = chi;
    }

    public void nhapThongTin(){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhap ID: ");
        this.ID = scanner.nextInt();
        scanner.nextLine();
        System.out.print("Nhap dia chi: ");
        this.diaChi = scanner.nextLine();
        System.out.println("Nhap tong thu: ");
        this.thu = scanner.nextDouble();
        System.out.println("Nhap tong chi: ");
        this.chi = scanner.nextDouble();
    }

    public void xuatThongTin(){
        System.out.println("id | ten                             | dia chi                | tong thu |  tong chi | ");
        System.out.println(" "+this.ID+"    "+getName()+"           "+this.diaChi+"           "+this.thu+"          "+this.chi);
    }

    public void tinhLoi(){
        double loiNhuan =  this.thu - this.chi;    
        if(loiNhuan>0){
            System.out.println("Chi nhanh loi");
     }  else{
            System.out.println("Chi nhanh lo");
    }
}

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getThu() {
        return thu;
    }



    public void setThu(double thu) {
        this.thu = thu;
    }



    public double getChi() {
        return chi;
    }



    public void setChi(double chi) {
        this.chi = chi;
    }

    
    
}
