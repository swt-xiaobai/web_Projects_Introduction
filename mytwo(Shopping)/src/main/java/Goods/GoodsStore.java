package Goods;

import java.util.ArrayList;
import java.util.List;

public class GoodsStore {
	public static List<Goods> goodsList = new ArrayList<>();
		static {
		for(int i=0;i<10;i++){
		goodsList.add(new Goods("商品"+(i+1),50+i*10,0));
		}
	}
}