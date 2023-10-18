package com.quiz.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// URL: http://localhost:8080/booking/check-view
	@GetMapping("/check-view")
	public String bookingView() {
		return "booking/checkView";
	}
	
	// URL: http://localhost:8080/booking/list-view
	@GetMapping("/list-view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "booking/listView";
	}
	
	// URL: http://localhost:8080/booking/reservation-view
	@GetMapping("/reservation-view")
	public String bookingReservationView() {
		return "booking/reservationView";
	}
	
	@ResponseBody
	@DeleteMapping("/delete-booking")
	public String deleteBookingById() {
		
	}
	
	
	
}
