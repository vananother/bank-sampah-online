<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page errorPage="Error.jsp" %>
<%
    try {
        String s[] = null;

        BankSampahOnlineDB db = new BankSampahOnlineDB();
        ArrayList<String> li = db.getUsers();

        String[] str = new String[li.size()];
        Iterator it = li.iterator();

        int i = 0;
        while (it.hasNext()) {
            String p = (String) it.next();
            str[i] = p;
            i++;
        }

        //jQuery related start
        String query = (String) request.getParameter("q");

        int cnt = 1;
        for (int j = 0; j < str.length; j++) {
            if (str[j].toUpperCase().startsWith(query.toUpperCase())) {
                out.print(str[j] + "\n");
                if (cnt >= 5)// 5=How many results have to show while we are typing(auto suggestions)
                {
                    break;
                }
                cnt++;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

//www.java4s.com
%>