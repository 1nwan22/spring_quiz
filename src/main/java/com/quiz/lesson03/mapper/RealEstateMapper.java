package com.quiz.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quiz.lesson03.domain.RealEstate;

public interface RealEstateMapper {

	public RealEstate selectRealEstateById(int id);

	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);

	public List<RealEstate> selectRealEstateListByAreaPrice(@Param("area") Integer area, @Param("price") Integer price);
}
