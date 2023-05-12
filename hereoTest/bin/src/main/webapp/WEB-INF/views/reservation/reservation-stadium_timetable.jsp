<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
       *{padding: 0; margin: 0;}
       .stadium-add{
       position: absolute;  left: 20%;  margin-left: 30px;
	   padding: 20px 0 20px 0; box-sizing: border-box; 
	   border-radius: 10px;  margin-top: 150px;
       }
.reserve-table {
display: flex;
flex-direction: column;
border: 1px solid rgba(0, 0, 0, 0.1);
width: 800px;
font-size: 15px;
border-bottom: 0;
}

.body {
display: flex;
border-bottom: 1px solid rgba(0, 0, 0, 0.1);
align-items: center;
}

.header {
display: flex;
font-weight: bold;
background-color: #f0f0f0;
}

.cell {
padding: 5px; text-align: center;
flex: 1; width: calc(16.66666666667%);

}
#s_hour,.reserve-table .body .cell #stadium-price{
    border: 0; text-align: center; background-color: inherit;
    width: 100%;
}
.form-control{
    font-size: 15px; 
}
table {
    border-collapse: collapse;
    margin: 10px 0;
    width: 800px;
}
td {
    border: 1px solid #ddd;
}
th {
    background-color: #ddd;
    padding: 10px;
}
thead tr{
    text-align: center;
}
td {
    padding: 10px;
} 
.time-num{
border:0;}
    </style>
</head>
<body>
    <div class="stadium-add">
        <div class="reserve-table">
            <div class="header">
                <div class="cell header-item">게임</div>
                <div class="cell header-item">시작시간</div>
                <div class="cell header-item">종료시간</div>
                <div class="cell header-item">대관시간</div>
                <div class="cell header-item">대관비용</div>
                <div class="cell header-item">비고</div>
            </div>
            
            <form action="<c:url value='/stadium/timetable/insert'></c:url>" method="post">	
	            <div class="body form-group">
	                <div class="cell form-control time-num">1게임</div>
	                <div class="cell">
                        <select id="start-time" onchange="s_time_select(this)" class="form-control">
                            <option value="">시작시간</option>
                            <option value="06:00">06시00분</option>
                            <option value="06:30">06시30분</option>
                            <option value="07:00">07시00분</option>
                            <option value="07:30">07시30분</option>
                            <option value="08:00">08시00분</option>
                            <option value="08:30">08시30분</option>
                            <option value="09:00">09시00분</option>
                            <option value="09:30">09시30분</option>
                            <option value="10:00">10시00분</option>
                            <option value="10:30">10시30분</option>
                            <option value="11:00">11시00분</option>
                            <option value="11:30">11시30분</option>
                            <option value="12:00">12시00분</option>
                            <option value="12:30">12시30분</option>
                            <option value="13:00">13시00분</option>
                            <option value="13:30">13시30분</option>
                            <option value="14:00">14시00분</option>
                            <option value="14:30">14시30분</option>
                            <option value="15:00">15시00분</option>
                            <option value="15:30">15시30분</option>
                            <option value="16:00">16시00분</option>
                            <option value="16:30">16시30분</option>
                            <option value="17:00">17시00분</option>
                            <option value="17:30">17시30분</option>
                            <option value="18:00">18시00분</option>
                            <option value="18:30">18시30분</option>
                            <option value="19:00">19시00분</option>
                            <option value="19:30">19시30분</option>
                            <option value="20:00">20시00분</option>
                            <option value="20:30">20시30분</option>
                            <option value="21:00">21시00분</option>
                            <option value="21:30">21시30분</option>
                            <option value="22:00">22시00분</option>
                            <option value="22:30">22시30분</option>
                            <option value="23:00">23시00분</option>
                            <option value="23:30">23시30분</option>
                            <option value="24:00">24시00분</option>
                        </select>
                    </div>
	                <div class="cell">
                        <select id="end-time" onchange="s_time_select(this)" class="form-control">
                            <option value="">종료시간</option>
                            <option value="06:00">06시00분</option>
                            <option value="06:30">06시30분</option>
                            <option value="07:00">07시00분</option>
                            <option value="07:30">07시30분</option>
                            <option value="08:00">08시00분</option>
                            <option value="08:30">08시30분</option>
                            <option value="09:00">09시00분</option>
                            <option value="09:30">09시30분</option>
                            <option value="10:00">10시00분</option>
                            <option value="10:30">10시30분</option>
                            <option value="11:00">11시00분</option>
                            <option value="11:30">11시30분</option>
                            <option value="12:00">12시00분</option>
                            <option value="12:30">12시30분</option>
                            <option value="13:00">13시00분</option>
                            <option value="13:30">13시30분</option>
                            <option value="14:00">14시00분</option>
                            <option value="14:30">14시30분</option>
                            <option value="15:00">15시00분</option>
                            <option value="15:30">15시30분</option>
                            <option value="16:00">16시00분</option>
                            <option value="16:30">16시30분</option>
                            <option value="17:00">17시00분</option>
                            <option value="17:30">17시30분</option>
                            <option value="18:00">18시00분</option>
                            <option value="18:30">18시30분</option>
                            <option value="19:00">19시00분</option>
                            <option value="19:30">19시30분</option>
                            <option value="20:00">20시00분</option>
                            <option value="20:30">20시30분</option>
                            <option value="21:00">21시00분</option>
                            <option value="21:30">21시30분</option>
                            <option value="22:00">22시00분</option>
                            <option value="22:30">22시30분</option>
                            <option value="23:00">23시00분</option>
                            <option value="23:30">23시30분</option>
                            <option value="24:00">24시00분</option>
                        </select>
                    </div>
	                <div class="cell">                   
	                        <input name="s_hour" id="s_hour" disabled>
	                </div>
	                <div class="cell"><input type="text" id="stadium-price"></div>
	                <div class="cell"><button class="btn btn-dark">추가</button></div> 
	            </div>
            </form>
        </div>
        <table class="table-bordered" hidden>
			<thead>
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td>구장 사진</td>
					<td><img src="#" width="200"><img src="#" width="200"><img src="#" width="200"></td>
					
				</tr>
				<tr>
					<td>구장명</td>
					<td>화도강변구장 구장</td>
				</tr>
				<tr>
					<td>구장 주소</td>
					<td>경기도 남양주시 화도읍 금남리 160-15</td>
				</tr>
				<tr>
					<td>구장 연락처</td>
					<td>홍길동<br> 010-1234-5678</td>
				</tr>
				<tr>
					<td>시설 사용 규칙(구장 소개)</td>
					<td>이렇게 사용하면 됩니다.</td>
				</tr>
				<tr>
					<td>운영 시간</td>
					<td>오전 9시 ~ 오후 10시</td>
				</tr>
			</tbody>
		</table>
    </div>

    <script type="text/javascript">
	    function s_time_select(elem) {
	    	  var start_time = document.getElementById("start-time").value;
	    	  var end_time = document.getElementById("end-time").value;
		    	  if (start_time && end_time) {
		    	    var start_hour = parseInt(start_time.split(':')[0]);
		    	    var start_minute = parseInt(start_time.split(':')[1]);
		    	    var end_hour = parseInt(end_time.split(':')[0]);
		    	    var end_minute = parseInt(end_time.split(':')[1]);
		    	    var diff_hour = end_hour - start_hour;
		    	    var diff_minute = end_minute - start_minute;
		    	    if (diff_minute < 0) {
		    	      diff_hour--;
		    	      diff_minute += 60;
		    	    }
		    	    var s_hour = Math.floor(diff_hour) + "시간 " + diff_minute + "분";
		    	    document.getElementById('s_hour').value = s_hour;
		    	  }
    	}
    </script>
    
</body>
</html>