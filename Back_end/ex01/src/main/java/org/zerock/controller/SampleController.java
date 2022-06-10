package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")  // localhost:8081/sample
@Log4j
public class SampleController {

	 @InitBinder
	 public void initBinder(WebDataBinder binder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,
	 false));
	 }

	@RequestMapping("")   // localhost:8081/sample/
	public void basic() {

		log.info("basic...................");

	}

	@RequestMapping(value = "/basic", method = { RequestMethod.GET, RequestMethod.POST })
	public void basicGet() {   // localhost:8080/sample/basic

		log.info("basic get...................");

	}

	@GetMapping("/basicOnlyGet")
	public void basicGet2() {

		log.info("basic get only get...................");

	}

	@GetMapping("/ex01")  // localhost:8081/sample/ex01?name=pmk&age=25
	public String ex01(SampleDTO dto) { 

		log.info("" + dto);

		return "ex01";
	}

	@GetMapping("/ex02") // localhost:8081/sample/ex02?name=pmk&age=25
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {

		log.info("name: " + name);
		log.info("age: " + age);

		return "ex02";
	}

	@GetMapping("/ex02List")  //localhost:8081/sample/ex02List?ids=111&ids=222&ids=333
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {

		log.info("ids: " + ids);

		return "ex02List";
	}

	@GetMapping("/ex02Array")  //localhost:8081/sample/ex02Array?ids=111&ids=222&ids=333
	public String ex02Array(@RequestParam("ids") String[] ids) {

		log.info("array ids: " + Arrays.toString(ids));

		return "ex02Array";
	}

	@GetMapping("/ex02Bean")  //localhost:8081/sample/ex02Bean?list%5B0%5D.name=pmk&list%5B2%5D.name=bbb
	public String ex02Bean(SampleDTOList list) {

		log.info("list dtos: " + list);

		return "ex02Bean";
	}

	@GetMapping("/ex03")   // localhost:8081/sample/ex03?title=test&dueDate=2022/03/29
	public String ex03(TodoDTO todo) {
		log.info("todo: " + todo);
		return "ex03";
	}
/* ======================================================== */
	@GetMapping("/ex04")  //localhost:8081/sample/ex04?name=pmk&age=25&page=10
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {

		log.info("dto: " + dto);
		log.info("page: " + page);

		return "/sample/ex04";
	}

	@GetMapping("/ex05")
	public void ex05() {
		log.info("/ex05..........");
	}

	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06..........");

		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");

		return dto;
	}

	@GetMapping("/ex07")
	public ResponseEntity<String> ex07() {
		log.info("/ex07..........");

		// {"name": "홍길동"}
		String msg = "{\"name\": \"홍길동\"}";

		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");

		return new ResponseEntity<>(msg, header, HttpStatus.OK);  // 200
	}

	@GetMapping("/exUpload")   // localhost:8081/sample/exUpload
	public void exUpload() {
		log.info("/exUpload..........");
	}

	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {

		files.forEach(file -> {
			log.info("----------------------------------");
			log.info("name:" + file.getOriginalFilename());
			log.info("size:" + file.getSize());

		});
	}

}
