package org.zerock.controller;

import java.net.URLEncoder;

import org.junit.Test;

public class EncodeURITest {
	
	@Test
	public void testEncode() throws Exception{
		
		String str = "list[0].name=aaa&list[1].name=BBB&list[2].name=CCC";
		
		
		str = str.replaceAll("\\[", "%5B");
		
		str = str.replaceAll("\\]", "%5D");
		
		
		System.out.println(str);
		
		
	}

}
