<%@page import="in.co.air.line.ticket.model.BookModel"%>
<%@page import="in.co.air.line.ticket.util.DataUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.air.line.ticket.bean.BookBean"%>
<%@page import="in.co.air.line.ticket.controller.BookListCtl"%>
<%@page import="in.co.air.line.ticket.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booked Ticket List</title>
</head>
<body>
<%@ include file="Header.jsp"%>

	<form action="<%=ATBView.BOOK_LIST_CTL%>" method="post">
		<div class="container">
			<div class="row">
				<center>
					<h1 style="background-color:Tomato;">booked Ticket</h1>
				</center>

				<hr>
				<div class="col-md-12">

					<div class="table-responsive">

						<table class="table table-bordred table-striped">
							<tr>
								<th>User Name</th>
								<td><input type="text" name="name"
									placeholder="Search By First Name"
									value="<%=ServletUtility.getParameter("name", request)%>"
									class="input-md  textinput textInput form-control"></td>
								<th></th>
								<th>User Email Id</th>
								<td><input type="text" name="emailId"
									placeholder="Search By Email Id"
									value="<%=ServletUtility.getParameter("emailId", request)%>"
									class="input-md  textinput textInput form-control"></td>
								<td><input type="submit"
									class="btn btn-primary btn btn-info" name="operation"
									value="<%=BookListCtl.OP_SEARCH%>"></td>
							</tr>
						</table>
						<center>
							<b><font color="green"><%=ServletUtility.getErrorMessage(request)%></font></b>
							<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>
						</center>
						<table id="mytable" class="table table-bordred table-striped">


							<thead>
								<tr>
									<th>Flight </th>
									<th>User Name</th>
									<th>Mobile Num</th>
									<th>book ticket</th>
									<th>Email address</th>
									<th>Person no.</th>
									<th>Ticket Amount</th>
									<th>Final amount</th>
									
								</tr>
							</thead>
							<tbody>
								<%
									int pageNo = ServletUtility.getPageNo(request);
									int pageSize = ServletUtility.getPageSize(request);
									int index = ((pageNo - 1) * pageSize) + 1;
									BookBean bean = null;
									List list = ServletUtility.getList(request);
									Iterator<BookBean> it = list.iterator();

									while (it.hasNext()) {

										bean = it.next();
								%>
								<tr>
									
									<td><%=bean.getFlightName()%></td>
									<td><%=bean.getFirstName()+" "+bean.getLastName()%></td>
									<td><%=bean.getMobileNo()%></td>
									<td><%=DataUtility.getDateString(bean.getBookDate())%></td>
									<td><%=bean.getEmailId()%></td>
									<td><%=bean.getNoOfPerson()%></td>
									<td><%=bean.getPrice()%></td>
									<td><%=bean.getFinalPrice()%></td>
									
								</tr>
								<%
									}
								%>
							</tbody>

						</table>

						<div class="clearfix"></div>
						<ul class="pagination pull-right">
							<li><input type="submit" name="operation"
								class="btn btn-primary btn btn-info"
								value="<%=BookListCtl.OP_PREVIOUS%>"
								<%=(pageNo == 1) ? "disabled" : ""%>></li>
							
						
							<%
								BookModel model = new BookModel();
							%>
							<li><input type="submit" name="operation"
								class="btn btn-primary btn btn-info"
								value="<%=BookListCtl.OP_NEXT%>"
								<%=((list.size() < pageSize) || model.nextPK() - 1 == bean.getId()) ? "disabled" : ""%>></li>
						</ul>

					</div>

				</div>
			</div>
		</div>
		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">
	</form>
<div style="margin-top: 180px">
	<%@ include file="Footer.jsp"%>
</div>	
</body>
</html>