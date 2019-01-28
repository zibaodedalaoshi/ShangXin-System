<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>直接购买</title>
</head>
<body>

<%		
		Object user = session.getAttribute("user");
        String getBalance = "select * from user_message where ACCOUNT='"+user+"'";//从用户数据表中寻找账号
        String[] tempid = request.getParameterValues("productID");
        String[] tempquan = request.getParameterValues("quan");

        
        int[] id = new int[0];
        int num = 0;
        for(String i:tempid){
        	int[] tmpId = new int[num+1];
        	System.arraycopy(id, 0, tmpId, 0, num);
        	tmpId[num] = Integer.parseInt(i);
        	id = tmpId;
        	num++;
        }
        
        num=0;
        int[] quan = new int[0];
        for(String i:tempquan){
        	int[] tmpQuan = new int[num+1];
        	System.arraycopy(quan, 0, tmpQuan, 0, num);
        	tmpQuan[num] = Integer.parseInt(i);
        	quan = tmpQuan;
        	num++;
        }
        
        
		int new_amount;
		int sub_flag = 0;
		
	      //连接数据库的基本操作
	    Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://127.0.0.1:3306/shangxin?serverTimezone=GMT%2B8";
		String usename = "root";
		String psw= "root";
		Connection conn = DriverManager.getConnection(url, usename, psw);
			//获取用户的余额
		    PreparedStatement pStmt_b = conn.prepareStatement(getBalance);
		    ResultSet rsb = pStmt_b.executeQuery();  			
		    rsb.next();
		    double balance = rsb.getDouble(4);
		    //连接商品信息数据库
		    Statement stmt = conn.createStatement();
			
		    
  for(int j=0;j<num;j++){
	 String sql = "select * from product_message where ID='"+id[j]+"'";

	 ResultSet rs = stmt.executeQuery(sql);			
	if(rs.next()){
        int amount = quan[j];
		int pe_id = (int) (Math.random()*1000000);
		String name = rs.getString(2);
		double price = rs.getDouble(3);
		int productID = rs.getInt(1);
		String Submitter = rs.getString(5);
		String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		
		
		if(amount<=rs.getInt(8)){
		if(balance>=price*amount){//判断用户余额是否大于商品价格
			if(!Submitter.equals(user) ){//判断该商品是否是用户自己提交的
	               new_amount = rs.getInt(8)-amount;
				   PreparedStatement tmt = conn.prepareStatement("Insert into personal_order values('" + pe_id + "','" + name + "','" + price + "','" + date + "','" + rs.getString(6) + "','" + Submitter + "','" + user + "','" + amount + "','" + productID + "')");  
		           int rst = tmt.executeUpdate();  //将购买成功的物品提交到个人订单中
		       
		           
		        if (rst != 0){  
		            sub_flag = 1;     
		        	//out.println("<script language='javascript'>alert('购买成功！');window.location.href='index.jsp';</script>");    
		        }
		          else{  
		            sub_flag = 0;     
		        	//out.println("<script language='javascript'>alert('购买失败！');window.location.href='index.jsp';</script>");    
		              }
		        //product_message amount-
		        String sql_u1="Update product_message set ID=?,NAME=?,PRICE=?,TYPE=?,SUB=?,SUBMITTIME=?,REGION=?,AMOUNT=? where ID='"+id[j]+"' ";
		        String sql_u2 = "select * from product_message where ID='"+id[j]+"' ";//更新商品信息，数量
		        Statement stmt2=conn.createStatement();
		        ResultSet r2 = stmt2.executeQuery(sql_u2);
		        PreparedStatement ps = conn.prepareStatement(sql_u1);
		        
		        while(r2.next()){//将所有记录重新写入
		              ps.setInt(1,r2.getInt(1));
		              ps.setString(2, r2.getString(2));
		              ps.setDouble(3, r2.getDouble(3));
		              ps.setString(4, r2.getString(4));
		              ps.setString(5, r2.getString(5));
		              ps.setString(6, r2.getString(6));
		              ps.setString(7, r2.getString(7));
		              ps.setInt(8, new_amount);
		              int i = ps.executeUpdate();//更新操作
		        }
		        //product_message amount=0删除
		        Statement stmt3=conn.createStatement();
		        stmt3.executeUpdate("delete from product_message where AMOUNT="+0);
		        //删除购物车信息
		        String sql_c1="Update personal_cart set ID=?,NAME=?,PRICE=?,AMOUNT=?,SELLER=?,CLIENT=?,PRODUCTID=? where PRODUCTID='"+id[j]+"' AND CLIENT='"+user+"'";
		        String sql_c2 = "select * from personal_cart where PRODUCTID='"+id[j]+"' AND CLIENT='"+user+"'";//更新商品信息，数量-1
		        Statement stmtc=conn.createStatement();
		        ResultSet rc = stmtc.executeQuery(sql_c2);
		        PreparedStatement pc = conn.prepareStatement(sql_c1);
		       
		        while(rc.next()){//将所有记录重新写入
		              pc.setInt(1,rc.getInt(1));
		              pc.setString(2, rc.getString(2));
		              pc.setDouble(3, rc.getDouble(3));
        		      pc.setInt(4, new_amount);
		              pc.setString(5, rc.getString(5));
		              pc.setString(6, rc.getString(6));
		              pc.setInt(7, rc.getInt(7));
		              int ic = pc.executeUpdate();//更新操作
		        }
		        //personal_cart amount=0删除
		        Statement stmtcc=conn.createStatement();
		        stmtcc.executeUpdate("delete from personal_cart where AMOUNT="+0);
		        //更新user_message用户余额
		        double left = balance - price*amount;
		        String sql_b1="Update user_message set ID=?,ACCOUNT=?,PASSWORD=?,BALANCE=?,CITY=?,PHONENUMBER=?,ADDRESS=? where ACCOUNT='"+user+"' ";
		        String sql_b2 = "select * from user_message where ACCOUNT='"+user+"' ";//更新用户信息，余额减少
		        Statement stmt4=conn.createStatement();
		        ResultSet r4 = stmt4.executeQuery(sql_b2);
		        PreparedStatement psb = conn.prepareStatement(sql_b1);
		        while(r4.next()){//将所有记录重新写入
		              psb.setInt(1,r4.getInt(1));
		              psb.setString(2, r4.getString(2));
	       	          psb.setString(3, r4.getString(3));
		              psb.setDouble(4, r4.getDouble(4)-rs.getDouble(3)*quan[j]);
		              psb.setString(5, r4.getString(5));
		              psb.setString(6, r4.getString(6));
		              psb.setString(7, r4.getString(7));
		              int i2 = psb.executeUpdate();//更新操作
		        }
		        //把买了0个的记录删除
		        Statement stmt5=conn.createStatement();
		        stmt5.executeUpdate("delete from personal_order where AMOUNT="+0);
		        
			}
				else{
					sub_flag = 0;	 
					break;
					//out.println("<script language='javascript'>alert('购买失败，该物品为您自己提交的！');window.location.href='index.jsp';</script>"); 
				}
		}
				
				
				else{
					sub_flag = 0;
					break;
					//out.println("<script language='javascript'>alert('购买失败，余额不足，请及时充值！');window.location.href='index.jsp';</script>"); 
			}
	}
		
		else{
			sub_flag = 0;
			break;
			//out.println("<script language='javascript'>alert('购买失败，余额不足，请及时充值！');window.location.href='index.jsp';</script>"); 
	}
				
				
		}
		    
    }
             
  
  
        if(sub_flag==1)
        	out.println("<script language='javascript'>alert('购买成功！');window.location.href='index.jsp';</script>");
        else if(sub_flag==0)
        	out.println("<script language='javascript'>alert('购买失败！');window.location.href='index.jsp';</script>");

				 
				
				
		
	
	%>

</body>
</html>