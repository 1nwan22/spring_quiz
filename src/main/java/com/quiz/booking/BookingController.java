package com.quiz.booking;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 예약 조회 - AJAX 요청
	@ResponseBody // Model 사용 불가(view로 가지 않기 때문)
	@PostMapping("/check")
	public Map<String, Object> bookingCheck(@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		Booking booking = bookingBO.getBookingByNamePhoneNumber(name, phoneNumber);

		// 응답값
		// {"code":400, "error_message":"데이터가 존재하지 않습니다."}
		// {"code":200, "result":booking}
		Map<String, Object> result = new HashMap<>();
		if (booking == null) {
			result.put("code", 400);
			result.put("error_message", "데이터가 존재하지 않습니다.");
		} else {
			result.put("code", 200);
			result.put("result", booking);
		}

		return result;

	}

	// URL: http://localhost:8080/booking/list-view
	@GetMapping("/list-view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "booking/listView";
	}

	// URL: http://localhost:8080/booking/add-view
	@GetMapping("/add-view")
	public String bookingAddView() {
		return "booking/addView";
	}

	@ResponseBody
	@PostMapping("/add")
	public Map<String, Object> addBooking(@RequestParam("name") String name,
			@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date, @RequestParam("day") int day,
			@RequestParam("headcount") int headcount, @RequestParam("phoneNumber") String phoneNumber) {
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);

		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "success");
		return result;
	}

	@ResponseBody
	@DeleteMapping("/delete-booking")
	public Map<String, Object> deleteBookingById(@RequestParam("id") int id) {
		bookingBO.deleteBookingById(id);
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "success");

		return result;
	}

}
