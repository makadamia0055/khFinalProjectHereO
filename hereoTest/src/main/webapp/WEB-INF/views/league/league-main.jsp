<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-main.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/league/league-main.js'></c:url>"></script>

<div class="container-main">
		<div class="box-main-top">
			<div class="main-top-game">
				<div class="section league">
					<div class="select-box">
						<select name="league-name">
							<c:forEach items="${leagueAtt}" var="la">	
								<option value="${la.la_name }">${la.la_name }</option>
							</c:forEach>
						</select>
						<select name="league-type">
							<c:forEach items="${leagueAtt}" var="la">
								<option value="${la.la_match_type }">${la.la_match_type }</option>
							</c:forEach>
						</select>
						<button type="button" class="btn btn-secondary btn-sm mb-1">조회</button>
					</div>
					<div class="attend-team">
						<c:set var = "count" value = "0" />
						<c:forEach items="${leagueParti }" var="lp" varStatus="status">
							<c:if test="${lp.lp_approval == 2 }">
								<c:set var="count" value="${count + 1 }"></c:set>
							</c:if>
						</c:forEach>
								<h2><c:out value="${count}팀"/></h2>
								
						
						<ul>
							<c:forEach items="${leagueParti }" var="lp">
								<c:if test="${lp.lp_approval == 2 }">
									<li>
										<a href="">
											<span><img src="<c:url value='/resources/img/league/kt로고.jpg'></c:url>"></span>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</ul>
						
						<button type="button" class="btn" >리그신청하기</button>
					</div>
				</div>
				<div class="section">
					<div class="section-tab">
						<div class="tab tab-left selected">
							<span>경기일정</span>
						</div>
						<div class="tab tab-right">
							<span>경기결과</span>
						</div>
					</div>
					<div class="article schedule" >
						<div class="list-scroll">
							<ul class="list-game">
								<c:forEach items="${leagueSche}" var="ls">
								<c:if test="${ls.ls_match_state == '경기전' }">
									<li>
										<dl>
											<dt>${ls.ls_match_date_str}</dt>
											<dd>
												<a href="">
													<span class="emblem">
														<img src="<c:url value='/resources/img/league/kt로고.jpg'></c:url>" style="width: 30px;height: 30px;">
													</span>
													<span class="team">${ls.ls_team_a.tm_name }</span>
												</a>
											</dd>
											<dd class="versus">vs</dd>
											<dd>
												<a href="">
													<span class="emblem">
														<img src="<c:url value='/resources/img/league/kt로고.jpg'></c:url>" style="width: 30px;height: 30px;">
													</span>
													<span class="team">${ls.ls_team_b.tm_name }</span>
												</a>
											</dd>
										</dl>
									</li>
								</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="article result">
						<div class="list-scroll">
							<ul class="list-game">
							<c:forEach items="${leagueSche}" var="ls">
							<c:if test="${ls.ls_match_state == '경기후' }">
								<li>
									<dl>
										<dt>${ls.ls_match_date_str}</dt>
										<dd>
											<a href="">
												<span class="emblem">
													<img src="<c:url value='/resources/img/league/kt로고.jpg'></c:url>" style="width: 30px;height: 30px;">
												</span>
												<span class="team">${ls.ls_team_a.tm_name }</span>
												<span class="score">${ls.ls_point_a }</span>
											</a>
										</dd>
										<dd class="versus">vs</dd>
										<dd>
											<a href="">
												<span class="emblem">
													<img src="<c:url value='/resources/img/league/kt로고.jpg'></c:url>" style="width: 30px;height: 30px;">
												</span>
												<span class="team">${ls.ls_team_b.tm_name }</span>
												<span class="score">${ls.ls_point_b}</span>
											</a>
										</dd>
									</dl>
								</li>
							</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
			</div>
				<div class="section team">
					<div class="ranking-title">
						<span>팀 랭킹</span>
					</div>
					<div class="ranking-contents">
						<table class="rank-table">
							<thead>
								<tr>
									<th style="width: 20%;">순위</th>
									<th style="width: 40%;">팀명</th>
									<th style="width: 20%;">경기</th>
									<th style="width: 20%;">승률</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${leagueParti }" var="lp">
								
										<tr>
											<th>등수</th>
											<td>
												<a href="">
													<span class="team">팀이름</span>
												</a>
											</td>
											<td class="gameCount">경기수</td>
											<td>
												<span class="red">승률</span>
											</td>
										</tr>
								
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			
		</div>
	</div>
	
	</div>
<script>
$('.tab-left').click(function(){
	$('.tab-right').removeClass('selected');
	$('.tab-left').addClass('selected');
	$('.article.result').hide();
	$('.article.schedule').show();
});
$('.tab-right').click(function(){
	$('.tab-left').removeClass('selected');
	$('.tab-right').addClass('selected');
	$('.article.schedule').hide();
	$('.article.result').show();
});


//팀랭킹 - ajax 이용

//팀 경기수 

//팀 경기승률 계산

//경기승률 랭킹


</script>

