<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<section class="teammain-main">
		<div class="teammain-leftbox">
			<!-- 지역 리스트 -->
			<div class="left1-nav-container clear-fix">
				<div class="container-region">
					<ul class="list-region clear-fix">
						<li class="item-region">
							<a href="#" class="link-region btn btn-success" role="button" data-local="all">전체</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button" data-local="seoul">서울</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button" data-local="kyungki">경기</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">부산</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">대구</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">인천</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">대전</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">광주</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">울산</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">강원</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">충남</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">충북</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">전남</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">전북</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">경남</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">경북</a>
						</li>
						<li class="item-region">
							<a href="#" class="link-region btn btn-primary" role="button">제주</a>
						</li>

					</ul>
				</div>
				<!-- 지역 리스트 끝 -->
				<div class="group-search-team input-group col-sm-3">
					<input type="text" class="form-control " name="search-team" id="search-team" placeholder="팀 검색">
					<div class="input-group-append">
						<button class="btn btn-success">검색</button>
					</div>
				</div>
			</div>
				<!-- 팀 리스트 -->
			<div class="container-teambox">
				<ul class="list-teambox" id="teamList">
					<c:forEach items="${teamList}" var="team">
						<li class="item-teambox">
							<div class="left-teambox">
								<a href="<c:url value='/team/sep?teamNum=${team.tm_num}'></c:url>" style="background-image: url(/hereoTest/resources/img/team/고양이 로고.png);" class="link-team-select rounded-circle clear-fix">
									<div class="label-team">
										<span class="team-local badge badge-success" data-local="seoul">안양</span> 
										<span class="team-name">${team.tm_name}</span>
									</div>
								</a>
							</div>
							<div class="right-teambox">
								경기 가능 지역 : <span class="possible_local">경기도</span><br>
								다음 경기 일정 : <span class="recently_match">미정</span><br>
								연습 신청 허용 여부 : <span class="match_type">${team.tm_openformatch}</span>
								<button class="show-schedule btn btn-warning">경기 일정 보기</button>
							</div>
						</li>
					</c:forEach>
					
				</ul>
			</div>
			<!-- 팀 리스트 끝 -->
			<div class="team-request">
				<a href="./team-create_team.html" role="button" class="btn btn-dark btn-team-request">팀 신청하기</a>
			</div>
			<!-- 페이지 번호 -->
			<div class="container-pagenation">
				<ul class="pagination justify-content-center">
					<li class="page-item prev"><a href="#" class="page-link">이전</a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item next"><a href="#" class="page-link">다음</a></li>
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 호버 박스 -->
		
	</section>	
	<div class="teammain-rightbox animate__animated animate__backInRight animate__faster" style="display: none;">
		<div class="hover-box">
			<div class="rb-title"><h3><span class="team-name">단또즈</span> 경기 일정</div></h3>
			<div class="rb-schedule">
				<ul class="list-schedule">
					<li class="item-schedule">
						<span class="home_team badge badge-pill badge-primary">팀 단또즈</span> VS 
						<span class="opponent_team badge badge-pill badge-danger">팀 맘모스</span>
						<div class="date-schedule">23-02-18 오전 9시</div>
						<div class="location-schedule">왕십리 사근초등학교</div>
						<a href="#" role="button" class="btn btn-outline-primary">경기 예약 확인 페이지로</a>
					</li>
				</ul>
				
				
			</div>
			
			
			
		</div>

		

	</div>
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
		<script>
			$('.show-schedule').click(function(){
				let teamName = $(this).parents('.item-teambox').find('.team-name').text();
				$('.teammain-rightbox').find('.team-name').text(teamName);
				$('.teammain-rightbox').find('.home_team').text(teamName);
				$('.teammain-rightbox').toggle();
			})
			$(document).ready(function(){
				$("#search-team").on("keyup", function() {
					var value = $(this).val().toLowerCase();
					$("#teamList li").filter(function() {
						$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
					});
				});
			});
			$('.list-region .item-region .link-region').click(function(e){
				e.preventDefault();
				if($(this).data('local')=='all'){
					$('.container-teambox .list-teambox li').show();
				}else{
					let dtValue= $(this).data('local');
					$('.container-teambox .list-teambox li').hide();
					$('.container-teambox .list-teambox li').filter(function(){
						return $(this).find('.team-local').data('local') == dtValue;
					}).show();
				}
			})
		</script>

    