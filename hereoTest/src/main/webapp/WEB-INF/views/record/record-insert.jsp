<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/record/record-insert.css?version=2305121629'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<div class="main-container">
		<div class="box-top">
			<div class="top-title">
				<span>${ms.ms_datetime_str } 경기</span>
			</div>
			<div class="box-score">
				<div class="score-borad data1">
					<table class="tbl">
						<thead>
							<tr>
								<th>이닝 시작팀 선택</th>
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
											<option value="9" selected>9 이닝</option>
										</select>
								</th>
								<th>
									총점
								</th>
								
							</tr>
						</thead>
						<tbody>
								<tr>
									
										<td>
											<img class="rounded-circle" src="<c:url value='/files${ms.homeTeam.tm_team_img}'></c:url>" width="30px" height="30px">
											<label for="firstHomeTeam">${ms.homeTeam.tm_name}(Home)</label> <input type="radio" name="homeTeamRadio" id="firstHomeTeam" value="true">
										</td>
									
									<c:forEach begin="0" end="8" varStatus="in">
										<td class="inning-Score a-team" data-inning="${in.count}">
											<input type="text" class="score-input" maxlength="2" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
										</td>
									</c:forEach>
									
									
									<td class="inning-Score a-team total">
										<input type="text" class="score-input total" readonly maxlength="3" value="0">
									</td>
								</tr>
								<tr>
									<td>
										<img class="rounded-circle" src="<c:url value='/files${ms.awayTeam.tm_team_img}'></c:url>" width="30px" height="30px">
										<label for="lastHomeTeam">${ms.awayTeam.tm_name}(Away)</label> <input type="radio" name="homeTeamRadio" id="lastHomeTeam" value="true">
									</td>
									<c:forEach begin="0" end="8" varStatus="in">
										<td class="inning-Score b-team" data-inning="${in.count}">
											<input type="text" class="score-input" maxlength="2" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
										</td>
									</c:forEach>
									
									<td class="inning-Score b-team total">
										<input type="text" class="score-input total" readonly maxlength="3" value="0">
									</td>
										
								</tr>

							
						</tbody>
					</table>
				</div>
				
				
			</div>
				
			<div class="top-box-exceptiongame">
				<div class="exception-box">
					<div class="left-box">
						<!-- <form action="">
							<input type="radio" name="exception-game" class="btn-exceptiongame">콜드승
							<input type="radio" name="exception-game" class="btn-exceptiongame">몰수승(승리팀선택)
							<input type="radio" name="exception-game" class="btn-exceptiongame">양팀몰수패
							<input type="radio" name="exception-game" class="btn-exceptiongame">추첨승(승리팀선택)
							<input type="radio" name="exception-game" class="btn-exceptiongame">기권승(승리팀선택)
						</form> -->
					</div>
				</div>
			</div>
		</div>

		<div class="box-middle">
			<div class="middle-top">
				<div class="home-team" aria-selected="true"><span>홈 : ${ms.homeTeam.tm_name}</span></div>
				<div class="away-team" aria-selected="false"><span>어웨이 : ${ms.awayTeam.tm_name}</span></div>
			</div>
			<div class="recode-guide">
				<table class="table-template">
					<thead>
						<tr>
							<th style="width: 5%">&nbsp;</th>
							<th style="width: 5%"><label><button class="btn-panel btn-out">0</button> 아웃</label></th>
							<th style="width: 6%"><label><button class="btn-panel btn-out" >00</button> 병살</label></th>
							<th style="width: 9%"><label><button class="btn-panel btn-out" >000</button> 삼중살</label></th>
							<th style="width: 7%"><label><button class="btn-panel btn-hit" >1</button> 1루타</label></th>
							<th style="width: 6%"><label><button class="btn-panel btn-hit" >2</button> 2루타</label></th>
							<th style="width: 6%"><label><button class="btn-panel btn-hit" >3</button> 3루타</label></th>
							<th style="width: 7%"><label><button class="btn-panel btn-hit" >4</button> 홈런</label></th>
							<th style="width: 9%"><label><button class="btn-panel btn-run" >5</button> 도루</label></th>
							<th style="width: 9%"><label><button class="btn-panel btn-sacrifice" >6</button> 희생</label></th>
							<th style="width: 8%"><label><button class="btn-panel btn-hrun" >7</button> 출루</label></th>
							<th style="width: 7%"><label><button class="btn-panel btn-eror" >8</button> 실책</label></th>
							<th style="width: 5%"><label><button class="btn-panel btn-exchange" >9</button> 교체</label></th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<label><button class="btn-panel btn-out">01</button>
								삼진</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >031</button>
								투플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >041</button>
								투파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >05</button>
								번트</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >11</button>
								투수안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >272</button>
								좌전2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >372</button>
								좌전3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >474</button>
								좌선홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >568</button>
								1-2도루</label>
							</td>
							<td>
								<label><button class="btn-panel btn-sacrifice" >61</button>
								희생플라이</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hrun" >71</button>
								낫아웃출루</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >81</button>
								야수실책</label>
							</td>
							<td>
								<label><button class="btn-panel btn-exchange" >91</button>
								교체IN</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >021</button>
								투땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >032</button>
								포플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >042</button>
								포파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >06</button>
								직선타</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >12</button>
								포수안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >274</button>
								좌선2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >374</button>
								좌선3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >478</button>
								좌월홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >584</button>
								2-3도루</label>
							</td>
							<td>
								<label><button class="btn-panel btn-sacrifice" >62</button>
								희생번트</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hrun" >72</button>
								볼넷</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >82</button>
								폭투</label>
							</td>
							<td>
								<label><button class="btn-panel btn-exchange" >92</button>
								교체OUT</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >022</button>
								포땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >033</button>
								1플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >043</button>
								1파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >07</button>
								인필드플라이</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >13</button>
								1내야안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >278</button>
								좌월2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >378</button>
								좌월3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >479</button>
								좌중월홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >542</button>
								홈스틸</label>
							</td>
							<td>
								<label><button class="btn-panel btn-sacrifice" >63</button>
								희생파울플라이</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hrun" >73</button>
								고의사구</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >83</button>
								포일</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >023</button>
								1땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >034</button>
								2플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >044</button>
								2파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >091</button>
								낫아웃</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >14</button>
								2내야안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >282</button>
								중전2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >382</button>
								중전3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >488</button>
								중월홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >51</button>
								진루</label>
							</td>
							<td>
								<label><button class="btn-panel btn-sacrifice" >61F</button>
								희생플라이출루</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hrun" >74</button>
								사구</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >84</button>
								보크</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >024</button>
								2땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >035</button>
								3플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >045</button>
								3파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >082</button>
								쓰리번트</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >15</button>
								3내야안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >288</button>
								중월2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >388</button>
								중월3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >497</button>
								우중월홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >52</button>
								주자아웃</label>
							</td>
							<td>
								<label><button class="btn-panel btn-sacrifice" >62B</button>
								희생번트출루</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hrun" >75</button>
								타격방해</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >85</button>
								송구실책</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >025</button>
								3땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >036</button>
								유플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >046</button>
								유파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >093</button>
								타자타구맞음</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >16</button>
								유내야안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >292</button>
								우전2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >392</button>
								우전3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >498</button>
								우선홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >53</button>
								도루아웃</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-hrun" >76</button>
								승부주자</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >86</button>
								포구실책</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >026</button>
								유땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >037</button>
								좌플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >047</button>
								좌파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >094</button>
								수비방해</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >17</button>
								좌안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >296</button>
								우선2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >396</button>
								우선3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >499</button>
								우월홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >54</button>
								견제사</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-hrun" >77</button>
								야수선택</label>
							</td>
							<td>
								<label><button class="btn-panel btn-eror" >87</button>
								주루방해</label>
							</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >027</button>
								좌땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >038</button>
								중풀</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >048</button>
								중파플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >095</button>
								부정타격</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >18</button>
								중안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >298</button>
								우월2</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >398</button>
								우월3</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >4G</button>
								G홈</label>
							</td>
							<td>
								<label><button class="btn-panel btn-run" >55</button>
								런다운</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-hrun" >78</button>
								땅볼출루</label>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >028</button>
								중땅</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >039</button>
								우플</label>
							</td>
							<td>
								<label><button class="btn-panel btn-out" >049</button>
								우파플</label>
							</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-hit" >19</button>
								우안</label>
							</td>
							<td>
								<label><button class="btn-panel btn-hit" >2A</button>
								인정2</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-run" >56</button>
								주자타구맞음</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<label><button class="btn-panel btn-out" >029</button>
								우땅</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-hit" >10</button>
								번트안타</label>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<label><button class="btn-panel btn-run" >57</button>
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
			<button class="btn btn-success btn-save">저장</button>
			
			<div class="btn-box">
				<button class="btn btn-primary btn-playerAdd homePlayer">선수 추가</button>
			</div>
			<!-- 선수 타순 칸 -->
			<div class="box-recode-player home_team">
				<table class="table table-bordered table-player">
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
							<th style="width: 25px;">투구수</th>
							<!-- <th style="width: 25px;">타수</th>
							<th style="width: 25px;">안타</th>
							<th style="width: 25px;">타점</th>
							<th style="width: 25px;">득점</th>
							<th style="width: 25px;">도루</th>
							 --><th style="width: 20px;"></th>
						</tr>
					</thead>
					
					<tbody>
						<tr class="player-record-box ex" hidden>
							<td>
								<select class="hitOrder">
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
									<option value="10">투수</option>
									
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
								<select class="position">
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
								<select class="isSelection">
									<option value="1">선발</option>
									<option value="2">교체</option>
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
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
							</td>
							<!-- <td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >

							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
							
							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >

							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
								
							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
								
							</td> -->
							<td>
								<button class="player-recode-btn btn-delete">X</button>
							</td>
						</tr>
						<tr class="player-record-box">
							<td>
								<select class="hitOrder">
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
									<option value="10">투수</option>
									
								</select>
							
							</td>
							<td>
								<select class="select-player">
									<option class="defaultN" value="0">-선수-</option>
									<c:forEach items="${hTPlayerList}" var="tp" varStatus="ind">
										<c:choose>
											<c:when test="${tp.tp_auth > 1}">
												<option value="${tp.tp_num}" data-baknum="${tp.tp_backnum}">
													<c:forEach items="${hPlayerList}" var="pl">
														<c:if test="${pl.pl_num eq tp.tp_pl_num}">${ind.count}.${pl.me_nickname}(${tp.tp_backnum})</c:if>
													</c:forEach>
												</option>
											</c:when>
											
										</c:choose>
										
								</c:forEach>
								</select>
							</td>
							<td>
								<select class="position">
									<option value="0">-포지션-</option>
									<option value="1">1.투수</option>
									<option value="2">2.포수</option>
									<option value="3">3.1루수</option>
									<option value="4">4.2루수</option>
									<option value="5">5.3루수</option>
									<option value="6">6.유격수</option>
									<option value="7">7.우익수</option>
									<option value="8">8.중견수</option>
									<option value="9">9.좌익수</option>
									<option value="10">지명타자</option>
								</select>
							
							</td>
							<td>
								<select class="isSelection">
									<option value="1">선발</option>
									<option value="2">교체</option>
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
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
							</td>
							<!-- <td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >

							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
							
							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >

							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
								
							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
								
							</td> -->
							<td>
								<button class="player-recode-btn btn-delete">X</button>
							</td>
						</tr>
						
					</tbody>
				</table>
				
			</div>
			<div class="box-recode-player away_team">
				<table class="table table-bordered table-player">
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
						<tr class="player-record-box">
							<td>
								<select class="hitOrder">
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
									<option value="10">투수</option>
									
								</select>
							
							</td>
							<td>
								<select class="select-player">
									<option class="defaultN" value="0">-선수-</option>
									<c:forEach items="${aTPlayerList}" var="tp" varStatus="ind">
										<c:choose>
											<c:when test="${tp.tp_auth > 1}">
												<option value="${tp.tp_num}" data-baknum="${tp.tp_backnum}">
													<c:forEach items="${aPlayerList}" var="pl">
														<c:if test="${pl.pl_num eq tp.tp_pl_num}">${ind.count}.${pl.me_nickname}(${tp.tp_backnum})</c:if>
													</c:forEach>
												</option>
											</c:when>
											
										</c:choose>
										
								</c:forEach>
								</select>
							</td>
							<td>
								<select class="position">
									<option value="0">-포지션-</option>
									<option value="1">1.투수</option>
									<option value="2">2.포수</option>
									<option value="3">3.1루수</option>
									<option value="4">4.2루수</option>
									<option value="5">5.3루수</option>
									<option value="6">6.유격수</option>
									<option value="7">7.우익수</option>
									<option value="8">8.중견수</option>
									<option value="9">9.좌익수</option>
									<option value="10">지명타자</option>
								</select>
							
							</td>
							<td>
								<select class="isSelection">
									<option value="1">선발</option>
									<option value="2">교체</option>
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
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
							</td>
							<!-- <td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >

							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
							
							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >

							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
								
							</td>
							<td>
								<input type="text" class="player-input" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
								
							</td> -->
							<td>
								<button class="player-recode-btn btn-delete">X</button>
							</td>
						</tr>
						
					</tbody>
				</table>
				
			</div>
		</div>
		
	</div>
	
	<script>
	
	
	let homeAway = true;
	let selectedBox;
 	let ms_num = ${ms.ms_num};
	let startTeam ;
	let mr_num;
	
	$('td.inning').on('click', playerClick);
	
	function playerClick(e){
 		if($(this).hasClass('disable'))
 			return;
 		$('td').removeClass('selected');
 		$(this).addClass('selected');
 	}
	
 	/* 오른쪽 클릭시 영역 클리어  */
 	$('td.inning').on("contextmenu", playerClear)
 	function playerClear(e){
 		e.preventDefault();
 		if($(this).hasClass('disable'))
 			return;
 		$(this).html("");
 		/* 나중에 클리어 넣어주기 */
 	}
 	
 	/* 표 밖에서 오른쪽 클릭시 박스 선택 해제 */
 	$('body').not('td.inning').on("contextmenu", playerCancel)
 	
 	function playerCancel(e){
 		e.preventDefault();
 		$('td').removeClass('selected');

 	}
 	
 	
 	/* 버튼 누르면 버튼 정보 출력 */
 	$('.recode-guide .btn-panel').click(inputPlayInfo)
 	
 	function inputPlayInfo(){
 		if($('td.inning.selected .batterbox-event').length>=5){
 			alert('한 이닝의 이벤트는 5개를 초과할 수 없습니다.');
 			return ;
 		}
 		
 		/* 칸에 넣어주는 곳 */
 		let evtNum= $(this).parent().html()
 		$('td.inning.selected').append(evtNum + " ");
 		
 		
 	}
 	
 	
 	let inningEnd = 9;
 	/* 이닝 이벤트 함수 */
 	$('.inningSelector').change(setInnings)
 	
 	function setInnings(){
 		$('td.inning').removeClass('disable');
 		inningEnd = $(this).val();
 		/* 선수 판에 입력 가능 불가능 (새로 생성되는건 따로 처리 필요(아직 안함)) */
 		let inningTd =  $('td.inning').filter(function(){
 			if($(this).data('inning') > inningEnd)
 				return this;
 		})
 		/* 이닝 점수판 만들기 */
 		let iS = $('.tbl .inning-Score');
 		for(let tmp of iS){
 			if($(tmp).data('inning')>inningEnd){
 				$(tmp).find('input').attr('disable', 'true').hide()
 			}else{
 				$(tmp).find('input').removeAttr('disable').show();
 				
 			}
 		}
 		$('.tbl .inning-Score input').on('oninput', function(e){
 			this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
 		})
 		
 		for(let tmp of inningTd){
 			$(tmp).addClass('disable');
 		}
 	}
 	
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
	
	/* 이닝 점수판 계산 */
	$('.inning-Score .score-input').on('change', calScoreBoard);
	function calScoreBoard(){
		let aTeamScore = $('.inning-Score.a-team .score-input').filter(function(){
			if($(this).attr('disable')===undefined&& !$(this).hasClass('total')){
				return this;
			}
		})
		let aTeamTotal = 0;
		for(let tmp of aTeamScore){
			aTeamTotal+= Number($(tmp).val())
		}
		
		$('.inning-Score.a-team .score-input.total').val(aTeamTotal)
		
		let bTeamScore = $('.inning-Score.b-team .score-input').filter(function(){
			if($(this).attr('disable')===undefined&& !$(this).hasClass('total')){
				return this;
			}
		})
		let bTeamTotal = 0;
		for(let tmp of bTeamScore){
			bTeamTotal+= Number($(tmp).val())
		}
		
		$('.inning-Score.b-team .score-input.total').val(bTeamTotal)
	}
	
	
	
	
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
	/* 선수 추가 코드 */
	$('.btn-playerAdd').click(function(e){
		e.preventDefault();
		let exRow = $('.table-player .player-record-box.ex').first().clone().removeAttr('hidden').removeClass('ex');
		if(homeAway){
			$('.box-recode-player.home_team .table-player tbody').append(exRow);
		}else{
			$('.box-recode-player.away_team .table-player tbody').append(exRow);
		}
		$('td.inning').off('contextmenu', playerClear);
		$('td.inning').off('click', playerClick);
		$('.btn-delete').off('click', btnDelete)
		$('td.inning').on('click', playerClick);
		$('td.inning').on('contextmenu', playerClear);
		$('.btn-delete').on('click', btnDelete)
	
	})
	
	/* 선수 행 삭제 코드 */
	$('.btn-delete').click(btnDelete)
	
	function btnDelete(){
		if(confirm('정말 해당 열을 삭제하시겠습니까?'))
			$(this).parent().parent().remove();
	}
	$('.btn-save').click(ajaxPostMatchRecord)
	
	/* 경기 기본 Record 정보 넘기는 메소드 */
	function ajaxPostMatchRecord(){
	
	if($('#firstHomeTeam').is(':checked')){
		startTeam = true;
	}else if($('#lastHomeTeam').is(':checked')){
		startTeam = false;
	}else{
		alert('시작팀을 선택해 주십시오.')
		return ;
	}
	if(!infoChecker()){
		alert('입력되지 않은 정보가 있습니다.');
		return ;
	}
	if(typeof pitcherLiner(true) == 'number' ||typeof pitcherLiner(false)=='number'){
		alert('투수 정보에 오류가 있습니다.');
		return;
	}
		let matchRecordObj = {
				mr_ms_num : ms_num, 
				mr_point_home : $('.inning-Score.a-team.total .score-input.total').val(),
				mr_point_away : $('.inning-Score.b-team.total .score-input.total').val(),
				mr_startteam : startTeam, 
				endInning : inningEnd
		}
		console.log(matchRecordObj);
		ajax("POST", matchRecordObj, '<c:url value="/record/matchRecordPost"></c:url>', function(data){
			if(data.res){
				console.log("matchRecord 데이터 저장");
				mr_num = data.matchRecord.mr_num;
				ajaxPostMatchInning(data);
			}else{
				console.log("matchRecord 데이터 저장 실패");
				return;
			}
		})
		
	}
	/* matchInning 저장 메소드*/
	function ajaxPostMatchInning(data){
		let matchRecord = data.matchRecord;
		let homeTeam = $('.inning-Score.a-team').not('.total').filter(function(){
			if(!$(this).find('input').attr('disable'))
				return this;
		});
		/* 홈팀 보내기 */
		let totalTeamArr = [];
		for(let tmp of homeTeam){
			let tmpObj = {
				mi_inning : $(tmp).data('inning'),
				mi_isfirstlast : startTeam,
				mi_point : Number($(tmp).find('.score-input').val()),
				mi_mr_num : matchRecord.mr_num
			}
			totalTeamArr.push(tmpObj);
			
		}
		/* 어웨이팀 처리 */
		let awayTeam = $('.inning-Score.b-team').not('.total').filter(function(){
			if(!$(this).find('input').attr('disable'))
				return this;
		});
		for(let tmp of awayTeam){
			let tmpObj = {
				mi_inning : $(tmp).data('inning'),
				mi_isfirstlast : !startTeam,
				mi_point : Number($(tmp).find('.score-input').val()),
				mi_mr_num : matchRecord.mr_num
			}
			totalTeamArr.push(tmpObj);
			
		}
		let totalTeamArrStringifyObj = {
				"totalTeamList" : JSON.stringify(totalTeamArr)
		}
		ajaxParam("POST", totalTeamArrStringifyObj, '<c:url value="/record/matchInningPost"></c:url>', function(data){
			/* 여기서 match-participate */
			sendMatchPartcipate();
			clearCurrentMrNumPlayerRecord();
			ajaxPostBatterBoxEvent(data);
		})
		
	}
	/* batterBoxEvent 이벤트 send 메소드 */
	function ajaxPostBatterBoxEvent(data){
		let rstMIList = data.matchInningList;
		/*  */
		let homeTeamBBEvent = $('.box-recode-player.home_team .player-record-box').not('.ex').find('td.inning').filter(function(){
			if($(this).data('inning') <= inningEnd)
				return this;
		})
		let awayTeamBBEvent = $('.box-recode-player.away_team .player-record-box').not('.ex').find('td.inning').filter(function(){
			if($(this).data('inning') <= inningEnd)
				return this;
		})
		let totalBBEvent = [];
		let teamA;
		let teamB;
		if(startTeam){
			firstTeam = homeTeamBBEvent;
			secondTeam = awayTeamBBEvent;
		}else{
			firstTeam = awayTeamBBEvent;
			secondTeam = homeTeamBBEvent;
		}
		for(let tmp of firstTeam){
			let tmpBtn = $(tmp).find('button');
			/* 현재 이닝 */
			let inning = $(tmp).data('inning');
			/* 타순 */
			let hitOrd = $(tmp).parent().find('.hitOrder option:selected').val();
			let currentHitter = $(tmp).parent().find('.select-player option:selected').val();

			let pitcherLine = pitcherLiner(!startTeam);
			/* 현재 이닝의 투수(중 첫번째) */
			let currentPitcher = selectPitcher(pitcherLine, inning);
			/* 해당 tmp에 들어있는 btn 마다 */
			for(let tmptmp of tmpBtn){
				/* 버튼의 값 */
				let btnType = $(tmptmp).text();
				let tmpBBEObj = {
						mb_mi_num : inningNumSelector(data, startTeam, inning),
						hitOrder: hitOrd,
						be_type : btnType,
						mb_mp_hitter_num : currentHitter,
						mb_mp_pitcher_num: currentPitcher
				}
				console.log(tmpBBEObj)

				
				totalBBEvent.push(tmpBBEObj);
			
			}
		}
		for(let tmp of secondTeam){
			let tmpBtn = $(tmp).find('button');
			/* 현재 이닝 */
			let inning = $(tmp).data('inning');
			/* 타순 */
			let hitOrd = $(tmp).parent().find('.hitOrder option:selected').val();
			let currentHitter = $(tmp).parent().find('.select-player option:selected').val();

			let pitcherLine = pitcherLiner(startTeam);
			/* 현재 이닝의 투수(중 첫번째) */
			let currentPitcher = selectPitcher(pitcherLine, inning);
			/* 해당 tmp에 들어있는 btn 마다 */
			for(let tmptmp of tmpBtn){
				/* 버튼의 값 */
				let btnType = $(tmptmp).text();
				let tmpBBEObj = {
						mb_mi_num : inningNumSelector(data, !startTeam, inning),
						hitOrder: hitOrd,
						be_type : btnType,
						mb_mp_hitter_num : currentHitter,
						mb_mp_pitcher_num: currentPitcher
				}
				console.log(tmpBBEObj)
				totalBBEvent.push(tmpBBEObj);
			
			}
		}
		totalBBEvent.sort(function(a, b){
			
			if(a.mb_mi_num != b.mb_mi_num)
				return a.mb_mi_num - b.mb_mi_num;
			
			if(a.hitOrder!=b.hitOrder)
				return a.hitOrder - b.hitOrder;
		})
		if(totalBBEvent.length==0){
			alert('등록된 이벤트가 없습니다.')			
			return;
		}
		totalBBEvent[0].mb_inning_order = 0;
		for(let i = 1; i<totalBBEvent.length; i++){
			if(totalBBEvent[i-1].mb_mi_num == totalBBEvent[i].mb_mi_num){
				totalBBEvent[i].mb_inning_order = totalBBEvent[i-1].mb_inning_order +1; 
			}else{
				totalBBEvent[i].mb_inning_order = 0;
			}
		}
	
		let totalBBEStringifyObj = {
				"totalBBE" : JSON.stringify(totalBBEvent),
				"mr_num" : mr_num
		}
		/* ajax로 BBE보내는 메소드 */
		ajaxParam("POST", totalBBEStringifyObj, '<c:url value="/record/matchBBEPost"></c:url>', function(data){
			console.log(data);
			updateYearRecord()
			
		})
		
	}
	function updateYearRecord(){
		let yObj = {
				mr_num : mr_num
		}
		ajaxParam("POST", yObj, '<c:url value="/record/updateYearRecord"></c:url>', function(data){
			console.log(data);
			
		})
	}
	
	
	
	/* 현재 mr_num의 개인 기록이 있다면 clear 시키는 메소드 */
	function clearCurrentMrNumPlayerRecord(){
		let clearObj ={
				mr_num : mr_num
		}
		ajaxParamAsync("POST", clearObj, '<c:url value="/record/clearCurrentPlayerRecord"></c:url>', function(data){
			console.log(data);
		})
		
	}
	
	
	/* match-partcipate를 입력하는 메소드 추가, 처음에 생각치 못한 메소드라 구현순서 밀려서 꼬인 부분 있음. */
	function sendMatchPartcipate(){
		let totalTeamPartSelection = $('.box-recode-player .player-record-box').not('.ex').filter(function(){
			if($(this).find('.isSelection option:selected').val() ==1)
				return this;
		})
		let totalTeamPart = [];
		/* 인원수 체크는 다른 곳에서 해주기(그 빈 값 체크하는 곳에서 하는게 좋을듯) */
		for(let tmp of totalTeamPartSelection){
			let tmpObj = {
					mp_tp_num:$(tmp).find('.select-player option:selected').val(),
					mp_order:$(tmp).find('.hitOrder option:selected').val(),
					mp_type:'선발',
					mp_po_num: $(tmp).find('.position option:selected').val(),
					mp_inning: 0, 
					mp_mr_num: mr_num
			}
			totalTeamPart.push(tmpObj);
		}
		let totalTeamPartExchangeIn = $('.box-recode-player .player-record-box').not('.ex').filter(function(){
			if($(this).find('.isSelection option:selected').val() ==2)
				return this;
		})
		for(let tmp of totalTeamPartExchangeIn){
			/* 일단 교체 out도 기록한다는 기존의  */
			let excInning = $(tmp).find('button.btn-exchange').filter(function(){
				if($(this).text()==91)
					return this;
			}).parent().data('inning'); 
			let excType ="교체In";
			if(excInning == undefined){
				continue;
			}
			/* 이닝 *3 하는 기믹 일단 포기 */
			let tmpObj = {
					mp_tp_num:$(tmp).find('.select-player option:selected').val(),
					mp_order:$(tmp).find('.hitOrder option:selected').val(),
					mp_type: excType,
					mp_po_num: $(tmp).find('.position option:selected').val(),
					mp_inning: excInning, 
					mp_mr_num: mr_num
			}
			totalTeamPart.push(tmpObj);
			
		}
		let totalTeamPartExchangeOut = $('.box-recode-player .player-record-box').not('.ex');
		for(let tmp of totalTeamPartExchangeOut){
			/* 일단 교체 out도 기록한다는 기존의  */
			
			let excInning = $(tmp).find('button.btn-exchange').filter(function(){
				if($(this).text()==92)
					return this;
			}).parent().data('inning'); 
			let excType ="교체Out";
			if(excInning == undefined){
				continue;
			}
			/* 이닝 *3 하는 기믹 일단 포기 */
			let tmpObj = {
					mp_tp_num:$(tmp).find('.select-player option:selected').val(),
					mp_order:$(tmp).find('.hitOrder option:selected').val(),
					mp_type: excType,
					mp_po_num: $(tmp).find('.position option:selected').val(),
					mp_inning: excInning, 
					mp_mr_num: mr_num
			}
			totalTeamPart.push(tmpObj);
		}
		let teamPartStringifyObj = {
				"teamPart" : JSON.stringify(totalTeamPart),
				"mr_num" : mr_num
		}
		ajaxParamAsync("POST", teamPartStringifyObj, '<c:url value="/record/matchParticipate"></c:url>', function(data1){
			console.log(data1);
			
		})

		
	}
	
	/* 이닝 데이터에서 start팀 값과 inning값 받아서 이닝 num리턴하는 함수 */
	function inningNumSelector(data, isFirstLast, inning){
		let matchInningList = data.matchInningList;
		let inningObj = matchInningList.filter(e=> {
			return e.mi_isfirstlast == isFirstLast && e.mi_inning == inning;
		})
		return inningObj[0].mi_num;
	}
	/* 현재 이닝 피쳐 선택해주는 메소드 */
	function selectPitcher(pitcherLine, inning){
		let inningArr = pitcherLine["inning"+inning];
		let inningPitchers = inningArr.filter(e=>{
			return e.type == '연투'||e.type == '교체In';
		})
		return inningPitchers[0].playerNum;
	}
	
	
	/* 선수 열 값 중 선택하지 않은 값이 있는가 체크 */
	function infoChecker(){
		let allPlayerRow = $('.player-record-box').not('.ex');
		for(let tmp of allPlayerRow){
			if($(tmp).find('.hitOrder option:selected').val()==0)
				return false;
			if($(tmp).find('.select-player option:selected').val()==0)
				return false;
			if($(tmp).find('.position option:selected').val()==0)
				return false;
		}
		return true;
	}
	/* 투수 정보 채우는 메소드 (wh는 홈팀, 어웨이팀 가리는 bool형 인자) */
	function pitcherLiner(wh){
		let tmpStr = wh?'home_team':'away_team';
		let oppoPitcher = $('.player-record-box').not('.ex').filter(function(){
			if($(this).find('.position').find('option:selected').val()==1&& $(this).parents('.box-recode-player').hasClass(""+tmpStr))
				return this;
		})
		if(oppoPitcher==null||oppoPitcher.length==0)
			return -1;
		let pitcherLineObj = {};
		for(let i = 0; i<=inningEnd; i++){
			pitcherLineObj['inning'+i]=[];
		}
		for(let tmp of oppoPitcher){
			if($(tmp).find('.select-player option:selected').val()==0)
				return -1;
			/* 선발투수를 0번째 이닝에 넣어줌. */
			if($(tmp).find('.isSelection option:selected').val()==1){
				pitcherLineObj.inning0.push({
					type: '선발',
					playerNum : $(tmp).find('.select-player option:selected').val()
				})
						
			}
			/* 교체 버튼이 존재할 때 교체 버튼의 종류를 따져 이닝 배열에 선수번호 넣어줌 */
			if($(tmp).find('button.btn-exchange').length!=0){
				let excInning = $(tmp).find('button.btn-exchange').parent().data('inning');
				let excType = $(tmp).find('button.btn-exchange').text()==91?"교체In":"교체Out";
				pitcherLineObj['inning'+excInning].push({
					type : excType,
					playerNum : $(tmp).find('.select-player option:selected').val()
					});
				}
				
			}
		/* 선발 투수 중복인지 따지는 부분 */
		if(isSelectionDup(pitcherLineObj))
			return -2;
		/* 리턴 해주는 부분 */
		fillPitcherList(pitcherLineObj);
		return pitcherLineObj;
				
	}
	/* 투수 리스트 빈 부분 채우기 메소드
		선발을 쫙 세팅, 교체 in을 해당 시점부터 쫙 세팅, 교체 out으로 해당시점부터 쫙 뺌
	*/	
	function fillPitcherList(pitcherLineObj){
		
		/* 일단 선발 세팅 */
		let selectionPNum = pitcherLineObj.inning0[0].playerNum;
		for(let i = 1; i<=inningEnd ; i++){
			pitcherLineObj['inning'+i].push({
				type: "연투",
				playerNum : selectionPNum
			})
		}
		/* 교체 in 세팅 */
		for(let i = 1; i<=inningEnd; i++){
			let inningArr = pitcherLineObj['inning'+i];
			let changeInArr = inningArr.filter(a=>{
				return a.type=="교체In";
			})
			for(let tmp of changeInArr){
				let tmpNum = tmp.playerNum;
				for(let j = i+1; j<=inningEnd; j++){
					pitcherLineObj['inning'+j].push({
						type: "연투",
						playerNum : tmpNum
					})
				}
			}
		}
		for(let i = 1; i<=inningEnd; i++){
			let inningArr = pitcherLineObj['inning'+i];
			let changeOutArr = inningArr.filter(a=>{
				return a.type=="교체Out";
			})
			for(let tmp of changeOutArr){
				let tmpNum = tmp.playerNum;
				for(let j = i; j<=inningEnd; j++){
					pitcherLineObj['inning' + j] = pitcherLineObj['inning' + j].filter(obj => {
				        return obj.type!="연투"||obj.playerNum != tmpNum; 
				      });
				}
			}
			
		}
		return pitcherLineObj;
	}
		
	
			
	/* 선발투수 중복 체크 */
	function isSelectionDup(data){
		if(data.inning0.length!=1)
			return true;
		return false;
	}
	
	
	/* 레거시 코드 */
	$('.box-recode-player.away_team').hide();

	$(function(){
    $('.middle-top .home-team').click(function(){
    	homeAway = true;
 		$('td').removeClass('selected');
        $('.middle-recode-board-away').hide();
        $('.middle-recode-board-home').show();
        $('.box-recode-player.home_team').show();
        $('.box-recode-player.away_team').hide();
        $('.away-team').attr('aria-selected',false);
        $('.home-team').attr('aria-selected',true);
    });

    $('.middle-top .away-team').click(function(){
    	homeAway = false;
 		$('td').removeClass('selected');
        $('.middle-recode-board-home').hide();
        $('.middle-recode-board-away').show();
        $('.box-recode-player.home_team').hide();
        $('.box-recode-player.away_team').show();
        $('.home-team').attr('aria-selected',false);
        $('.away-team').attr('aria-selected',true);
    });

    /* $('.middle-recode-board-away .tbl-addPlayer .btn-addPlayer').click(function(){
        let addPlayerLeft = $('.middle-recode-board-away .substitute-num option:selected').val();
        console.log(addPlayerLeft);
    });
    $('.middle-recode-board-home .tbl-addPlayer .btn-addPlayer').click(function(){
        let addPlayerRight = $('.middle-recode-board-home .recodePlayer5').html();
        $('.middle-recode-board-home .recodePlayer5').append(addPlayerRight);
    }); */
    
    /* // 타석타수안타타점 도루 클릭이벤트
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
    }); */

})
/* 레거시 코드 끝 */	
function ajaxParamAsync(method, obj, url, successFunc, errorFunc){
    	$.ajax({
    		async:true,
    		type: method,
    		data: obj,
    		url: url, 
    		dataType: "json",
    		
    		success: successFunc,
    		error: errorFunc
    		
    	});
    }  
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
	