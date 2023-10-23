package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RequestMapping("/lesson07/quiz01")
@RestController
public class Lesson07Quiz01RestController {

	@Autowired
	private CompanyBO companyBO;

	// URL: http://localhost:8080/lesson07/quiz01/save1
	@GetMapping("/save1")
	public CompanyEntity save1() {
		String name = "넥손";
		String business = "컨텐츠 게임";
		String scale = "대기업";
		int headcount = 3585;

		return companyBO.addCompany(name, business, scale, headcount);
	}
	
	// URL: http://localhost:8080/lesson07/quiz01/save2
	@GetMapping("/save2")
	public CompanyEntity save2() {
		
		return companyBO.addCompany("버블팡", "여신 금융업", "대기업", 6834);
	}
	
	// URL: http://localhost:8080/lesson07/quiz01/update
	@GetMapping("/update")
	public CompanyEntity update() {
		return companyBO.updateCompanyScaleHeadcountById(8, "중소기업", 34);
	}
	
	// URL: http://localhost:8080/lesson07/quiz01/delete
	@GetMapping("/delete")
	public String delete() {
		companyBO.deleteCompanyById(8);
		return "수행완료";
	}
	
}
