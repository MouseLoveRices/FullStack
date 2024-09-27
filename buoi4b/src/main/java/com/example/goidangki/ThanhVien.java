package com.example.goidangki;

import org.springframework.stereotype.Component;

//import org.springframework.beans.factory.annotation.Autowired;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
@Component
public class ThanhVien {
    // @Autowired
    // private GoiDangKi goiDangKi;
    private final GoiDangKi goiDangKi;

    // public ThanhVien(){
    //     System.out.println("constructor ve thanh vien");
    // }

    // @Autowired
    // public ThanhVien(GoiDangKi a){
    //     this.goiDangKi = a;
    // }
    // co 3 cach de tiem autowired
    // @Autowired
    // public void setGoiDangKi(GoiDangKi goiDangKi){
    //     this.goiDangKi = goiDangKi;
    // }

    public void thongTin(){
        System.out.println("Ten thanh vien: le meo");
        goiDangKi.goiDangKi();
    }

    public void tenThanhVien(){
        System.out.println("Ten Thanh vien: le meo");
    }
}
