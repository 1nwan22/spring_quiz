package com.quiz.booking.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.booking.domain.Booking;

@Repository
public interface BookingMapper {
	
	public List<Booking> selectBookingByNamePhoneNumber( // 같은 사람이 여러번 할 수 있으므로 리스트에 담는다 or xml에서 최신으로 조건을 걸어도 됨
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
	
	public List<Booking> selectBookingList();
	
	public void insertBooking(
			@Param("name") String name, 
			@Param("date") Date date, 
			@Param("day") int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") String phoneNumber);
	
	public void deleteBookingById(int id);
}
