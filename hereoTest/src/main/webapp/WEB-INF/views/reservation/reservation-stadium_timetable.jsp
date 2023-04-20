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
            <form action="<c:url value='/reservation/stadium/timetable/insert'></c:url>" method="post">	
	            <div class="body form-group">
	                <div class="cell form-control time-num">1게임</div>
	                <div class="cell">
	                    <select id="s_time_time_start" onchange="s_time_select(this)" class="form-control">
	                        <option value="">시작시간</option>
	                        <script>
	                            for (i = 12; i < 48; i++) {
	                                var hour = '';
	                                var min = ':00';
	                            
	                                if ((Math.ceil(i / 2)) < 13) {
	                                    hour = (Math.floor(i / 2));
	                                } else {
	                                    hour = (Math.floor(i / 2));
	                                }
	                                if (i % 2 != 0) {
	                                    min = ':30';
	                                }
	                                document.write('<option value=' + hour + min + '>' + hour + min + '</option>');
	                            }
	                        </script>
	                    </select>
	                </div>
	                <div class="cell">
	                    <select id="s_time_time_end" onchange="s_time_select(this)" class="form-control">
	                        <option value="">종료시간</option>
	                        <script>
	                            for (i = 12; i < 48; i++) {
	                                var hour = '';
	                                var min = ':00';
	                            
	                                if ((Math.ceil(i / 2)) < 13) {
	                                    hour = (Math.floor(i / 2));
	                                } else {
	                                    hour = (Math.floor(i / 2));
	                                }
	                                if (i % 2 != 0) {
	                                    min = ':30';
	                                }
	                                document.write('<option value=' + hour + min + '>' + hour + min + '</option>');
	                            }
	                        </script>
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
    function s_time_select(select) {
        //select 옵션
        var selectedOption = $(select).find('option:selected');
        $('#s_hour').val(selectedOption.val());
        }
                    $(document).ready(function() {
    	//select dropdown 메뉴
    	var startTimeDropdown = $('#s_time_time_start');
    	var endTimeDropdown = $('#s_time_time_end');
    		//dropdown change 함수
    	$(startTimeDropdown).add(endTimeDropdown).on('change', function() {
    		var startTime = $(startTimeDropdown).val();
    		var endTime = $(endTimeDropdown).val();

    		if (startTime && endTime) {
    		var startTimeMinutes = convertTimeToMinutes(startTime);
    		var endTimeMinutes = convertTimeToMinutes(endTime);
    		var differenceInMinutes = endTimeMinutes - startTimeMinutes;
    		var differenceHours = Math.floor(differenceInMinutes / 60);
    		var differenceMinutes = differenceInMinutes % 60;
    		$('#s_hour').val(differenceHours + '시간' + differenceMinutes+'분');
    		}
    	});
    	function convertTimeToMinutes(timeString) {
    		var parts = timeString.split(':');
    		var hours = parseInt(parts[0], 10);
    		var minutes = parseInt(parts[1], 10);
    		return hours * 60 + minutes;
    	}
    	});
    </script>
    
</body>
</html>