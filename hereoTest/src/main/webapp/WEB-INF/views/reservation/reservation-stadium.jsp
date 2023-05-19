<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.6.min.js" type="application/javascript"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>    
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium.css'></c:url>" />
<body>
	<div class="booking">	
		<header>
			<h1>예약하기</h1>
		</header>
		<div class="content">
			<form method="post" id="form">
				<section class="reserve_info" style="margin: 0;">
					<ul class="list-content">
						<h2>예약 정보</h2>
						<li class="item-content">
							<span>예약 구장</span>
							<br>
							<input type="text" placeholder="구장이름(출력) 수정X" readonly>
						</li>
						<li class="item-content">
							<span>예약 날짜</span>
							<br>
							<input type="text" name ="ss_game_date" value= "${date}" placeholder="${date}" readonly>
						</li>
						<li class="item-content">
							<span>예약 시간</span>
							<br>
							<input type="text" name="st_start_time" value="${st.st_start_time}"placeholder="${st.st_start_time}시" readonly>
						</li>
						<li class="item-content">
							<span>예약자명</span>
							<br>
							<input type="text" placeholder="${user.me_name}" readonly>
							<input type="hidden" name="rv_me_id" value="${loginUser.me_id}">
						</li>
						<li class="item-content">
							<span>예약자 휴대폰 번호</span>
							<br>
							<input type="text"placeholder="${user.me_tel}" readonly>
						</li>
						
					</ul>
					
					<ul class="list-content">
						<h2>게임 정보</h2>
						<li class="item-content">
							<span>심판 유무</span>
							<div class="">
								<select name="rv_isReferee" id="" >
										<option>심판 유무 선택</option>
										<option value=1>있음</option>
										<option value=0>없음</option>
								</select>
								<br>
								<span class="referee__text" hidden>유무 선택에 따라 총 결제금액이 변동됩니다.</span>
								<br>
							</div>
						</li>
						<li class="item-content">
							<span>기록원 유무</span>
							<div class="">
								<select name="rv_isRecoder" id="">
										<option>기록원 유무 선택</option>
										<option value=1>있음</option>
										<option value=0>없음</option>
								</select>
								<br>
								<span class="clerk__text">유무 선택에 따라 총 결제금액이 변동됩니다.</span>
								<br>
							</div>
						</li>
						<li class="item-content">	
							<div class="match_boxes">
								<span>경기 유형 선택</span>								
									<div class="match_box">
										<select name="rv_game_type">
												<option value>경기 유형 선택</option>	
												<option value="친선">친선</option>
												<option value="연습">연습</option>
										</select>
										<br>
										<span class="league__text" hidden>연습경기는 경기기록에 반영되지 않습니다.</span>
										<br>
									</div>
									<span>상대팀 선택</span>
									<div class="match_box">
										<select name="" id="match">
												<option>상대팀 선택</option>
										</select>
									</div>
							</div>
						</li>	
					</ul>
				</section>
				<section class="pay-price">
					<p>
						<strong style="font-size: 20px;">
							<b>총 결제 금액</b>
						</strong>
					</p>
					<input type="text" placeholder="${st.st_rent_cost}원" readonly>
					<input type="hidden" name="rv_total_price" value="${st.st_rent_cost}">
				</section>		
				<section class="agree">
					<p class="all_check">
						<label>
							<input type="checkbox" name="checkAll" class="check" >
							<span>전체 동의</span>
						</label>
					</p>
					<div class="personal-info info1">
						<label>
							<input type="checkbox" name="checkOne" class="check">
							<a href="#" data-toggle="modal" data-target="#agree1">취소/환불규정(필수)</a>
										<div class="modal" id="agree1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">	
												<div class="modal-header">
													<strong class="modal-title">취소/환불규정 동의</strong>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
													<div class="popup-content">
														<strong>이용 규칙</strong>
														<ul class="list-text">
															<li class="item-text">구장 내 금연/ 지정 장소에서 흡연해주시기 바랍니다.</li> 
															<li class="item-text">제공 이미지는 실제 구장과 다를 수 있습니다.</li> 
															<li class="item-text">고의 및 과실로 인한 시설물 훼손 및 파손시 사용자가 배상함을 원칙으로 합니다.</li> 
															<li class="item-text">주류 반입 불가능 합니다.</li>
															<li class="item-text">위 내용이 지켜지지 않을 경우 환불 없이 퇴장조치 될 수 있으니 예약시 꼭 참고 바랍니다.</li>
														</ul>
														<strong>취소/환불규정</strong>
														<ul class="rule-list">
															<li class="rule-item">환불 규정(대관일정 변경시에도 적용됩니다.)</li>
															<li class="rule-item">[예약일이 일요일인 경우]</li>
															<li class="rule-item">사용예정일 : 당일~1일전 취소불가(환불금 없음) // 토요일 00:01~사용 당일</li>
															<li class="rule-item">사용예정일 : 2일전~3일전 50% 환불 // 목요일 00:01~금요일 24:00</li>
															<li class="rule-item">사용예정일 : 3일전~6일전 70% 환불 // 월요일 00:01~수요일 24:00</li>
															<li class="rule-item">사용예정일 : 7일 100% 환불 // 월요일 00:01~수요일 24:00</li>
															<li class="rule-item">단, 우천 및 폭설 등 천재지변으로 인해 구장사용 불가시 100% 환불해 드립니다.</li>
														</ul>
														<ul class="list-text">
															<li class="item-text">구장 사정에 의해 취소 발생 시 100% 환불이 가능합니다.</li> 
															<li class="item-text">예약 정보에 기재된 취소, 환불 규정을 반드시 확인 후 이용해주시기 바랍니다.</li> 
															<li class="item-text">예약 이후의 취소는 취소/환불 규정에 의거하여 적용됩니다.</li> 
															<li class="item-text">당일 취소는 취소,변경이 불가합니다.</li>
															<li class="item-text">우천 및 폭설 등 천재지변으로 인해 구장사용 불가시 100% 환불해 드립니다.</li> 
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
					</label>
				</div>
				<div class="personal-info info2">
					<label>
						<input type="checkbox" name="checkOne" class="check">
						<a href="#" data-toggle="modal" data-target="#agree2">개인정보 수집 및 이용 동의 (필수)</a>
						<div class="modal" id="agree2">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">	
									<div class="modal-header">
										<strong>개인정보 수집 및 이용 동의 (필수)</strong>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<div class="popup-content">
											<table cellpadding="0" cellspacing="0" class="content-table">
												<tbody>
													<tr>
														<th class="table-top">구분</th>
														<th class="table-top">수집/이용 목적</th>
														<th class="table-top">수집 항목</th>
														<th class="table-top">보유·이용기간</th>
													</tr> 
													<tr >
														<td class="table-mid">필수</td>
														<td class="table-mid">예약/결제 서비스 이용</td>
														<td class="table-mid">- 예약서비스이용:
															<br>예약자이름,휴대폰 번호, CI
															<br>
															<br>- 결제서비스이용: 
															<br>(카드 결제 시)
															<br>카드사명,카드번호,유효기간,이메일
															<br>(휴대폰 결제 시)
															<br>휴대폰 번호, 통신사, 결제 승인번호
															<br>(계좌이체 시)
															<br>은행명, 계좌번호, 예금주
															<br>(현금 영수증 발급 시)
															<br>휴대폰 번호, 이메일
															<br>( 취소·환불을 위한 대급지급 요청시)
															<br>은행명, 계좌번호, 예금주명
															<br>
															<br>
															<div class="">
																- 서비스 이용: 
																<br>
																서비스 이용시간/이용기록, 접수로그,이용컨텐츠, 접속IP정보, 기기모델명,브라우저 정보
															</div>
														</td>
														<td class="table-mid">
															<b>전자상거래 상 소비자 보호에 관한 법률에 따라 5년간 보관</b>
														</td>
													</tr>
												</tbody>
											</table>
											<ul class="list-text text2">
												<li class="item-text2">
												※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.
												</li>
												<li class="item-text2">
												※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</label>
				</div>
				<div class="personal-info info3">
					<label>
						<input type="checkbox" name="checkOne" class="check">
						<a href="#" data-toggle="modal" data-target="#agree3">개인정보 제 3자 제공 동의 (필수)</a>
						<div class="modal" id="agree3">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">	
									<div class="modal-header">
										<strong>개인정보 제 3자 제공 동의 (필수)</strong>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<div class="popup-content">
											<table cellpadding="0" cellspacing="0" class="content-table">
												<tbody>
													<tr>
														<th class="table-top" style="width: 25%;">제공받는 자</th>
														<th class="table-top" style="width: 25%;">제공 목적</th>
														<th class="table-top" style="width: 25%;">제공하는 항목</th>
														<th class="table-top" style="width: 25%;">제공받는 자의 개인정보 보유 및 이용기간</th>
													</tr>
													<tr>
														<td class="table-mid">
															<b style="text-decoration: none;">Hero O</b>
														</td>
														<td class="table-mid">
															<b style="text-decoration: none;">구장예약서비스 이용계약 이행
																<br>
																(서비스 제공, 확인, 이용자 정보 확인)
															</b>
														</td>
														<td class="table-mid">
															예약한 서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약한 구장명, 결제금액)
														</td>
														<td class="table-mid">
															<b style="text-decoration: none;">예약서비스 제공 완료 후 6개월</b>
														</td>
													</tr>
													<!---->
													<tr>
														<td class="table-mid">
															<b style="text-decoration: none;">Hero O</b>
														</td>
														<td class="table-mid">
															<b style="text-decoration: none;">OTA 상품 공급 및 예약관리/통지서비스</b>
														</td>
														<td class="table-mid">
															예약정보 (이름/휴대전화번호)
														</td>
														<td class="table-mid">
															<b style="text-decoration: none;">예약서비스 제공 완료 후 6개월</b>
														</td>
													</tr>
												</tbody>
											</table>
											<ul class="list-text text2">
												<li class="item-text2">
												※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.
												</li>
												<li class="item-text2">
												※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</label>
				</div>
			</section>
			<div class="booking-btn">
				<button class="btn-reservation" type="button">예약하기</button>
			</div>
			<input type="hidden" name="st_num" value="${st.st_num}"/>
		</form>	
		</div>			
	</div>
	<script src="../reservation/matchselect.js"></script>
	<script>
	let receipt_id = null;
		// 전체 동의 체크 
		$(document).ready(function() {
			$('input[name="checkAll"]').click(function() {
				$('input[name="checkOne"]').prop('checked', $(this).prop('checked'));
				});
		});
		$(document).ready(function(){
			$('select[name="referee"]').click(function(){
				$('.clerk__text').show();
			})
		})
		//ajax로 폼태그 보내기
		

		$('.btn-reservation').on("click",function(){
			var reservationForm = $("#form").serialize();
			var st_num = $('input[name=st_num]').val();
			var date=$('input[name=ss_game_date]').val();

			$.ajax({
			
				asyn:true,
				type:'post',
				url:'<c:url value="/reservation/payment_info"></c:url>' + '?st_num=' + st_num +'&date='+date,
				dataType:"json",
				data:reservationForm,
				success : function(data){

					var reserve = data.reserve;
					var user=data.user;
					var msg=data.msg;
					var url=data.url;

					if (msg.trim()!=='' && url.trim()!==''){
						alert(msg);
						 window.location.href='<%= request.getContextPath() %>'+url;
					}
					BootPay.request({
						
						price: reserve.rv_total_price, 
						application_id: "6450af6d755e27001b375f47",
						name: '구장 예약', 
						pg: 'kcp',
						method: 'card', 
						show_agree_window: 0, 
						user_info: {
							username: user.me_id,
							email: user.me_mail,
							addr: 'x',
							phone: user.me_tel
						},
						order_id: reserve.rv_num
					}).error(function (data) {
						//결제 진행시 에러가 발생하면 수행됩니다.
						console.log(data);
					}).cancel((data)=>cancelBootPay(data, reserve)
						).confirm(function (data) {
						var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
							$.ajax({
								  asyn:false,
								  url: '<c:url value="/reservation/checkBootPay"></c:url>',  
								  method: "POST", 
								  data: JSON.stringify({
							            reserve: reserve,
							            enable: enable
							        }),
								  contentType:"application/json; charset=UTF-8",
								  success: function(data){
									  enable=data
								  }
							});

						if (enable) {
							BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
						} else {
							BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
						}
					}).close(function (data) {
					    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
					    console.log(data);
					}).done(function (data) {
						//결제가 정상적으로 완료되면 수행됩니다
						//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
						$.ajax({
							  asyn:true,
							  url: '<c:url value="/reservation/bootPay"></c:url>',  // 서버 URL
							  method: "POST",          // 요청 방식 (GET, POST 등)
							  data: {
								  rv_num : data.order_id,
								  receipt_id : data.receipt_id
							  },
							  success: function(response) {
								  alert("결제가 완료되었습니다.")
								  window.location.href='<%= request.getContextPath() %>'+ response;
							  },
							  error: function(xhr, status, error) {

							    console.log("AJAX 요청 실패: " + error);
							  }
							});
				
					});
			 }})
		 })

			function cancelBootPay(data,reserve) {					
				$.ajax({
					  asyn:true,
					  url: '<c:url value="/reservation/cancelBootPay"></c:url>',  
					  method: "POST", 
					  data: JSON.stringify(reserve),
					  contentType:"application/json; charset=UTF-8"
				});
			}
	</script>
</body>