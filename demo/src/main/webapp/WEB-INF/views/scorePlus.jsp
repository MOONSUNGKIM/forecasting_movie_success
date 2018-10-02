<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- �⺻��� -->
<%@  taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- ���� ��� (��������)-->
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- �Լ� ��� -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MIT - �� ���ϱ�</title>

<!-- Detail PopUPâ�� ���� �ʿ��� css�̴�. (MODAL���� css ) -->
<link rel="stylesheet" href="/resources/demo/css/juwonmodal.css" />



<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/resources/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />



<!-- �ε��� �ʿ�  -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

<!-- CORE CSS-->
<link href="/resources/demo/css/style.css" type="text/css"
	rel="stylesheet" media="screen,projection">



<!--  Fonts and icons     -->
<link href="/resources/assets/css/themify-icons.css" rel="stylesheet">
</head>

<style>
[v-cloak] {
	display: none;
}

.mytable, tr, th, td {
	padding: 5px;
	border-collapse: collapse;
	border: 1px solid black;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 13px;
	height: 28px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 13px;
	height: 28px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

.starR.on {
	background-position: 0 0;
}

#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 250px; /* Set a default minimum width */
    margin-left: -125px; /* Divide value of min-width by 2 */
    background-color: #AA7A55; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    top: 80px; /* 30px from the top */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
    visibility: visible; /* Show the snackbar */

/* Add animation: Take 0.5 seconds to fade in and out the snackbar. 
However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
    from {top: 0; opacity: 0;} 
    to {top: 80px; opacity: 1;}
}

@keyframes fadein {
    from {top: 0; opacity: 0;}
    to {top: 80px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {top: 80px; opacity: 1;} 
    to {top: 0; opacity: 0;}
}

@keyframes fadeout {
    from {top: 80px; opacity: 1;}
    to {top: 0; opacity: 0;}
}
</style>



<body>
	<%@include file="header.jsp"%>

	<!-- Start Page Loading -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<div id="snackbar"><center> <p>����Ǿ����ϴ�!</p>
	 <p>�򰡴��ϱⰡ ���������� ���� �ϴ��� 'finish'�� �����ּ���</p></center> </div>
		
	<p></p>
	
	<div class="vuejs" v-cloak>
		<detail modal-class="media-manager-details" v-show="showDetailModal"
			@close="showDetailModal=false">
		<p>Here is SLOT AREA</p>
		</detail>
		<%-- 	<div v-for="(item,index) in movieList" v-cloak>
			<div class="starRev" v-if="index < max">
				<span>
					<div class="col s12 m6 grid">
						<figure class="effect-zoe"> <img
							:src="'/image/'+item.movie+'_'+item.title+'_'+item.director+'.jpg'"
							style = " border-radius: 7px; width: 220px; height: 330px;"
							@click="handleImageDetails(item)" /> <figcaption
							style="width:220px; height:160px; background-color:#F2F2F2;">
						<!-- �̳��� ���콺�÷����� �� ��� ��� �������̴�. -->
						<div
							style="display: table; margin-left: auto; margin-right: auto;">
							<span class="starR1" @mouseenter="starColor" @click="scoring">0.5</span>
							<span class="starR2" @mouseenter="starColor" @click="scoring">1</span>
							<span class="starR1" @mouseenter="starColor" @click="scoring">1.5</span>
							<span class="starR2" @mouseenter="starColor" @click="scoring">2</span>
							<span class="starR1" @mouseenter="starColor" @click="scoring">2.5</span>
							<span class="starR2" @mouseenter="starColor" @click="scoring">3</span>
							<span class="starR1" @mouseenter="starColor" @click="scoring">3.5</span>
							<span class="starR2" @mouseenter="starColor" @click="scoring">4</span>
							<span class="starR1" @mouseenter="starColor" @click="scoring">4.5</span>
							<span class="starR2" @mouseenter="starColor" @click="scoring">5</span>
						</div>
						<hr>
						<p style="font-size: 18px">
							<strong class="movie-title">{{item.title}}</strong>
						</p>
						</figcaption> </figure>
						<!-- <button class="waves-effect waves-light  btn" @click="showDetailModal=true">show
							register modal</button> -->
					</div>
				</span>
			</div>
		</div> --%>
		<div>
		<center><h3>�� ��ȭ�� ���� �򰡸� ���� ���ּ���</h3></center>
			<span>
				<div class="col s12 m12 grid">
					<figure class="effect-zoe starRev"
						v-for="(item,index) in movieList" v-if="index < max"
						style="min-width:230px;max-width:230px;"> <img
						:src="'/image/'+item.fileName+'.jpg'"
						style="border-radius: 7px; width: 220px; height: 330px;"
						@click="handleImageDetails(item)" /> <figcaption
						style="width:220px; height:160px; background-color:#F2F2F2;">
					<div style="display: table; margin-left: auto; margin-right: auto;">
						<span class="starR1" @mouseenter="starColor" @click="scoring">0.5</span>
						<span class="starR2" @mouseenter="starColor" @click="scoring">1</span>
						<span class="starR1" @mouseenter="starColor" @click="scoring">1.5</span>
						<span class="starR2" @mouseenter="starColor" @click="scoring">2</span>
						<span class="starR1" @mouseenter="starColor" @click="scoring">2.5</span>
						<span class="starR2" @mouseenter="starColor" @click="scoring">3</span>
						<span class="starR1" @mouseenter="starColor" @click="scoring">3.5</span>
						<span class="starR2" @mouseenter="starColor" @click="scoring">4</span>
						<span class="starR1" @mouseenter="starColor" @click="scoring">4.5</span>
						<span class="starR2" @mouseenter="starColor" @click="scoring">5</span>
					</div>
					<hr>
					<p style="font-size: 18px">
						<strong class="movie-title">{{item.title}}</strong>
					</p>
					</figcaption> </figure>
					<!-- <button class="waves-effect waves-light  btn" @click="showDetailModal=true">show
							register modal</button> -->
				</div>
			</span>
		</div>
		<div style="position: fixed; bottom: 30px; right: 40px">
			<!-- MODAL -->

			<!-- READMORE -->
			<a class="waves-effect waves-light  btn" @click='max=max+36'>READ
				MORE</a> <a class="waves-effect waves-light  btn" id="finish">
				finish </a>

		</div>
	</div>


	</div>
	</div>


	<!--  �ε��� �ʿ�  -->


	<!-- jQuery Library -->
	<script type="text/javascript"
		src="/resources/demo/js/plugins/jquery-1.11.2.min.js"></script>
	<!--materialize js-->
	<script type="text/javascript" src="/resources/demo/js/materialize.js"></script>


	<!--  �̰� ���� �ε� ��� ���ӵ�  -->
	<!--plugins.js - Some Specific JS codes for Plugin Settings-->
	<script type="text/javascript" src="/resources/demo/js/plugins.js"></script>

</body>



<!--   Core JS Files. Extra: PerfectScrollbar + TouchPunch libraries inside jquery-ui.min.js   -->
<script src="/resources/assets/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="/resources/assets/js/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="/resources/assets/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- Paper Dashboard PRO Core javascript and methods for Demo purpose -->
<script src="/resources/assets/js/paper-dashboard.js"></script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.4/vue.js"></script>
<script type="text/javascript">

  $(document).ready(function() {
      $("#finish").click(function() {
          // ������ �ּ� ����(�̵�)
          location.href = "${pageContext.servletContext.contextPath}/startSpark/";
      });
  });
</script>

<script type="text/javascript">
var bus = new Vue();

const app2 =new Vue({
    el: ".vuejs",
    data: {
      movieList : [],
      max: 36,
      showDetailModal:false
    },  
     mounted: function() {
          <c:forEach var="vo" items="${detailList}">
          var tit = "${vo.title}";
          var dir = "${vo.director}";
          this.movieList = this.movieList.concat({
	           movie:"${vo.movie}",
	           title:tit,
	           director:dir,
	           company:"${vo.company}",
	           country:"${vo.country}",
	           genre:"${vo.genre}",
	           grade:"${vo.grade}",
	           actor1:"${vo.actor1}",
	           actor2:"${vo.actor2}",
	           story:"${vo.story}",
	           r_date:"${vo.r_date}",
	           runningtime:"${vo.runningtime}",
	           fileName:"${vo.fileName}"
             });
           	
          </c:forEach>
   },  
   methods:{
      starColor(event) {
         $(event.target).parent().children('span').removeClass('on');
         $(event.target).addClass('on').prevAll('span').addClass('on');
         return false;
      },
      handleImageDetails(item) {
    	this.showDetailModal=true;
    	this.movieList.movie=item.movie;
    	this.movieList.title=item.title;
    	this.movieList.director=item.director;
    	this.movieList.company=item.company;
    	this.movieList.country=item.country;
    	this.movieList.genre=item.genre;
    	this.movieList.grade=item.grade;
    	this.movieList.actor1=item.actor1;
    	this.movieList.actor2=item.actor2;
    	this.movieList.story=item.story;
    	this.movieList.r_date=item.r_date;
    	this.movieList.runningtime=item.runningtime;
    	this.movieList.fileName=item.fileName;
	    bus.$emit('imageTransport', this.movieList);
		
	   // this.$emit('custom-event-aaa', item);
	      
	    /*
	    	sender() {
            EventBus.$emit('message', this.text);	// "message"��� �̺�Ʈ�� �����Ѵ�. 
        },
        onReceive(text) {
            this.receiveText = text;
        }
	    */
    	
      }
      ,scoring(event) {
         var val=$(event.target).html();
         var title= $(event.target).parent().parent().find('p > .movie-title').html();
         
         $.ajax({
            url: '/starScore',
            type: 'POST',
            data:{"title":title,"rating":val}
         });
         
         var x = document.getElementById("snackbar");

         // Add the "show" class to DIV
         x.className = "show";

         // After 3 seconds, remove the show class from DIV
         setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
      
      }
      
   },
   components:{
	   /* 'detail': child */
	   detail: {
	    	template: `
			<div class="modal is-active">
			  <div class="modal-background"  @click="$emit('close')"></div>
			  <div class="modal-card" style="width:60%; height:80%">
			    <header class="modal-card-head">
			    <h2 style="color:787878;">{{title}}</h2>
			      <p class="modal-card-title"></p>
			      <button class="delete" aria-label="close" @click="$emit('close')"></button>
			    </header>
			   <!-- <section class="modal-card-body" style="width:50%; height:100%"> -->
			   <div class="modal-card-body" style="width:100%; height:100%;">
			      <!-- Content ... -->
				    <table style="width:90%;border:hidden;" valign="top" >
				    	<tr style="text-align:left;border:hidden">
					    	<td style="border:hidden;width:250px; height:350px;">
								<img style = "border: 5px solid lightgray; border-radius: 7px; -moz-border-radius: 7px;-khtml-border-radius: 7px;-webkit-border-radius: 7px;width: 220px; height: 330px;":src="'/image/'+fileName+'.jpg'"  @click="handleImageDetails(item)" />
							</td>
							<td style="border:hidden;">
								<p><span class="age12"><strong> {{grade}} |</strong> {{title}} <hr></p>
								<p><strong>���� |</strong> {{r_date}} </p>
								<p><strong>�� �ð� |</strong> {{runningtime}} </p>
								<p><strong>�帣 |</strong> {{genre}} </p>
								<p><strong>���� |</strong> {{country}}</p>
								<p><strong>���� |</strong> {{director}}</a></p>
								<p><strong>��� |</strong> {{actor1}}</p>
							</td>
						</tr>
						<tr style="text-align:left;border:hidden">
							<td  colspan="2">
								<h3><strong>�ٰŸ�</strong></h3><hr>
								{{story}}
							</td>
						</tr>
						<tr style="text-align:left;border:hidden">
							<td>
								
							</td>
						</tr>
						
					</table>
					<!--</section> 
					
					
					
					-->
				</div>
				  <!--
				  <div class="moviebig">
					<p class="mobiglf"><img id="imgMoviePhoster" src="//image.maxmovie.com/movieinfo/image/poster/movie/Max2017AntMan4.jpg" onerror="javascript:isImg('imgMoviePhoster');" alt="��Ʈ�ǰ� �ͽ���" width="209" height="300" onclick="javascript:void(viewBigPoster());" style="cursor:pointer;"></p>
					<div class="mobigrf">
						<p class="mobtit"><span class="age12">12</span>��Ʈ�ǰ� �ͽ���<br><strong>Ant-Man and the Wasp</strong></p>
						<p class="vmstar"><span><em style="width:87.5%"></em></span> <strong>8.75</strong> <a href="movie_info_point.asp?m_id=M000104313&amp;tab=4"><img src="/img/movie_new/btn_subm.gif" alt="���ϱ�"></a></p> 
						<p class="mdate">���� 2018�� 07�� 04�� <span>|</span> 118�� <span>|</span> �׼�, SF <span>|</span> �̱� </p>
						
						<p class="mdir"><strong>����</strong> <a href="movie_actor_info.asp?m_id=M000104313&amp;p_id=P000010328">����ư ����</a></p>
						<p class="mdiract"><strong>���</strong> <a href="movie_actor_info.asp?m_id=M000104313&amp;p_id=P000033155">�� ����</a> , <a href="movie_actor_info.asp?m_id=M000104313&amp;p_id=P000072052">�������� ����</a> , <a href="movie_actor_info.asp?m_id=M000104313&amp;p_id=P000001225">�̼� ������</a> , <a href="movie_actor_info.asp?m_id=M000104313&amp;p_id=P000001180">����Ŭ ���۶�</a> <a href="movie_info_face.asp?tab=2&amp;m_id=M000104313" class="mdmore">������</a></p>
						<p><span><a href="javascript:facebookShare('http://movie.nate.com/movie_new/movie_info_movie.asp?m_id=M000104313');"><img src="../img/nate_movie/bl_nm_facebook.png" alt="���̽���"></a><a href="javascript:twitterShare('��Ʈ�ǰ� �ͽ���', 'http://movie.nate.com/movie_new/movie_info_movie.asp?m_id=M000104313');"><img src="../img/nate_movie/bl_nm_twitter.png" alt="Ʈ����"></a>
						
						</span></p><p class="movbt"><a href="/reserve/reserve_01.asp?firstStep=movie&amp;m_id=M000104313"><img src="/img/movie_new/btn_mreserve_b.gif" alt="�����ϱ�"></a></p>
					</div>
				</div>
				  -->
				
	 		   	 <!--<iframe width="100%" height="100%" src="http://movie.nate.com/movie_new/movie_info_movie.asp?m_id=M000104313" name="test" id="test" frameborder="0" scrolling="yes" align="left" longdesc="��ó : [����Ʈ:��ȭ]">�� �������� iframe�� ���� X </iframe> -->
	 		   	 
			    <footer class="modal-card-foot"><center>
			    </footer>
			  </div>
			</div>
			`
	    	,	
	         created : function() { // bus�� ���� �̺�Ʈ�� ȣ�� �� ������ �� �ֵ��� listener����  		�θ��� data�� �����ϰ�ʹٸ� $on�� $emit �� ���ؼ� ���� �����ϴ�!!
		        var self = this;
				bus.$on("imageTransport", function(list) { // ��� user�� point�� �ջ��Ѵ�. 
				self.movie=list.movie;
				self.title=list.title;
				self.director=list.director;		//alert�� ���ؼ� ��������� ���� ó���� handleImageDetails(item) ȣ��ǰ� emit�� ���ؼ� $on���� ��
				self.company=list.company;
				self.country=list.country;
				self.genre=list.genre;
				self.grade=list.grade;
				self.actor1=list.actor1;
				self.actor2=list.actor2;
				self.story=list.story;
				self.r_date=list.r_date;
				self.runningtime=list.runningtime;
				self.fileName=list.fileName;
				});
	
			}, 
			methods:{
				starColor2(event){
			         $(event.target).parent().children('span').removeClass('on');
			         $(event.target).addClass('on').prevAll('span').addClass('on');
			         return false;
			      }
			      ,scoring2(event){
			         var val=$(event.target).html();
			         var title= $(event.target).parent().parent().find('header > p').html();
			         
			         $.ajax({
			            url: '/starScore',
			            type: 'POST',
			            data:{"title":title,"rating":val}
			         });
			      }
				
			},
			
	}
}
})
 
/*

���� ������Ʈ�� ����Ϸ���, Vue.component(tagName, options)�� ����Ѵ�.
���� ������Ʈ�� ����Ϸ���, �ɼǰ�ü ���� components �Ʒ��� �������ش�.


�θ� ���� �������� ����,

Vue�� ������� ������ ���� ���
<car name="�ȳ��ϼ���"></car>

Vue�� �𵨰��� ���,
<car :name="���⿡ �� �𵨸��� ����"></car>

�� �������ش�.

�� ���� ������Ʈ�� �θ�κ��� �ޱ� ���ؼ��� props �迭�� �������ְ�,
props: ['������1', '������2', ...]

�̷��� �������־�߸� ������ ���޹ް� �ȴ�.




�ڽ� ������Ʈ���� ����� �ϱ� ���� ��� �� �ϳ��� �̺�Ʈ�� ����� �� �ִ�. �ڽ� ��ҷκ��� ���� �̺�Ʈ�� �ޱ� ���� v-on:�̺�Ʈ��="�̺�Ʈ�ڵ鷯" �� �����Ѵ�. ���⿡�� ������ �̺�Ʈ������ �ڽ� ��ҿ��� this.$emit('�̺�Ʈ��', ...�Ķ���͵�)�� �θ𿡰� �˷��� �� �ִ�.

�θ� �ڽİ��� �̺�Ʈ�� ���� Ŀ�´����̼��� ��� vuex ���� ����ؼ� �ܹ��� ������ �����ϸ� ������ ���� ������, ������ ���� �÷����� ����� ���鶧�� �����ϴ�.



beforeCreate
�ν��Ͻ��� ��� �ʱ�ȭ �� �� ������ ���� �� �̺�Ʈ / ������ ���� ���� ���������� ȣ�� �˴ϴ�.

created
�ν��Ͻ��� �ۼ��� �� ���������� ȣ��˴ϴ�. �� �ܰ迡�� �ν��Ͻ��� ������ ó��, ���� �Ӽ�, �޼���, ����/�̺�Ʈ �ݹ� ��� ���� �ɼ� ó���� �Ϸ��մϴ�. �׷��� ����Ʈ�� ���۵��� �ʾ����Ƿ� $el �Ӽ��� ���� ����� �� �����ϴ�.

beforeMount
����Ʈ�� ���۵Ǳ� �ٷ� ���� ȣ��˴ϴ�. render �Լ��� ó������ ȣ�� �˴ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

mounted
el�� ���� ������ vm.$el�� ��ü�� �ν��Ͻ��� ����Ʈ �� ���� ȣ��˴ϴ�. ��Ʈ �ν��Ͻ��� ���� ���� ������Ʈ�� ����Ʈ �Ǿ� ������, mounted�� ȣ�� �� �� vm.$el�� ���� �ȿ� �ְ� �˴ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

beforeUpdate
���� DOM�� �ٽ� �������ǰ� ��ġ �� �����Ͱ� ����Ǹ� ȣ��˴ϴ�.
�� �ſ��� �� ���� ���� ������ ������ �� ������ �߰��� �� �������� Ʈ�������� �ʽ��ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

updated
������ ���� �� ȣ��Ǿ� ���� DOM�� �ٽ� �������ǰ� ��ġ �˴ϴ�.
�� ���� ȣ��Ǹ� ������Ʈ�� DOM�� ������Ʈ �� ���°� �Ǿ� �� �ſ��� DOM �������� ������ �� �� �ֽ��ϴ�. �׷��� ��κ��� ��� ���ѷ����� �߻��� �� �����Ƿ� �ſ��� ���¸� �����ϸ� �ȵ˴ϴ�. ���� ��ȭ�� �����ϱ� ���ؼ� ���� �Ӽ� �Ǵ� [������(#watch)�� ����ϴ� ���� �� �����ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

activated
keep-alive �� ������Ʈ�� Ȱ��ȭ �� �� ȣ��˴ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

deactivated
keep-alive�� ������Ʈ�� ��Ȱ��ȭ �� �� ȣ��˴ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

beforeDestroy
Vue �ν��Ͻ��� ���ŵǱ� ���� ȣ��˴ϴ�. �� �ܰ迡�� �ν��Ͻ��� ���� �Ϻ��ϰ� �۵��մϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

destroyed
Vue �ν��Ͻ��� ���ŵ� �� ȣ��˴ϴ�. �� ���� ȣ��Ǹ� Vue �ν��Ͻ��� ��� ��Ƽ�갡 ���ε� ���� �ǰ� ��� �̺�Ʈ �����ʰ� ���ŵǸ� ��� ���� Vue �ν��Ͻ��� �����˴ϴ�.
�� ���� ������ ������ �� ȣ����� �ʽ��ϴ�

*/
 

</script>

<!--  ���⼭ ���� �߰����� ���� .css ��ũ�ɾ��ִ� �±׿� juwonmodal.css�� ������ component�� �߰� �� component template �±� �߰�  -->


</html>
