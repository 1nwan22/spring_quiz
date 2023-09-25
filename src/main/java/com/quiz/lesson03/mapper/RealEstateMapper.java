package com.quiz.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quiz.lesson03.domain.RealEstate;

public interface RealEstateMapper {

	public RealEstate selectRealEstateById(int id);

	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);

	public List<RealEstate> selectRealEstateListByAreaPrice(
			// @Param 하나의 map이 된다.(파라미터가 2개 이상일 때)
			@Param("area") int area, 
			@Param("price") int price);
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId, 
			@Param("address") String address, 
			@Param("area") int area, 
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("rentPrice") Integer rentPrice);
}
