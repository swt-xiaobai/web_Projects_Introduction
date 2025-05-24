package services;

import java.io.IOException;
import java.io.PrintWriter;

import Goods.GoodsStore;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/servlet/Goodslist")
public class GoodsList extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	response.setContentType("text/html;charset=gbk");
	PrintWriter out = response.getWriter();
	out.println("<!DOCTYPE HTML>");
	out.println("<HTML>");
	out.println("<HEAD><TITLE>商品列表</TITLE></HEAD>");

	out.println("<BODY>");
	out.println("<a href='ShopCardController?type=cardList'>查看购物车</a >");
	out.println("<table border='1'>");
	out.println("<tr>");
	out.println("<td>商品序号</td>");
	out.println("<td>商品名称</td>");
	out.println("<td>商品价格</td>");
	out.println("<td>购买数量</td>");
	out.println("<td>操作</td>");
	out.println("</tr>");
	
	for (int i = 0; i< 10;i++){
	out.println("<tr><form action='ShopCardController?type=addCard&id="+i+"' method='post'>");
	out.println("<td>"+(i + 1)+"</td>");
	out.println("<td>"+ GoodsStore.goodsList.get(i).getName()+"</td>");
	out.println("<td>"+ GoodsStore.goodsList.get(i).getPrice()+"</td>");
	out.println("<td><input type='text' name='number' value='1'></td>");
	out.println("<td><input type='submit' value='加入购物车'></td>");
	out.println("</form></tr>");
	}
	out.println("</table>");
	out.println("</BODY>");
	out.println("</HTML>");
	out.flush();
	out.close();
}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
doGet(request, response);
}
}