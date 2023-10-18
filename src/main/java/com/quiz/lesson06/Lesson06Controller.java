package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.Bookmark;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	// http://localhost:8080/lesson06/quiz01/add-bookmark-view
	@GetMapping("/quiz01/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmarkView";
	}
	
	// 즐겨찾기 추가 로직 - AJAX가 하는 요청
	
	@PostMapping("/quiz01/add-bookmark")
	@ResponseBody
	public Map<String, Object> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		// DB insert
		bookmarkBO.addBookmark(name, url);
		
		// 응답값: JSON String
//		{
//			"code":200,
//			"result":"success"
//		}
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "success");
		
		return result; // JSON String
	}
	
	@GetMapping("/quiz01/bookmark-list-view")
	public String bookmarkListView(Model model) {
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		model.addAttribute("bookmarkList", bookmarkList);
		return "lesson06/bookmarkListView";
	}
	
	@ResponseBody
	@PostMapping("/quiz02/is-duplicated-url")
	public Map<String, Object> isDuplicatedUrl(
			@RequestParam("url") String url) {
		
		Bookmark bookmark = bookmarkBO.getBookmarkByUrl(url);
				
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("is_duplication", false);
		if (bookmark != null) {
			result.put("is_duplication", true);
		}
		return result;
	}
	
	@DeleteMapping("/quiz02/delete-bookmark")
	@ResponseBody
	public Map<String, Object> deleteBookmarkById(
			@RequestParam("id") int id) {
		bookmarkBO.deleteBookmarkById(id);
		
		Map<String, Object> result = new HashMap();
		result.put("code", 200);
		result.put("result", "success");
		
		
		return result;
	}
}
