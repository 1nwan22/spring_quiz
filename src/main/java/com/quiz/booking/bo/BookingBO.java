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
	
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		return bookingMapper.selectBookingByNamePhoneNumber(name, phoneNumber);
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
