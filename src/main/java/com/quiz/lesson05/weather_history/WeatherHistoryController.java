package com.quiz.lesson05.weather_history;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.weather_history.bo.WeatherHistoryBO;
import com.quiz.lesson05.weather_history.domain.WeatherHistory;

@RequestMapping("/lesson05/quiz05")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/weather-history-view")
	public String weatherHistoryView(Model model) {
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		return "weather_history/weatherHistory";
	}
	
	@GetMapping("/add-weather-history-view")
	public String addWeatherHistoryView() {
		return "weather_history/addWeatherHistory";
	}
	
//	@PostMapping("/add-weather-history")
//	public String addWeatherHistory(
//			@RequestParam() ) {
//		return "";
//	}
}