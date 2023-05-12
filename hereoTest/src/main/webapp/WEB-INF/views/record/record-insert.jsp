<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/record/record-insert.css?version=2305121629'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/record/record-insert.js'></c:url>"></script>
<div class="main-container">
		<div class="box-top">
			<div class="top-title">
				<span>2022년 02월 27일(월요일) 11:00 / KH야구장 / 1경기</span>
			</div>
			<div class="box-score">
				<div class="score-borad data1">
					<table class="tbl">
						<thead>
							<tr>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<form action="">
								<tr>
									<td><input type="radio" name="team-name" value="home"> home</td>
								</tr>
								<tr>
									<td><input type="radio" name="team-name" value="away"> away</td>
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
									<th><input type="radio" name="inning" value="1"> 1</th>
									<th><input type="radio" name="inning" value="2"> 2</th>
									<th><input type="radio" name="inning" value="3"> 3</th>
									<th><input type="radio" name="inning" value="4"> 4</th>
									<th><input type="radio" name="inning" value="5"> 5</th>
									<th><input type="radio" name="inning" value="6"> 6</th>
									<th><input type="radio" name="inning" value="7"> 7</th>
									<th><input type="radio" name="inning" value="8"> 8</th>
									<th><input type="radio" name="inning" value="9"> 9</th>
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
							<input type="radio" name="exception-game" class="btn-exceptiongame">콜드승
							<input type="radio" name="exception-game" class="btn-exceptiongame">몰수승(승리팀선택)
							<input type="radio" name="exception-game" class="btn-exceptiongame">양팀몰수패
							<input type="radio" name="exception-game" class="btn-exceptiongame">추첨승(승리팀선택)
							<input type="radio" name="exception-game" class="btn-exceptiongame">기권승(승리팀선택)
							<button class="btn-save">저장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="box-middle">
			<div class="middle-top">
				<div class="home-team" aria-selected="false"><span>Baseball</span></div>
				<div class="away-team" aria-selected="true"><span>몬스터즈</span></div>
			</div>
			<div class="recode-guide">
				<table>
					<thead>
						<tr>
							<th style="width: 5%">&nbsp;</th>
							<th style="width: 5%"><button class="btn btn-out">0</button> 아웃</th>
							<th style="width: 6%"><button class="btn btn-out" disabled>00</button> 병살</th>
							<th style="width: 9%"><button class="btn btn-out" disabled>000</button> 삼중살</th>
							<th style="width: 7%"><button class="btn btn-hit" disabled>1</button> 1루타</th>
							<th style="width: 6%"><button class="btn btn-hit" disabled>2</button> 2루타</th>
							<th style="width: 6%"><button class="btn btn-hit" disabled>3</button> 3루타</th>
							<th style="width: 7%"><button class="btn btn-hit" disabled>4</button> 홈런</th>
							<th style="width: 9%"><button class="btn btn-run" disabled>5</button> 도루</th>
							<th style="width: 10%"><button class="btn btn-sacrifice" disabled>6</button> 희생</th>
							<th style="width: 8%"><button class="btn btn-hrun" disabled>7</button> 출루</th>
							<th style="width: 7%"><button class="btn btn-eror" disabled>8</button> 실책</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<button class="btn btn-out" disabled>01</button>
								삼진
							</td>
							<td>
								<button class="btn btn-out" disabled>031</button>
								투플
							</td>
							<td>
								<button class="btn btn-out" disabled>041</button>
								투파플
							</td>
							<td>
								<button class="btn btn-out" disabled>05</button>
								번트
							</td>
							<td>
								<button class="btn btn-hit" disabled>11</button>
								투수안
							</td>
							<td>
								<button class="btn btn-hit" disabled>272</button>
								좌전2
							</td>
							<td>
								<button class="btn btn-hit" disabled>372</button>
								좌전3
							</td>
							<td>
								<button class="btn btn-hit" disabled>474</button>
								좌선홈
							</td>
							<td>
								<button class="btn btn-run" disabled>568</button>
								1-2도루
							</td>
							<td>
								<button class="btn btn-sacrifice" disabled>61</button>
								희생플라이
							</td>
							<td>
								<button class="btn btn-hrun" disabled>71</button>
								낫아웃출루
							</td>
							<td>
								<button class="btn btn-eror" disabled>81</button>
								야수실책
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>021</button>
								투땅
							</td>
							<td>
								<button class="btn btn-out" disabled>032</button>
								포플
							</td>
							<td>
								<button class="btn btn-out" disabled>042</button>
								포파플
							</td>
							<td>
								<button class="btn btn-out" disabled>06</button>
								직선타
							</td>
							<td>
								<button class="btn btn-hit" disabled>12</button>
								포수안
							</td>
							<td>
								<button class="btn btn-hit" disabled>274</button>
								좌선2
							</td>
							<td>
								<button class="btn btn-hit" disabled>374</button>
								좌선3
							</td>
							<td>
								<button class="btn btn-hit" disabled>478</button>
								좌월홈
							</td>
							<td>
								<button class="btn btn-run" disabled>584</button>
								2-3도루
							</td>
							<td>
								<button class="btn btn-sacrifice" disabled>62</button>
								희생번트
							</td>
							<td>
								<button class="btn btn-hrun" disabled>72</button>
								볼넷
							</td>
							<td>
								<button class="btn btn-eror" disabled>82</button>
								폭투
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>022</button>
								포땅
							</td>
							<td>
								<button class="btn btn-out" disabled>033</button>
								1플
							</td>
							<td>
								<button class="btn btn-out" disabled>043</button>
								1파플
							</td>
							<td>
								<button class="btn btn-out" disabled>07</button>
								인필드플라이
							</td>
							<td>
								<button class="btn btn-hit" disabled>13</button>
								1내야안
							</td>
							<td>
								<button class="btn btn-hit" disabled>278</button>
								좌월2
							</td>
							<td>
								<button class="btn btn-hit" disabled>378</button>
								좌월3
							</td>
							<td>
								<button class="btn btn-hit" disabled>479</button>
								좌중월홈
							</td>
							<td>
								<button class="btn btn-run" disabled>542</button>
								홈스틸
							</td>
							<td>
								<button class="btn btn-sacrifice" disabled>63</button>
								희생파울플라이
							</td>
							<td>
								<button class="btn btn-hrun" disabled>73</button>
								고의사구
							</td>
							<td>
								<button class="btn btn-eror" disabled>83</button>
								포일
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>023</button>
								1땅
							</td>
							<td>
								<button class="btn btn-out" disabled>034</button>
								2플
							</td>
							<td>
								<button class="btn btn-out" disabled>044</button>
								2파플
							</td>
							<td>
								<button class="btn btn-out" disabled>091</button>
								낫아웃
							</td>
							<td>
								<button class="btn btn-hit" disabled>14</button>
								2내야안
							</td>
							<td>
								<button class="btn btn-hit" disabled>282</button>
								중전2
							</td>
							<td>
								<button class="btn btn-hit" disabled>382</button>
								중전3
							</td>
							<td>
								<button class="btn btn-hit" disabled>488</button>
								중월홈
							</td>
							<td>
								<button class="btn btn-run" disabled>51</button>
								진루
							</td>
							<td>
								<button class="btn btn-sacrifice" disabled>61F</button>
								희생플라이출루
							</td>
							<td>
								<button class="btn btn-hrun" disabled>74</button>
								사구
							</td>
							<td>
								<button class="btn btn-eror" disabled>84</button>
								보크
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>024</button>
								2땅
							</td>
							<td>
								<button class="btn btn-out" disabled>035</button>
								3플
							</td>
							<td>
								<button class="btn btn-out" disabled>045</button>
								3파플
							</td>
							<td>
								<button class="btn btn-out" disabled>082</button>
								쓰리번트
							</td>
							<td>
								<button class="btn btn-hit" disabled>15</button>
								3내야안
							</td>
							<td>
								<button class="btn btn-hit" disabled>288</button>
								중월2
							</td>
							<td>
								<button class="btn btn-hit" disabled>388</button>
								중월3
							</td>
							<td>
								<button class="btn btn-hit" disabled>497</button>
								우중월홈
							</td>
							<td>
								<button class="btn btn-run" disabled>52</button>
								주자아웃
							</td>
							<td>
								<button class="btn btn-sacrifice" disabled>62B</button>
								희생번트출루
							</td>
							<td>
								<button class="btn btn-hrun" disabled>75</button>
								타격방해
							</td>
							<td>
								<button class="btn btn-eror" disabled>85</button>
								송구실책
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>025</button>
								3땅
							</td>
							<td>
								<button class="btn btn-out" disabled>036</button>
								유플
							</td>
							<td>
								<button class="btn btn-out" disabled>046</button>
								유파플
							</td>
							<td>
								<button class="btn btn-out" disabled>093</button>
								타자타구맞음
							</td>
							<td>
								<button class="btn btn-hit" disabled>16</button>
								유내야안
							</td>
							<td>
								<button class="btn btn-hit" disabled>292</button>
								우전2
							</td>
							<td>
								<button class="btn btn-hit" disabled>392</button>
								우전3
							</td>
							<td>
								<button class="btn btn-hit" disabled>498</button>
								우선홈
							</td>
							<td>
								<button class="btn btn-run" disabled>53</button>
								도루아웃
							</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-hrun" disabled>76</button>
								승부주자
							</td>
							<td>
								<button class="btn btn-eror" disabled>86</button>
								포구실책
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>026</button>
								유땅
							</td>
							<td>
								<button class="btn btn-out" disabled>037</button>
								좌플
							</td>
							<td>
								<button class="btn btn-out" disabled>047</button>
								좌파플
							</td>
							<td>
								<button class="btn btn-out" disabled>094</button>
								수비방해
							</td>
							<td>
								<button class="btn btn-hit" disabled>17</button>
								좌안
							</td>
							<td>
								<button class="btn btn-hit" disabled>296</button>
								우선2
							</td>
							<td>
								<button class="btn btn-hit" disabled>396</button>
								우선3
							</td>
							<td>
								<button class="btn btn-hit" disabled>499</button>
								우월홈
							</td>
							<td>
								<button class="btn btn-run" disabled>54</button>
								견제사
							</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-hrun" disabled>77</button>
								야수선택
							</td>
							<td>
								<button class="btn btn-eror" disabled>87</button>
								주루방해
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>027</button>
								좌땅
							</td>
							<td>
								<button class="btn btn-out" disabled>038</button>
								중풀
							</td>
							<td>
								<button class="btn btn-out" disabled>048</button>
								중파플
							</td>
							<td>
								<button class="btn btn-out" disabled>095</button>
								부정타격
							</td>
							<td>
								<button class="btn btn-hit" disabled>18</button>
								중안
							</td>
							<td>
								<button class="btn btn-hit" disabled>298</button>
								우월2
							</td>
							<td>
								<button class="btn btn-hit" disabled>398</button>
								우월3
							</td>
							<td>
								<button class="btn btn-hit" disabled>4G</button>
								G홈
							</td>
							<td>
								<button class="btn btn-run" disabled>55</button>
								런다운
							</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-hrun" disabled>78</button>
								땅볼출루
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>028</button>
								중땅
							</td>
							<td>
								<button class="btn btn-out" disabled>039</button>
								우플
							</td>
							<td>
								<button class="btn btn-out" disabled>049</button>
								우파플
							</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-hit" disabled>19</button>
								우안
							</td>
							<td>
								<button class="btn btn-hit" disabled>2A</button>
								인정2
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-run" disabled>56</button>
								주자타구맞음
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-out" disabled>029</button>
								우땅
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-hit" disabled>10</button>
								번트안타
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>
								<button class="btn btn-run" disabled>57</button>
								수비방해
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
			<div class="box-recode-player">
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
							<td>1</td>
							<td>이정후(22)</td>
							<td>우익수(RF)</td>
							<td>대수비</td>
							<td>유땅</td>
							<td>좌중월홈</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
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
						<tr>
							<td>1</td>
							<td>이정후(22)</td>
							<td>우익수(RF)</td>
							<td>대수비</td>
							<td>유땅,도루/좌선2,도루</td>
							<td>좌중월홈</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
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
						<tr>
							<td>1</td>
							<td>이정후(22)</td>
							<td>우익수(RF)</td>
							<td>대수비</td>
							<td>유땅</td>
							<td>좌중월홈</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
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
						<tr>
							<td>1</td>
							<td>이정후(22)</td>
							<td>우익수(RF)</td>
							<td>대수비</td>
							<td>유땅</td>
							<td>좌중월홈</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
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