<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
      pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pushlet Test</title>
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache">
<base href="<%=request.getContextPath()%>">
</head>
<body>
      <script type="text/javascript" src="script/ajax-pushlet-client.js"></script>
      <div id="guoguo"></div>
      <script type="text/javascript">
          //初始化pushlet客户端
           PL._init();
        //设定运行时显示调试信息，不需要时，直接删掉即可
           PL.setDebug(true);
        //设定监听主题：/guoguo/helloworld，与服务器端的主题完全一致
           PL.joinListen('/trader/pushlet.demo');
        //接收到事件后，显示服务器信息
           function onData(event) {
                 guoguo.innerText=(event.get("hw"));
            }
      </script>
      <p1>Pushlet Test</p1>
</body>
</html>