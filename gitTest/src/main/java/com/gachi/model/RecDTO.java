package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecDTO {

	private int rec_id;
	private int goods_id;
	private String user_id;
}
