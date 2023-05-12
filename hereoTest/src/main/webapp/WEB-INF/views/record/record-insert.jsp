<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/record/record-insert.css?version=2305121629'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<%-- <script  type="text/javascript" src="<c:url value='/resources/js/record/record-insert.js'></c:url>"></script>
 --%><div class="main-container">
		<div class="box-top">
			<div class="top-title">
				<span>2022년 02월 27일(월요일) 11:00 / KH야구장 / 1경기</span>
			</div>
			<div class="box-score">
				<div class="score-borad data1">
					<table class="tbl">
						<thead>
							<tr>
								<th>홈팀 선택</th>
								
							</tr>
						</thead>
						<tbody>
							<form action="">
								<tr>
									<td><img class="rounded-circle" src="<c:url value='/files${ms.homeTeam.tm_team_img}'></c:url>" width="30px" height="30px">
									<label for="firstHomeTeam">${ms.homeTeam.tm_name}</label> <input type="radio" name="homeTeamRadio" id="firstHomeTeam" value="true">
									</td>
								</tr>
								<tr>
									<td><img class="rounded-circle" src="<c:url value='/files${ms.awayTeam.tm_team_img}'></c:url>" width="30px" height="30px">
									<label for="lastHomeTeam">${ms.awayTeam.tm_name}</label> <input type="radio" name="homeTeamRadio" id="lastHomeTeam" value="false"></td>
								</tr>

							</form>
						</tbody>
					</table>
				</div>
				<div class="score-borad data2">
					<table class="tbl">
						<thead>
							<tr>
								<form action="">
									<th colspan="9">총 진행 이닝 수
										<select class="inningSelector" >
											<option value="1">1 이닝</option>
											<option value="2">2 이닝</option>
											<option value="3">3 이닝</option>
											<option value="4">4 이닝</option>
											<option value="5">5 이닝</option>
											<option value="6">6 이닝</option>
											<option value="7">7 이닝</option>
											<option value="8">8 이닝</option>
											<option value="9">9 이닝</option>
										</select>
									</th>
									
								</form>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="score-borad data3">
					<table class="tbl">
						<thead>
							<th>R</th>
							<th>H</th>
							<th>E</th>
							<th>B</th>
						</thead>
						<tbody>
							<tr>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>
							<tr>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
				
			<div class="top-box-exceptiongame">
				<div class="exception-box">
					<div class="left-box">
						<form action="">
							<!-- <input type="radio" name="exception-game" class="btn-exceptiongame">콜드승
							<input type="radio" name="exception-game" class="btn-exceptiongame">몰수승(승리팀선택)
							<input type="radio" name="exception-game" class="btn-exceptiongame">양팀몰수패
							<input type="radio" name="exception-game" class="btn-exceptiongame">추첨승(승리팀선택)
							<input type="radio" name="exception-game" class="btn-exceptiongame">기권승(승리팀선택) -->
							<button class="btn-save">저장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="box-middle">
			<div class="middle-top">
				<div class="home-team" aria-selected="false"><span>${ms.homeTeam.tm_name}</span></div>
				<div class="away-team" aria-selected="true"><span>${ms.awayTeam.tm_name}</span></div>
			</div>
			<div class="recode-guide">
				<table class="table-template">
					<thead>
						<tr>
							<th style="width: 5%">&nbsp;</th>
							<th style="width: 5%"><label></label><button class="btn btn-out">0</button> 아웃</label></th>
							<th style="width: 6%"><label><button class="btn btn-out" >00</button> 병살</label></th>
							<th style="width: 9%"><label><button class="btn btn-out" >000</button> 삼중살</label></th>
							<th style="width: 7%"><label><button class="btn btn-hit" >1</button> 1루타</label></th>
							<th style="width: 6%"><label><button class="btn btn-hit" >2</button> 2루타</label></th>
							<th style="width: 6%"><label><button class="btn btn-hit" >3</button> 3루타</label></th>
							<th style="width: 7%"><label><button class="btn btn-hit" >4</button> 홈런</label></th>
							<th style="width: 9%"><label><button class="btn btn-run" >5</button> 도루</label></th>
							<th style="width: 10%"><label><button class="btn btn-sacrifice" >6</button> 희생</label></th>
							<th style="width: 8%"><label><button class="btn btn-hrun" >7</button> 출루</label></th>
							<th style="width: 7%"><label><button class="btn btn-eror" >8</button> 실책</label></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<label><button class="btn btn-out">01</button>
								삼진</label>
							</td>
							<td>
								<label><button class="btn btn-out" >031</button>
								투플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >041</button>
								투파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >05</button>
								번트</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >11</button>
								투수안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >272</button>
								좌전2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >372</button>
								좌전3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >474</button>
								좌선홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >568</button>
								1-2도루</label>
							</td>
							<td>
								<label><button class="btn btn-sacrifice" >61</button>
								희생플라이</label>
							</td>
							<td>
								<label><button class="btn btn-hrun" >71</button>
								낫아웃출루</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >81</button>
								야수실책</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >021</button>
								투땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >032</button>
								포플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >042</button>
								포파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >06</button>
								직선타</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >12</button>
								포수안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >274</button>
								좌선2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >374</button>
								좌선3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >478</button>
								좌월홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >584</button>
								2-3도루</label>
							</td>
							<td>
								<label><button class="btn btn-sacrifice" >62</button>
								희생번트</label>
							</td>
							<td>
								<label><button class="btn btn-hrun" >72</button>
								볼넷</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >82</button>
								폭투</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >022</button>
								포땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >033</button>
								1플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >043</button>
								1파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >07</button>
								인필드플라이</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >13</button>
								1내야안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >278</button>
								좌월2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >378</button>
								좌월3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >479</button>
								좌중월홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >542</button>
								홈스틸</label>
							</td>
							<td>
								<label><button class="btn btn-sacrifice" >63</button>
								희생파울플라이</label>
							</td>
							<td>
								<label><button class="btn btn-hrun" >73</button>
								고의사구</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >83</button>
								포일</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >023</button>
								1땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >034</button>
								2플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >044</button>
								2파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >091</button>
								낫아웃</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >14</button>
								2내야안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >282</button>
								중전2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >382</button>
								중전3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >488</button>
								중월홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >51</button>
								진루</label>
							</td>
							<td>
								<label><button class="btn btn-sacrifice" >61F</button>
								희생플라이출루</label>
							</td>
							<td>
								<label><button class="btn btn-hrun" >74</button>
								사구</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >84</button>
								보크</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >024</button>
								2땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >035</button>
								3플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >045</button>
								3파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >082</button>
								쓰리번트</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >15</button>
								3내야안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >288</button>
								중월2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >388</button>
								중월3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >497</button>
								우중월홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >52</button>
								주자아웃</label>
							</td>
							<td>
								<label><button class="btn btn-sacrifice" >62B</button>
								희생번트출루</label>
							</td>
							<td>
								<label><button class="btn btn-hrun" >75</button>
								타격방해</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >85</button>
								송구실책</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >025</button>
								3땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >036</button>
								유플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >046</button>
								유파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >093</button>
								타자타구맞음</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >16</button>
								유내야안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >292</button>
								우전2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >392</button>
								우전3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >498</button>
								우선홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >53</button>
								도루아웃</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-hrun" >76</button>
								승부주자</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >86</button>
								포구실책</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >026</button>
								유땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >037</button>
								좌플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >047</button>
								좌파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >094</button>
								수비방해</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >17</button>
								좌안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >296</button>
								우선2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >396</button>
								우선3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >499</button>
								우월홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >54</button>
								견제사</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-hrun" >77</button>
								야수선택</label>
							</td>
							<td>
								<label><button class="btn btn-eror" >87</button>
								주루방해</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >027</button>
								좌땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >038</button>
								중풀</label>
							</td>
							<td>
								<label><button class="btn btn-out" >048</button>
								중파플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >095</button>
								부정타격</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >18</button>
								중안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >298</button>
								우월2</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >398</button>
								우월3</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >4G</button>
								G홈</label>
							</td>
							<td>
								<label><button class="btn btn-run" >55</button>
								런다운</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-hrun" >78</button>
								땅볼출루</label>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >028</button>
								중땅</label>
							</td>
							<td>
								<label><button class="btn btn-out" >039</button>
								우플</label>
							</td>
							<td>
								<label><button class="btn btn-out" >049</button>
								우파플</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-hit" >19</button>
								우안</label>
							</td>
							<td>
								<label><button class="btn btn-hit" >2A</button>
								인정2</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-run" >56</button>
								주자타구맞음</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn btn-out" >029</button>
								우땅</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-hit" >10</button>
								번트안타</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn btn-run" >57</button>
								수비방해</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
			<div class="btn-box">
				<button class="btn btn-primary btn-playerAdd homePlayer">선수 추가</button>
			</div>
			<!-- 선수 타순 칸 -->
			<div class="box-recode-player home_team">
				<table class="tbl">
					<thead>
						<tr class="tbl-player-hit">
							<th style="width: 47px;">타순</th>
							<th style="width: 60px;">이름</th>
							<th style="width: 65px;">수비위치</th>
							<th style="width: 35px;">구분</th>
							<th style="width: 65px;">1</th>
							<th style="width: 65px;">2</th>
							<th style="width: 65px;">3</th>
							<th style="width: 65px;">4</th>
							<th style="width: 65px;">5</th>
							<th style="width: 65px;">6</th>
							<th style="width: 65px;">7</th>
							<th style="width: 65px;">8</th>
							<th style="width: 65px;">9</th>
							<th style="width: 25px;">타석</th>
							<th style="width: 25px;">타수</th>
							<th style="width: 25px;">안타</th>
							<th style="width: 25px;">타점</th>
							<th style="width: 25px;">득점</th>
							<th style="width: 25px;">도루</th>
							<th style="width: 20px;"></th>
						</tr>
					</thead>
					
					<tbody>
						<tr class="player1 player-record-box">
							<td>
								<select>
									<option value="0">-타순-</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									
								</select>
							
							</td>
							<td>
								<select class="select-player">
									<option class="defaultN" value="0">-선수-</option>
									<c:forEach items="${hTPlayerList}" var="tp">
										<c:choose>
											<c:when test="${tp.tp_auth > 1}">
												<option value="${tp.tp_num}" data-baknum="${tp.tp_backnum}">
													<c:forEach items="${hPlayerList}" var="pl">
														<c:if test="${pl.pl_num eq tp.tp_pl_num}">${pl.me_nickname}(${tp.tp_backnum})</c:if>
													</c:forEach>
												</option>
											</c:when>
											
										</c:choose>
										
								</c:forEach>
								</select>
							</td>
							<td>
								<select>
									<option value="0">-포지션-</option>
									<option value="1">투수</option>
									<option value="2">포수</option>
									<option value="3">1루수</option>
									<option value="4">2루수</option>
									<option value="5">3루수</option>
									<option value="6">유격수</option>
									<option value="7">우익수</option>
									<option value="8">중견수</option>
									<option value="9">좌익수</option>
									<option value="10">지명타자</option>
								</select>
							
							</td>
							<td>
								<select>
									<option>선발</option>
									<option>교체</option>
								</select>
							</td>
							<td class="inning" data-inning="1"></td>
							<td class="inning" data-inning="2"></td>
							<td class="inning" data-inning="3"></td>
							<td class="inning" data-inning="4"></td>
							<td class="inning" data-inning="5"></td>
							<td class="inning" data-inning="6"></td>
							<td class="inning" data-inning="7"></td>
							<td class="inning" data-inning="8"></td>
							<td class="inning" data-inning="9"></td>
							<td>
								<button class="player-recode-btn btn-pa" >
									<span class="result-pa">0</span>
								</button>
							</td>
							<td>
								<button class="player-recode-btn btn-ab" >
									<span class="result-ab">0</span>
								</button>
							</td>
							<td>
								<button class="player-recode-btn btn-hit" >
									<span class="result-hit">0</span>
								</button>
							</td>
							<td>
								<button class="player-recode-btn btn-rbi">
									<span class="result-rbi">0</span>
								</button>
							</td>
							<td>
								<input class="player-recode-btn" type="text" placeholder="0">
							</td>
							<td>
								<button class="player-recode-btn btn-theft" >
									<span class="result-theft">0</span>
								</button>
							</td>
							<td>
								<button class="btn-delete"></button>
							</td>
						</tr>
						
					</tbody>
				</table>
				
			</div>
		</div>
		<div class="box-bottom">
		</div>
	</div>
	
	<script>
	
	
	
	let selectedBox;
 	$('td.inning').click(function(e){
 		if($(this).hasClass('disable'))
 			return;
 		$('td').removeClass('selected');
 		$(this).addClass('selected');
 	})
 	/* 오른쪽 클릭시 영역 클리어  */
 	$('td.inning').on("contextmenu",function(e){
 		e.preventDefault();
 		if($(this).hasClass('disable'))
 			return;
 		$(this).html("");
 		/* 나중에 클리어 넣어주기 */
 	})
 	
 	/* 표 밖에서 오른쪽 클릭시 박스 선택 해제 */
 	$('body').not('td.inning').on("contextmenu",function(e){
 		e.preventDefault();
 		$('td').removeClass('selected');

 	})
 	
 	
 	/* 버튼 누르면 버튼 정보 출력 */
 	$('.recode-guide .btn').click(function(){
 		console.log($('td.inning.selected .batterbox-event').length)
 		if($('td.inning.selected .batterbox-event').length>=5){
 			alert('한 이닝의 이벤트는 5개를 초과할 수 없습니다.');
 			return ;
 		}
 		
 		/* 칸에 넣어주는 곳 */
 		let evtNum= $(this).html()
 		let Str = '<span class="batterbox-event btn btn-success">'+evtNum+'</span>';
 		$('td.inning.selected').append(Str);
 		
 		
 	})
 	
 	/* 이닝 이벤트 함수 */
 	$('.inningSelector').change(function(){
 		$('td.inning').removeClass('disable');
 		let inningEnd = $(this).val();
 		console.log(inningEnd)
 		let inningTd =  $('td.inning').filter(function(){
 			if($(this).data('inning') > inningEnd)
 				return this;
 		})
 		for(let tmp of inningTd){
 			$(tmp).addClass('disable');
 			$(tmp).text("-");
 		}
 		
 		
 	})
 	
 	let positionMap = new Map();
	positionMap.set(1,"투수"); 
	positionMap.set(2,"포수"); 
	positionMap.set(3,"1루수"); 
	positionMap.set(4,"2루수"); 
	positionMap.set(5,"3루수"); 
	positionMap.set(6,"유격수"); 
	positionMap.set(7,"우익수"); 
	positionMap.set(8,"중견수"); 
	positionMap.set(9,"좌익수"); 
	positionMap.set(10,"지명타자");
	positionMap.set(11,"벤치");
	positionMap.set(12,"내야수");
	positionMap.set(13,"외야수");
	
	/* 선수 라인업 받아오는 부분 */
	 let liObj = {
       	  ms_num : 1
         }
     ajaxParam("POST", liObj, '<c:url value="/team/ajax/sendLineUp"></c:url>', function(data){
		  let homeLine = data.homeLineUp;
		  let awayLine = data.awayLineUp;
		      
		  homeLine.sort((a,b)=>{
		    		return (a.ml_battingorder - b.ml_battingorder)
		  })
		  awayLine.sort((a,b)=>{
		    		return (a.ml_battingorder - b.ml_battingorder)
		  })
		  
     })
	
	
	/* 레거시 코드 */
	
	$(function(){
    $('.home-team span').click(function(){
        $('.middle-recode-board-away').hide();
        $('.middle-recode-board-home').show();
        $('.away-team').attr('aria-selected',false);
        $('.home-team').attr('aria-selected',true);
    });

    $('.away-team span').click(function(){
        $('.middle-recode-board-home').hide();
        $('.middle-recode-board-away').show();
        $('.home-team').attr('aria-selected',false);
        $('.away-team').attr('aria-selected',true);
    });

    $('.middle-recode-board-away .tbl-addPlayer .btn-addPlayer').click(function(){
        let addPlayerLeft = $('.middle-recode-board-away .substitute-num option:selected').val();
        console.log(addPlayerLeft);
    });
    $('.middle-recode-board-home .tbl-addPlayer .btn-addPlayer').click(function(){
        let addPlayerRight = $('.middle-recode-board-home .recodePlayer5').html();
        $('.middle-recode-board-home .recodePlayer5').append(addPlayerRight);
    });
    
    // 타석타수안타타점 도루 클릭이벤트
    var countPa=0;
    var countAb=0;
    var countHit=0;
    var countRbi=0;
    var countTheft=0;
    
    $('.btn-pa').click(function(){
        countPa=countPa+1;
        $(this).find('.result-pa').innerText=countPa;
    });
    $('.btn-ab').click(function(){
        countAb=countAb+1;
        document.querySelector(".result-ab").innerText=countAb;
    });
    $('.btn-hit').click(function(){
        countHit=countHit+1;
        document.querySelector(".result-hit").innerText=countHit;
    });
    $('.btn-rbi').click(function(){
        countRbi=countRbi+1;
        document.querySelector(".result-rbi").innerText=countRbi;
    });
    $('.btn-theft').click(function(){
        countTheft=countTheft+1;
        document.querySelector(".result-theft").innerText=countTheft;
    });

})
/* 레거시 코드 끝 */	

function ajaxParam(method, obj, url, successFunc, errorFunc){
    	$.ajax({
    		async:false,
    		type: method,
    		data: obj,
    		url: url, 
    		dataType: "json",
    		
    		success: successFunc,
    		error: errorFunc
    		
    	});
    }  
 function ajax(method, obj, url, successFunc, errorFunc){
	$.ajax({
		async:false,
		type: method,
		data: JSON.stringify(obj),
		url: url, 
		dataType: "json",
		contentType:"application/json; charset=UTF-8",
		success: successFunc,
		error: errorFunc
		
	});
}
	 
 
 

	</script>
	