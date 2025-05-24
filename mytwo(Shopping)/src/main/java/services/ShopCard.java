package services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import Goods.Goods;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ShopCard")
public class ShopCard extends HttpServlet {
private static final long serialVersionUID = 1L;
public ShopCard(){
	super();
// TODO Auto-generated constructor stub
}
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	Object goodsObject =request.getSession().getAttribute("myGoodsList");
	List<Goods>myGoodsList = null;
	if (goodsObject == null){
		myGoodsList = new ArrayList<Goods>();
		request.getSession().getAttribute("myGoodsList");
	} 
	else {
		myGoodsList =(ArrayList<Goods>) goodsObject;
	}
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	out.println("<!DOCTYPE HTML>");
	out.println("<HEAD><TITLE>简易购物车</TITLE></HEAD>");
	out.println("<BODY>");
	out.println("<a href='Goodslist'>继续购物</a>");
	out.println("<HTML>");
	out.println("<table border='1'>");
	out.println("<tr>");
	out.println("<td>商品序号</td>");
	out.println("<td>商品名称</td>");
	out.println("<td>商品单价</td>");
	out.println("<td>购买数量</td>");
	out.println("<td>总价</td>");
	out.println("<td>操作</td>");
	out.println("</tr>");
	for (int i = 0; i< myGoodsList.size();i++){
	Goods goods = myGoodsList.get(i);
	out.println("<tr>");
	out.println("<td>"+(i+ 1)+"</td>");
	out.println("<td>"+ goods.getName()+"</td>");
	out.println("<td>"+ goods.getPrice()+"</td>");
	out.println("<td>"+ goods.getNumber()+"</td>");

	out.println("<td>"+ goods.getPrice()* goods.getNumber()+"</td>");
	out.println("<td><a href='ShopCardController?type=removeCard&id="+i+"'>删除</a ></td>");
	out.println("</tr>");
	
	
	}
	out.println("</table>");
	out.println("</BODY>");
	out.println("</HTML>");
	out.flush();
	out.close();
	System.out.print(myGoodsList.size());
	}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
doGet(request, response);
}
}