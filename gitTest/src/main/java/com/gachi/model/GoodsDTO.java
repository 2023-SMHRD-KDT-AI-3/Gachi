package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsDTO {
	private String goods_id;
	private String goods_name;
	private String goods_brand;
	private int goods_price;
	private int goods_wish;
	private String goods_img;
}
