package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.domain.Bookmark;
import com.quiz.lesson06.mapper.BookmarkMapper;

@Service
public class BookmarkBO {
	@Autowired
	private BookmarkMapper bookmarkMapper;
	
	public void addBookmark(String name, String url) {
		bookmarkMapper.insertBookmark(name, url);
	}
	
	public List<Bookmark> getBookmarkList() {
		return bookmarkMapper.selectBookmarkList();
	}
	
	// input:url output:Bookmark(단건이거나 null이거나)
	// Too many result error => 단건으로 리턴하지만 결과는 List로 나왔을 때
	// 중복은 배제한 코드
	// 재활용 가능한 코드
	public Bookmark getBookmarkByUrl(String url) {
		
		return bookmarkMapper.selectBookmarkByUrl(url);
	}
	
	public void deleteBookmarkById(int id) {
		bookmarkMapper.deleteBookmarkById(id);
	}
}
