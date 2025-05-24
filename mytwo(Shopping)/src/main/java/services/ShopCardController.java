package services;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import Goods.Goods;
import Goods.GoodsStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ShopCardController")
public class ShopCardController extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	request.setCharacterEncoding("gbk");
	Object goodsObject = request.getSession().getAttribute("myGoodsList");
	List<Goods> myGoodsList = null;
	if (goodsObject == null){
		myGoodsList = new ArrayList<Goods>();
		request.getSession().setAttribute("myGoodsList", myGoodsList);
		} 
	else{
		myGoodsList =(ArrayList<Goods>) goodsObject;
	}
		String type = request.getParameter("type");
	if ("addCard".equals(type)){
		int id = Integer.parseInt(request.getParameter("id"));
		int number = Integer.parseInt(request.getParameter("number"));
		GoodsStore.goodsList.get(id).setNumber(number);
		myGoodsList.add(GoodsStore.goodsList.get(id));
		
		System.out.print("+1");
		} 
	else if ("removeCard".equals(type)){
		int id = Integer.parseInt(request.getParameter("id"));
		myGoodsList.remove(id);
		
		System.out.print("-1");
		}
	response.sendRedirect("ShopCard");
	
}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
	doGet(request, response);
}
}