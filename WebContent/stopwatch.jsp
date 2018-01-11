<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#time_out {
	border: 1px solid #dedede;
	width: 600px;
	height: 250px;
	line-height: 250px;
	color: #666;
	font-size: 100px;
	text-align: center;
}
</style>
</head>
<script>
	var timer, i = 0, divide = 100, flag = true;

	function start() {
		if (flag) {
			timer = self.setInterval('increment()', (1000 / divide));
			flag = false;
		}

	}
	function increment() {
		i++;
		document.getElementById('time_out').innerHTML = setTime(i/divide);

	}
	function stop() {
		if (!flag) {
			clearInterval(timer);
			timer = null;
			flag = true;
		}
	}
	function reset() {
		stop();
		i = 0;
		document.getElementById('time_out').innerHTML="00:00:00";

	}
	function setTime(t) {

		var hour,min,sec;

		hour = Math.floor(t / 3600);
		min = Math.floor((t - (hour * 3600)) / 60);
		sec = t - (hour * 3600) - (min * 60);

		if (hour < 10)
			hour = "0" + hour;
		if (min < 10)
			min = "0" + min;
		if (sec < 10)
			sec = "0" + sec;
		return (hour + ":" + min + ":" + sec);

	} 

</script>
<body>
	<span id="time_out">00:00:00</span>
	<br>
	<br>
	<button id="start_timer" onclick="start()">시작</button>
	<button id="stop_timer" onclick="stop()">정지</button>
	<button id="reset_timer" onclick="reset()">Reset</button>
	<br>
	<input type="button" onclick="start()" value="시작">
	<input type="button" onclick="stop()" value="정지">
	<input type="button" onclick="reset()" value="Reset">
</body>
</html>