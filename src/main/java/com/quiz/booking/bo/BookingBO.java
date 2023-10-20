package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.domain.Booking;
import com.quiz.booking.mapper.BookingMapper;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	// input: name, phoneNumber  output:Booking(null or Booking)
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingMapper.selectBookingByNamePhoneNumber(name, phoneNumber);
		// 최신: 마지막 인덱스
		// mybatis 는 리스트가 비어 있으면 null이 아닌 []로 줌
		if (bookingList.isEmpty()) {
			return null; // null
		}
		
		// 리스트가 비어 있지 않으면 마지막 객체 리턴
		return bookingList.get(bookingList.size() - 1); // Booking
	}
	
	public List<Booking> getBookingList() {
		return bookingMapper.selectBookingList();
	}
	
	public void addBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public void deleteBookingById(int id) {
		bookingMapper.deleteBookingById(id);
	}
}
