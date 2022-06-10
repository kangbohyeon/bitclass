package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {
	// 컴파일 시에 자동으로 setChef() 메소드를 생성. onMethod_ 는 생성된 setChef() 메소드에 @Autowired  어노테이션을 추가
 @Setter(onMethod_ = @Autowired) 
 private Chef chef;
 
 //Chef chef = new Chef();

}

