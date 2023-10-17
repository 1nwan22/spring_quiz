package com.quiz.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;

@RequestMapping("/store")
@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	// URL: http://localhost:8080/store/list-view
	@GetMapping("/list-view")
	public String storeListView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		return "/store/storeList";
	}
	
	@GetMapping("/review-list")
	public String reviewListById(
			@RequestParam("storeId") int storeId,
			Model model) {
		
		return "/store/reviewList";
	}
	
	
}
