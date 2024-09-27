package com.example;

import org.springframework.context.ApplicationContext;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.goidangki.Meo;
// import com.example.goidangki.Basic;
// import com.example.goidangki.GoiDangKi;
import com.example.goidangki.ThanhVien;



@SpringBootApplication
public class Buoi4bApplication {

	public static void main(String[] args) {
		System.out.println("Bat dau chay");		
		ApplicationContext context = SpringApplication.run(Buoi4bApplication.class, args);
		// GoiDangKi g = new Basic();
        // ThanhVien a = new ThanhVien(g);
        // a.thongTin();
		ThanhVien a = context.getBean(ThanhVien.class);
		a.thongTin();
		Meo m = context.getBean(Meo.class);
		m.thongTin();

	}

}
