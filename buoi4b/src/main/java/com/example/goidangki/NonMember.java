package com.example.goidangki;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
@Primary // primary dung de uu tien bean khi co nhieu bean
public class NonMember implements GoiDangKi{
    @Override
    public void goiDangKi(){
        System.out.println("\nDay la goi non member\n");
    }

    public NonMember(){
        System.out.println("\nconstructor non member\n");
    }
}
