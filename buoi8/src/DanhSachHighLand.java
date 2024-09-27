import java.util.ArrayList;
import java.util.List;
import java.util.OptionalDouble;
import java.util.Scanner;

public class DanhSachHighLand {
    List<HighLand> danhSach;

    public DanhSachHighLand(){
        this.danhSach = new ArrayList<>();
    }

    public void tuyChon(){
        Scanner scanner = new Scanner( System.in);
        while (true) {
            System.out.println("1.Nhap thong tin");
            System.out.println("2.Xuat thong tin");
            System.out.println("3.Tinh loi hay lo");
            System.out.println("4.Thoat");
            System.out.print("---Nhap lua chon: ");
            int key = scanner.nextInt();
            if(key == 1){
                HighLandNDC ndc = new HighLandNDC();
                ndc.nhapThongTin();
                danhSach.add(ndc);
                HighLandNTMK ntmk = new HighLandNTMK();
                ntmk.nhapThongTin();
                danhSach.add(ntmk);
                HighLandNX nx = new HighLandNX();
                nx.nhapThongTin();
                danhSach.add(nx);
            }else if(key == 2){
                for(HighLand danhSach : this.danhSach){
                    danhSach.xuatThongTin();
                }
            }else if(key == 3){
                
            }
        }
    }
}
