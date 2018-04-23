package com.neusoft.util;

public class SqlUtil {
	public static String getCommonSql () {
		return " case when AKC021 = '21' then '12' when AKC021 = '11' then '13' when AKC021 = '31' then '12' when AKC021 = '32' then '12' when AKC021 = '33' then" +
		          " '12' when AKC021 = '34' then '12' when AKC021 = '35' then '12' when AKC021 = '1' then '13' when AKC021 = '2' then" +
	                " '13' when AKC021 = '4' then '13' when AKC021 = '51' then '13' when AKC021 = '52' then '13' when AKC021 = '53' then" +
			          " '13' when AKC021 = '54' then '13' when AKC021 = '61' then '11' when AKC021 = '62' then '11' when AKC021 = '63' then" +
	                " '11' when AKC021 = '64' then '11' when AKC021 = '65' then '11' else AKC021 end AKC021 ";
	}
}
