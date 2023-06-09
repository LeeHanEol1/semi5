<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map.Entry, java.util.Iterator, com.kh.mainPage.model.vo.Cafe,
    java.util.ArrayList, java.util.LinkedHashMap,
    com.kh.mainPage.model.vo.*, com.kh.member.model.vo.Member"%>
    <%
    	LinkedHashMap<String, Integer> menu = (LinkedHashMap<String, Integer>)request.getAttribute("menu");
    	Cafe cafe = (Cafe)request.getAttribute("cafe");
    	String titleChangeName = (String)request.getAttribute("titleChangeName");
    	ArrayList<CafeAttachment> detailAtList = (ArrayList<CafeAttachment>)request.getAttribute("detailAtList");
		int cafeFileNo = (int)request.getAttribute("cafeFileNo");
    	String location = (String)request.getAttribute("location");
    	String add = (String)request.getAttribute("add");
    	String contextPath = request.getContextPath();
    	String alertMsg = (String)session.getAttribute("alertMsg");
    	String time = cafe.getOperationTime().substring(0, 5);
    	String time_1 = cafe.getOperationTime().substring(8, cafe.getOperationTime().length());
    	Member m = (Member)request.getSession().getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1516a247c39406e5354d9d81cbbbcea4&libraries=services"></script>
    <title>Document</title>
        <!-- 부트스트랩 CDN -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
             /*구글 웹 폰트 CDN*/
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
        body{
        /*
            background-image: url('resources/images/사진.jpg');
            background-repeat : no-repeat;
           object-fit : fill;    
        */
        min-height:100%;
        position :relative;
        }
        *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        /*===========로고 부분=============*/
        #logo{
        	height: auto;
        }
        
        #logo>img{
        	height : 80px;
        }
        
        #logo>img:hover{
        	cursor : pointer;
        }
        
        
        /*============로고 부분 끝===========*/
        #detailHead{
            width: 100%;
            height: 310px;
            
        }

        #detailHead div{
            width: 20%;
            height: 100%;
            float: left;
            box-sizing: border-box;     
        }

        #detailHead img{
            height: 98%;
            width: 98%;
            box-sizing: border-box;
            margin-left : 2px;
        }



        /* ==========body부분========== */

        #detail1{
            width: 55%;
            height: 160px;
            margin-left: 180px;
            margin-top: 60px;
        }

        #detail1_1{
            width: 100%;
            height: 150px;

        }

        #detail1>div>div{
            float: left;
            width: 50%;
            height: 100%;
            box-sizing: border-box;
        }

        /* ==========오른쪽에 있는 버튼 부분======== */
        #btnDiv1{
            width: 200px;
            height: 100px;

            margin-left: 200px;
            margin-top: 40px;
        }

        #btnDiv1>div{
            width: 50%;
            height: 100%;

            float: left;
            box-sizing: border-box;
        }

        #reviewIcon{
            width: 100%;
            height: 80%;
            position: relative;
        }

        #reviewIcon>img{
            width: 50%;
            height: 60%;
            position: absolute;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #reviewIconText{
            width: 100%;
            height: 20%;
            text-align: center;
        }
        
        #reviewDiv:hover{
        	cursor : pointer;
        	color : orange;
        }

        #scoreIcon{
            width: 100%;
            height: 80%;
            position: relative;
        }
        
        #scoreDiv:hover{
        	cursor : pointer;
			color : orange;
        }

        #scoreIcon>img{
            width: 50%;
            height: 60%;
            position: absolute;
            margin: auto;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }

        #scoreIconText{
            width: 100%;
            height: 20%;
            text-align: center;
        }

        /* ==============오른쪽 버튼부분 끝=============== */

        #title_score{
            width: 100%;
            height: 70%;
            box-sizing: border-box;
        }
        
        #title_score>div{
            float: left;
            margin-top: 60px;
            font-size: 25px;
        }

        /* ===================상단 제목 별점================ */

        #detail_title{
           margin-right: 10px;
           width : auto;
           font-weight : 900;
        }

        #detail_score{
            color: orange;
        }

        /* =============상단 제목 별점 끝================= */

        /* =================조회수 리뷰수 별점준 사람 수 시작 =============== */
        
        #count_reply_review{
            width: 100%;
            height: 30%;

            box-sizing: border-box;
        }

        #count_reply_review>div{
            float: left;

        }

        #detail_count{
            width: auto;
            height: 100%;
            padding-right : 17px;
        }

        #detail_count>div{
            float: left;
        }

        #detail_count>div>img{
            width: 20px;
            height: 20px;
            margin-top: 11px;
        }

        #temporary1{
            margin-top: 10px;
            margin-left: 4px;
        }

        #detail_reviewCount{
            width: auto;
            height: 100%;
            padding-right : 18px;
        }  

        #detail_reviewCount>div{
            float: left;
        }

        #detail_reviewCount>div>img{
            width: 20px;
            height: 20px;
            margin-top: 11px;
        }

        #temporary2{
            margin-top: 10px;
            margin-left: 4px;
        }

        #detail_scoreCount{
            width: 15%;
            height: 100%;
        }

        #detail_scoreCount>div{
            float: left;
        }

        #detail_scoreCount>div>img{
            width: 20px;
            height: 20px;
            margin-top: 11px;
        }

        #temporary3{
            margin-top: 10px;
            margin-left: 4px;
        }

        /* =================조회수 리뷰수 별점준 사람 수 끝 =============== */

        /* =================상세 내용 시작===================== */
        
        #bodyContent{
            width: 40%;
            height: 450px;
            margin-left: 180px;
        }

        #bodyContent>div{
            float: left;
            box-sizing: border-box;
        }

        #category{
            width: 20%;
            height: 100%;

        }

        #content{
            width: 80%;
            height: 100%;

        }
        
        #menu{

            height: 250px;
        }

        #menu>div>div{
            float: left;
        }

        .food{
            width: 230px;
            border: 1px solid white;
        }

        .price{
            text-align: right;
            border: 1px solid white;
            width: 80px;
        }
        /* =============상세내용끝=============== */

        /* ================지도==================== */
        #map{
            width: 400px;
            height: 400px;
            border: 1px solid blue;
            margin-left: 250px;
            
        }

        #map, #bodyContent{
            float: left;
        }

        #bb{
            height: 460px;
        }

        #hrDiv{
            width: 55%;
            margin-left: 180px;
        }
        /* ===========지도 끝============== */

        /* ============댓글 시작========== */
        #replyDiv{
            width: 55%;
            height: auto;
            margin-left: 180px;

        }

        #replyDiv>p{
            font-size: 25px;
            color: gray;
        }
        
        #replyDiv>div{
            overflow: auto;        
        }

        #replyDiv>div>div{
            float: left;
            box-sizing: border-box;
        }

        .userInfo{
            width: 30%;
            height: 200px;
        }
        
        .userInfo>ul{
        	float:right;
        }

        .replyContent{
            height: auto;
            width: 70%;
            white-space:pre-line;
            padding-bottom: 15px;
            padding-top : 20px;
        }
        
        .report{
        	margin-left : 450px;
        }
        
        /*=================== 댓글 끝 ==========================*/
        
        /*===================별점주는 모달창 작업=================*/
		#modal{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		  z-index : 1;
		}
		
		#modal2{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		  z-index : 1;
		}
		
		#modal3{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		  z-index : 1;
		}
		
		#modal4{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		  z-index : 1;
		}
		
		#modal5{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		  z-index : 1;
		}
		
		#modal6{ 
		  position:absolute; width:100%; height:100%; top:0; left:0; display:none;
		  z-index : 1;
		}
		
		#modal7{ 
		  position:absolute; width:100%; height:100%; top:0; left:0; display:none;
		  z-index : 1;
		}
		
		.m_head{
            height: 50px;
            margin-top: -60px;
        }

        .close_btn{
           	width : 100%;
            text-align: right;
            padding-right: 20px;
            font-size: 35px;          
        }
        
        #close_btn3{
        	width : 45%;
            text-align: right;
            padding-right: 20px;
            font-size: 35px;
        }
        
        .close_btn:hover{
        	cursor : pointer;
        }

		.modal_content{
		  width:400px; height:600px;
		  background:#fff; border-radius:10px;
		  position:relative; top:50%; left:50%;
		  margin-top:-300px; margin-left:-200px;
		  text-align:center;
		  box-sizing:border-box; padding:74px 0;
		  line-height:23px;
		}
		
		#modal5>.modal_content{
			height:50px;
		}
		
		#modal6>.modal_content1{
			
			width : 700px;
			height : 650px;
			border : 2px solid black;
		    background:#fff; border-radius:10px;
		    position:relative; top:50%; left:50%;
		    margin-top:-300px; margin-left:-500px;
		    text-align:center;
		    box-sizing:border-box; padding:74px 0;
		    line-height:23px;
		}
		
		#modal7>.modal_content{		
			height : 50px;
			border : 2px solid black;
		}
		
		.modal_content>form>div>div{
			float:left;
		}
        .modal_content>form>div{
            height: 50px;
            margin-bottom: 50px;
        }
        
        .category{
            width: 100px;
            height: 100%;
            font-size: 35px;
            line-height: 40px;
            text-align: right;
            font-weight: 900;
            margin-left: 40px;
            text-align: center;
        }
		
       .star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 2.25rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;

            height: 100%;
            margin-left: 40px;
            
             }
            
            .star-rating input {
            display: none;
            }
            
            .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 2.3px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
            }
            
            .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
            }
            
            .star-rating label:hover,
            .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
            }
        	
        	.reviewText, #reportText{
        		margin-top : 30px;
        		resize : none;
        	}
        	

        	
        	#categoryList>div{
        		float:left;
        	}
        	#categoryList>select{
        		float:left;
        		width : 100px;
        	}
        	
        	/*========================================*/
        	
        	.moreBtn{
        		width:100%;
        		color : black;
        		background-color : orange;
        		border : 2px solid black;
        		font-size : 18px;
        		font-weight : 500;
        	}
        	      	
        	#deleteDiv>form>button{
        		margin-left : 35%;
        	}
        	
        	#updateDiv>button{
        		margin-left : 35%;
        		
        	}
        	
        	/*=========================================*/
        	
        	/*================댓글 수정 삭제===================*/
			
			#navi{
				list-style-type: none;
				margin : 0;
				padding : 0;
				width : 200px;
			}
			
			#navi>li{
				display : inline-block;
            	height: 100%;
            	text-align: center;
            	display : inline-block;
            	width: 40%;
            	height: 100%;
            	text-align: center;
            	vertical-align: top;
			}
			
			#navi>li>ul a{
				text-decoration: none;
            	color: red;
            	font-size: 15px;
            	font-weight: 800;
            	
            	
            }
            
            #navi>li>ul{
            	list-style-type: none;
            	padding : 0; /*기본 설정 패딩 없애기*/
            	display: none; /*1단계 : 안보이게 하기*/
        	}

    </style>
</head>
<body>
	<div id="logo"><img src="resources/images/카페로고(임시).png"></div>
    <div id="detailHead">
        <div><img src="<%=detailAtList.get(0).getNewPath() %>"></div>       
        <div><img src="<%=detailAtList.get(1).getNewPath() %>"></div>
        <div><img src="<%=detailAtList.get(2).getNewPath() %>"></div>
        <div><img src="<%=detailAtList.get(3).getNewPath() %>"></div>
        <div><img src="<%=detailAtList.get(4).getNewPath() %>"></div>
    </div>

    <div id="detailBody">
        <div id="detail1">
            <div id="detail1_1">
                <div>
                    <div id="title_score"> <!-- 제목, 점수 영역 div-->
                        <div id="detail_title"> <!--제목-->
                            <%=cafe.getCafeName() %>
                        </div>
                        <div id="detail_score"> <!--평균점수-->
                            <%=cafe.getScore() %>
                        </div>
                    </div>
                    <div id="count_reply_review"> <!-- 제목 밑에 있는 조회수, 리뷰수, 별점수 영역 div-->
                        <div id="detail_count"> <!--조회수-->
                            <div><img src="resources/images/조회수아이콘.png"></div>
                            <div id="temporary1"><%=cafe.getCount() %></div>
                        </div>
                        <div id="detail_reviewCount"> <!--리뷰개수-->
                            <div><img src="resources/images/리뷰아이콘.png"></div>
                            <div id="temporary2"><%=cafe.getReplyCount() %></div>
                        </div>
                        <div id="detail_scoreCount"> <!--별점 준 사람들 수-->
                            <div><img src="resources/images/별아이콘.png"></div>
                            <div id="temporary3"><%=cafe.getScoreCount() %></div>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="btnDiv1"> <!--오른쪽에 있는 리뷰, 별 아이콘 영역 div-->
                        <div id="reviewDiv">
                            <div id="reviewIcon">
                                <img src="resources/images/리뷰아이콘.png" alt="">
                            </div>
                            <div id="reviewIconText">
                                	리뷰쓰기
                            </div>
                        </div>	                      
                        <div id="scoreDiv">
                            <div id="scoreIcon">
                                <img src="resources/images/별아이콘.png" alt="">
                            </div>
                            <div id="scoreIconText">
                                	별점주기
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
    </div>
    <br>
    <div id="bb">
        <div id="bodyContent">
            <div id="category">
                <div>주소</div><br>
                <div>전화번호</div><br>
                <div>영업시간</div><br>
                <div>휴무일</div><br>
                <div>메뉴</div>
            </div>
            <div id="content">
                <div><%=cafe.getAddress() %></div><br>
                <div><%=cafe.getPhone() %></div><br>
                <div><%=cafe.getOperationTime() %></div><br>
                <div><%=cafe.getOffDay() %></div><br>
                <div id="menu">
                    <div>
                    	<%Iterator<Entry<String, Integer>> entry = menu.entrySet().iterator(); %>
                    	<%while(entry.hasNext()){ %>
                    		<%Entry<String, Integer> menuEntry = entry.next(); %>
                    		<div class="food">
                    			<%=menuEntry.getKey() %>
                    		</div>
                    		<div class="price">
                    			<%=menuEntry.getValue() %>원
                    		</div>
                    	<%} %>
                    </div>
                </div>
            </div>
        </div>
        <%if(m!=null && m.getUserId().equals("admin")) {%>
        	<div id="updateDiv">
	        	<button onclick="updateCafe()">게시글 수정하기</button>
	        	<input type="hidden" name="location" value="<%=location %>">
	        	<input type="hidden" name="add" value="<%=add %>">
	        </div>
	        <div id="deleteDiv">
	        	<form action="<%=contextPath %>/delete.cf" method="post">
	        		<button>게시글 삭제하기</button>
	        		<input type="hidden" name="location" value="<%=location %>">
	        		<input type="hidden" name="add" value="<%=add %>">
	        	</form>
	        </div>
        <%} %>

        <p style="margin-top:-12px">
    		<em class="link">
        		<a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
           
        		</a>
   			</em>
		</p>
			<div id="map"></div>
    </div>

		
    <div id="replyDiv">
    	
    </div>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    
	<div id="modal">
		<div class="modal_content">
		    <div class="m_head">
                <div class="close_btn" id="close_btn">x</div>
            </div>
			<form action="<%=contextPath %>/evaluate.cf" method="post" onsubmit="return checkRating()">
				<div>
					<div class="category">맛</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
				        <label for="5-stars" class="star pr-4">★</label>
				        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
				        <label for="4-stars" class="star">★</label>
				        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
				        <label for="3-stars" class="star">★</label>
				        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
				        <label for="2-stars" class="star">★</label>
				        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
				        <label for="1-star" class="star">★</label>
				    </div>
				</div>
				
			    <div>
					<div class="category">가격</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars2" name="rating2" value="5" v-model="ratings"/>
				        <label for="5-stars2" class="star pr-4">★</label>
				        <input type="radio" id="4-stars2" name="rating2" value="4" v-model="ratings"/>
				        <label for="4-stars2" class="star">★</label>
				        <input type="radio" id="3-stars2" name="rating2" value="3" v-model="ratings"/>
				        <label for="3-stars2" class="star">★</label>
				        <input type="radio" id="2-stars2" name="rating2" value="2" v-model="ratings"/>
				        <label for="2-stars2" class="star">★</label>
				        <input type="radio" id="1-star2" name="rating2" value="1" v-model="ratings" />
				        <label for="1-star2" class="star">★</label>
				    </div>
				</div>
	
	            <div>
					<div class="category">분위기</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars3" name="rating3" value="5" v-model="ratings"/>
				        <label for="5-stars3" class="star pr-4">★</label>
				        <input type="radio" id="4-stars3" name="rating3" value="4" v-model="ratings"/>
				        <label for="4-stars3" class="star">★</label>
				        <input type="radio" id="3-stars3" name="rating3" value="3" v-model="ratings"/>
				        <label for="3-stars3" class="star">★</label>
				        <input type="radio" id="2-stars3" name="rating3" value="2" v-model="ratings"/>
				        <label for="2-stars3" class="star">★</label>
				        <input type="radio" id="1-star3" name="rating3" value="1" v-model="ratings" />
				        <label for="1-star3" class="star">★</label>
				    </div>
				</div>
	
	            <div>
					<div class="category">접근성</div>
					<div class="star-rating">
				        <input type="radio" id="5-stars4" name="rating4" value="5" v-model="ratings"/>
				        <label for="5-stars4" class="star pr-4">★</label>
				        <input type="radio" id="4-stars4" name="rating4" value="4" v-model="ratings"/>
				        <label for="4-stars4" class="star">★</label>
				        <input type="radio" id="3-stars4" name="rating4" value="3" v-model="ratings"/>
				        <label for="3-stars4" class="star">★</label>
				        <input type="radio" id="2-stars4" name="rating4" value="2" v-model="ratings"/>
				        <label for="2-stars4" class="star">★</label>
				        <input type="radio" id="1-star4" name="rating4" value="1" v-model="ratings" />
				        <label for="1-star4" class="star">★</label>
				    </div>
				</div>
				<input type="hidden", name="cafeNo", value="<%=cafe.getCafeNo() %>">
				<input type="hidden", name="add", value="<%=add %>">
				<button type="submit" class="btn btn-success">확인</button>
                <button type="reset" class="btn btn-danger">초기화</button>
			</form>
			
	  	</div>
	</div>
	
	<form action="<%=contextPath %>/insert.cfre" method="post">
		<div id="modal2">
			<div class="modal_content">
			    <div class="m_head">
	                <div class="close_btn" id="close_btn2">x</div>
	                <div>
	                	<textarea name="reviewText" rows="20" cols="40" class="reviewText" required></textarea>
	                </div>
	                <input type="hidden" name="cafeNo" value="<%=cafe.getCafeNo() %>">
					<input type="hidden" name="add" value="<%=add %>">
	                <button type="submit" class="btn btn-success">확인</button>
                	<button type="reset" class="btn btn-danger">초기화</button>
	            </div>
			</div>
		</div>	
	</form>
	
	<div id="modal3"> <!-- 신고창 모달 -->
		<div class="modal_content">
			<div class="m_head">
				<div id=categoryList>
					<div style="margin-left : 30px; margin-right : 15px;">신고사유</div>
					<select name="reportCategory">
						<option value="욕설">욕설</option>
						<option value="홍보">홍보</option>
						<option value="도배">도배</option>
					</select>
	        		<div class="close_btn" id="close_btn3">x</div>
				</div>

	                <div>
	                	<textarea name="reportText" rows="20" cols="40" id="reportText" required></textarea>
	                </div>
	                <button onclick="insertReport()" class="btn btn-success">확인</button>
                	<button type="reset" class="btn btn-danger">초기화</button>
	    	</div>
		</div>
	</div>
	
	<form action="<%=contextPath %>/update.cfre" method="post"> 
		<div id="modal4"> <!-- 리뷰 수정창 모달 -->
			<div class="modal_content">
			    <div class="m_head">
	                <div class="close_btn" id="close_btn4">x</div>
	                <div>
	                	<textarea name="reviewText" rows="20" cols="40" class="reviewText" required></textarea>
	                </div>
	                <input class="cafeReplyNo" type="hidden" name="cafeReplyNo" value="">
	                <button type="submit" class="btn btn-success">확인</button>
                	<button type="reset" class="btn btn-danger">초기화</button>
	            </div>
			</div>
		</div>	
	</form>
	
	<form action="<%=contextPath %>/delete.cfre" method="post"> 
		<div id="modal5">
			<div class="modal_content">
			    <div class="m_head">
	                <div class="close_btn" id="close_btn5">x</div>
	                	정말로 삭제하시겠습니까?
	                <input class="cafeReplyNo" type="hidden" name="cafeReplyNo" value="">
	                <button type="submit" class="btn btn-success">삭제하기</button>
	            </div>
			</div>
		</div>	
	</form>

	<form action="<%=contextPath %>/update.cf" method="post" enctype="multipart/form-data">  <!-- 카페 정보 수정 모달창 -->
		<%Iterator<Entry<String, Integer>> entry1 = menu.entrySet().iterator(); %>
		<%while(entry1.hasNext()){ %>
			<%Entry<String, Integer> entryMenu1 = entry1.next(); %>
			<input type="hidden" name="foodName" value="<%=entryMenu1.getKey()%>">
			
		<%} %>
		<div id="modal6">
			<div class="modal_content1">
			    <div class="m_head">
	                <div class="close_btn" id="close_btn6">x</div>
	                <div id="registerform">
	                	<input type="hidden", name="cafeNo" value="<%=cafe.getCafeNo()%>">
				        <table class="d" border="1">
				            <tr>
				                <th>
				                    카페명:
				                </th>
				                <td>
				                    <input type="text" name="modifyName" id="modifyName" value="<%=cafe.getCafeName() %>" required style="width: 90%;">
				                </td>
				            </tr>
				
				            <tr>
				                <th>
				                    주소:
				                </th>
				                <td>
				                    <input type="address" name="modifyAddress" id="modifyAddress" value="<%=cafe.getAddress() %>" required style="width: 90%;">
				                </td>
				            </tr>

				            <tr>
				                <th>
				                    영업시간:
				                </th>
				                <td>
				                    <input type="time" name="modifyTime" id="modifyTime" value="<%=time %>" style="width: 40%;"> -
				                    <input type="time" name="modifyTime-1" id="modifyTime-1" value="<%=time_1 %>" style="width: 40%;">
				                </td>
				            </tr>
				            <tr>
				                <th>
				                    휴무일:
				                </th>
				                <td>
				                    <input type="text" name="modifyRest" id="modifyRest" value="<%=cafe.getOffDay() %>" required style="width: 90%;">
				                </td>
				            </tr>
				            <tr>
				                <th>
				                    전화번호:
				                </th>
				                <td>
				                    <input type="text" name="modifyPhone" id="modifyPhone" value="<%=cafe.getPhone() %>" required style="width: 90%;">
				                </td>
				            </tr>
				            <tr>
				                <th rowspan="5">
				                    메뉴:<br> <a href="javascript:void(0);" onclick="manual()">V</a>
				                </th>
				                <%int count = 0; %>
				                <%Iterator<Entry<String, Integer>> modifyEntry = menu.entrySet().iterator(); %>
				                <%while(modifyEntry.hasNext()){ %>
				                	<%Entry<String, Integer> entryMenu = modifyEntry.next(); %>
				                	<%count++; %>
				                	<td>
					                    음식 : <input type="text" name="modifyFood" class="modifyFood" value="<%=entryMenu.getKey() %>" style="width: 30%;">
					                    가격 : <input type="text" name="modifyPrice" class="modifyPrice" value="<%=entryMenu.getValue() %>" style="width: 30%;">
					                </td>
					            </tr>
					            <tr>				                	
				                <%} %>
				                
				                <%if(count < 5) {%>
				                	<%for(int i = count; i<5; i++) {%>
				                	<td>
					                    음식 : <input type="text" name="modifyFood" class="modifyFood" style="width: 30%;">
					                    가격 : <input type="text" name="modifyPrice" class="modifyPrice" style="width: 30%;">
					                </td>
					            </tr>
					            <tr>				                		
				                	<%} %>
				                <%} %>

				                <th>
				                    대표이미지:
				                </th>
				                <td>
				                    <input type="file" name="modifyDetailImg1" class="modifyTitleImg">
				                    <input type="hidden" name="cafeFileNo" value="<%=cafeFileNo%>">
				                    <input type="hidden" name="originFileName" value="<%=titleChangeName %>">
				                </td>
				            </tr>
				            <tr>
				                <th rowspan="5">
				                    이미지:
				                </th>
				                <td>
				                    1번 : <input type="file" name="modifyDetailImg2" class="modifyDetailImg">
				                    <input type="hidden" name="cafeFileNo" value="<%=detailAtList.get(0).getCafeFileNo()%>">
				                    <input type="hidden" name="originFileName" value="<%=detailAtList.get(0).getChangeName() %>">
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    2번 : <input type="file" name="modifyDetailImg3" class="modifyDetailImg">
				                    <input type="hidden" name="cafeFileNo" value="<%=detailAtList.get(1).getCafeFileNo()%>">
				                    <input type="hidden" name="originFileName" value="<%=detailAtList.get(1).getChangeName() %>">
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    3번 : <input type="file" name="modifyDetailImg4" class="modifyDetailImg">
				                    <input type="hidden" name="cafeFileNo" value="<%=detailAtList.get(2).getCafeFileNo()%>">
				                    <input type="hidden" name="originFileName" value="<%=detailAtList.get(2).getChangeName() %>">
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    4번 : <input type="file" name="modifyDetailImg5" class="modifyDetailImg">
				                    <input type="hidden" name="cafeFileNo" value="<%=detailAtList.get(3).getCafeFileNo()%>">
				                    <input type="hidden" name="originFileName" value="<%=detailAtList.get(3).getChangeName() %>">
				                </td>
				            </tr>
				            <tr>
				                <td>
				                    5번 : <input type="file" name="modifyDetailImg6" class="modifyDetailImg">
				                    <input type="hidden" name="cafeFileNo" value="<%=detailAtList.get(4).getCafeFileNo()%>">
				                    <input type="hidden" name="originFileName" value="<%=detailAtList.get(4).getChangeName() %>">
				                </td>
				            </tr>				            
				        </table>
				    </div>
	                <button type="submit" class="btn btn-success">수정하기</button>
	            </div>
			</div>
		</div>	
	</form>
	

	<div id="modal7">
		<div class="modal_content">
			<div class="m_head">
	        	<div class="close_btn" id="close_btn7">x</div>
	            1.음식 칸을 비워두면 메뉴에서 삭제됩니다. <br>
	            2.가격을 비워두면 0원으로 표기됩니다. <br>
	            3.메뉴와 가격 표기 순서는 무작위입니다. <br>
	            4.그러니 순서 상관없이 입력하세요.
	    	</div>
		</div>
	</div>	

	
    <script>
    	var msg = "<%=alertMsg%>";
    	
    	if(msg != "null"){
    		alert(msg);
    		
    		<%session.removeAttribute("alertMsg");%>
    	}
    	
    	$("#logo>img").click(function(){
    		location.href = '<%=contextPath%>';
    	})
    
    	$("#scoreDiv").click(function(){ //별점주기 버튼 클릭시 모달창 띄움
    		if(<%=m == null%>){
    			alert("로그인 후 사용가능한 기능입니다.");
    		}else{
                $("#modal").css({
                    "top": (($(window).height()-$("#modal").outerHeight())/2+$(window).scrollTop())+"px",
                    "left": (($(window).width()-$("#modal").outerWidth())/2+$(window).scrollLeft())+"px"
                    //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
                 
                 });
        		$("#modal").fadeIn();
    		}
    	});
    	
    	$("#close_btn").click(function(){ //x버튼 클릭하면 모달창 닫음
    		$("#modal").fadeOut();
    	});
    	
    	$("#reviewDiv").click(function(){ //리뷰쓰기 클릭하면 모달창 띄움
    		if(<%=m == null%>){
    			alert("로그인 후 사용가능한 기능입니다.");
    		}else{
                $("#modal2").css({
                    "top": (($(window).height()-$("#modal2").outerHeight())/2+$(window).scrollTop())+"px",
                    "left": (($(window).width()-$("#modal2").outerWidth())/2+$(window).scrollLeft())+"px"
                    //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
                 
                 });
        		$("#modal2").fadeIn();
    		}
    	});
    	
    	$("#close_btn2").click(function(){ //x버튼 클릭하면 모달창 닫음
    		$("#modal2").fadeOut();
    	});
    
		$(function(){
			selectReplyList(1);
		})
		
    	function selectReplyList(count){ //댓글 리스트 가져와서 띄우기
    		$.ajax({
    			url:"list.re",
    			data:{
    				cafeNo : <%=cafe.getCafeNo()%>
    			},
    			type : "get",
    			success : function(list){
    				
    				var str="";
    				if(count == 1){
        				str = "<hr>" + "<p ='review'>리뷰 ("+<%=cafe.getReplyCount() %>+")</p>";
    				}
    				var checkBtn = false; //더보기 버튼 삭제 유무 변수
								
    				var userId;
    				for(var i=4*count - 4; i<count*4; i++){
    					if(i == list.length){
    						checkBtn = true;
    						break;
    					}
    					userId = list[i].userId;
    					str +=
    						 "<div class='dd'>"
    						+"<div class='userInfo'>"
    						+list[i].cafeReplyWriter
    						+"<ul id='navi'> <li><a href='javascript:void(0);' onclick='display(this)'>V</a>"
    						+"<ul>"
    						+"<li><a href='javascript:void(0);' onclick='updateReview(" + '"' + userId + '",' + "this" + ")'>수정하기</a></li>"
    						+"<li><a href='javascript:void(0);' onclick='deleteReview(" + '"' + userId + '",' + "this" + ")'>삭제하기</a></li>"
    						+"</ul>"
    						+"</li></ul>"
    						+"</div>"
    						+"<div>"+list[i].createDate+"</div>" //javascript:void(0) : 하이퍼링크 사용안함              '"' + userId + '"' : string처리
    						+"<div class='report'>" + "<a href='javascript:void(0);'> <p onclick='reporting(" + '"' + userId + '"' + ")'>신고</p> </a>" + "</div>"
    						+"<div class='replyContent'>" + list[i].cafeReplyContent + "</div>"
    						+"<input type='hidden' class='CRNO' name='cafeReplyNo' value=" + list[i].cafeReplyNo + ">"
    						+"</div>"
    						+"<hr>"
    					if(i == list.length-1){
    						checkBtn = true;
    					}
    				}
    				
    				str += "<button class='moreBtn' onclick='moreReply("+ count +")'>더보기</button>" //더보기 버튼
    				
    				if(count == 1){ //count가 1이라면(처음 페이지 접속시) .html로 댓글 띄워줌
    					$("#replyDiv").html(str);
    				}else{ //아니면 .append로 댓글 이어 붙임 / .remove로 더보기 버튼도 삭제
						$(".moreBtn").remove();
    					$("#replyDiv").append(str);
    				}
    				if(checkBtn){ //더이상 보여줄 댓글이 없으면 더보기 버튼을 완전 삭제
    					$(".moreBtn").remove();
    				}
    			}
    		})
    	}
    
		function moreReply(count){ //반복문 돌릴 count 처리
			selectReplyList(count+1);
		}
		
		var reportedId; //신고당한사람 아이디
		function reporting(userId){ //신고 버튼을 누르면 모달창 띄움
			if(<%=m == null%>){
				alert("로그인 후 사용가능한 기능입니다.");
			}else{
	            $("#modal3").css({
	                "top": (($(window).height()-$("#modal3").outerHeight())/2+$(window).scrollTop())+"px",
	                "left": (($(window).width()-$("#modal3").outerWidth())/2+$(window).scrollLeft())+"px"
	                //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
	             
	             });
	        	$("#modal3").fadeIn();
	    		reportedId = userId;
			}
		}
		
		$("#close_btn3").click(function(){ //x버튼을 클릭하면 닫음
    		$("#modal3").fadeOut();
    	});
		
		function insertReport(){ //신고하기
			$.ajax({
				url : "insert.rp",
				data : {
					content : reportContent(),
					category : reportCategory(),
					userId : reportedId
				},
				type : "post",
				success : function(msg){
					alert(msg.substr(1, msg.length-2));
					$("select[name=reportCategory]").val(''); //ajax로 했기 때문에 따로 초기화 해줌
					$("#reportText").val(''); //위와 마찬가지
					$("#modal3").hide();
				}
			});
		}
		
		function reportCategory(){ //신고 사유
			var reportCategory = $("select[name=reportCategory] option:selected").val();
			return reportCategory;
		}
		
		function reportContent(){ //신고 내용
			var reportContent = $("#reportText").val();
			console.log(reportContent);
			return reportContent;
		}
		
		function display(a){ // V누르면 수정하기 삭제하기 나옴
			if($(a).next().css('display') == 'block'){
				$(a).next().css('display', 'none');
			}else{
				$(a).next().css('display', 'block');
			}
			
		}
		
		function updateReview(checkId, e){ //리뷰 수정창 열기 / 로그인한 아이디와 수정할 리뷰와의 정보가 같은지 체크
			var userId = "";
			<%if(m != null){%>
				userId = "<%=m.getUserId()%>";
			<%}%>
			if(userId == checkId){
	            $("#modal4").css({
	                "top": (($(window).height()-$("#modal4").outerHeight())/2+$(window).scrollTop())+"px",
	                "left": (($(window).width()-$("#modal4").outerWidth())/2+$(window).scrollLeft())+"px"	             	
	             });
	            $("#modal4").fadeIn();
	            $(".cafeReplyNo").attr("value", $(e).parent().parent().parent().parent().parent().parent().find("input").val());
			}else{
				alert("자신이 작성한 리뷰에 대해서만 수정이 가능합니다.");
			}

		}
		
		$("#close_btn4").click(function(){ //x버튼을 클릭하면 닫음
    		$("#modal4").fadeOut();
    	});
		
		function deleteReview(checkId, e){ //리뷰 삭제창 열기 / 로그인한 아이디와 수정할 리뷰와의 정보가 같은지 체크
			var userId = "";
			<%if(m != null){%>
				userId = "<%=m.getUserId()%>";
			<%}%>
			
			if(userId == checkId || userId == "admin"){
	            $("#modal5").css({
	                "top": (($(window).height()-$("#modal5").outerHeight())/2+$(window).scrollTop())+"px",
	                "left": (($(window).width()-$("#modal5").outerWidth())/2+$(window).scrollLeft())+"px"	             	
	             });
	            $("#modal5").fadeIn();
	            $(".cafeReplyNo").attr("value", $(e).parent().parent().parent().parent().parent().parent().find("input").val());
			}else{
				alert("자신이 작성한 리뷰에 대해서만 삭제가 가능합니다.");
			}

		}
		
    	$("#close_btn5").click(function(){ //x버튼 클릭하면 모달창 닫음
    		$("#modal5").fadeOut();
    	});
		
		function updateCafe(){
			$("#modal6").css({
                "top": (($(window).height()-$("#modal6").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#modal6").outerWidth())/2+$(window).scrollLeft())+"px"	             	
             });
			$("#modal6").fadeIn();
			$(".modifyFood").eq(0).attr("required", true);
			$(".modifyPrice").eq(0).attr("required", true);
		}
		
		$("#close_btn6").click(function(){
			$("#modal6").fadeOut();
		});
		
		function manual(){
			$("#modal7").css({
                "top": (($(window).height()-$("#modal7").outerHeight())/2+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#modal7").outerWidth())/2+$(window).scrollLeft())+"px"	             	
             });
			$("#modal7").fadeIn();
		}
		
		$("#close_btn7").click(function(){
			$("#modal7").fadeOut();
		});
		
		function checkRating(){	//0점을 준 별점이 있는지 체크. 있으면 false 리턴
			var arr = [];
			arr[0] = $(".star-rating input[name=rating]:checked").val();
			arr[1] = $(".star-rating input[name=rating2]:checked").val();
			arr[2] = $(".star-rating input[name=rating3]:checked").val();
			arr[3] = $(".star-rating input[name=rating4]:checked").val();
			
			for(var i=0; i<4; i++){
				if(arr[i] == null){
					alert("0점을 줄 수는 없습니다");
					return false;
				}
			}
			
			return true;
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=add%>', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=cafe.getCafeName()%></div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    


    </script>
    <br><br><br><br><br><br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>