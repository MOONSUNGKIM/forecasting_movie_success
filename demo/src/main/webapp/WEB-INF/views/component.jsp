<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/demo/css/juwonmodal.css" />

</head>
<body>


	<!DOCTYPE html>
<html>

<head>



<style>
.mc {
	border: 0px solid #000;
	padding-bottom: 20px
}

span {
	border: 1px solid #000;
	float: left;
	margin-right: 100px;
	padding: 50px;
}

div {
	padding-bottom: 10px
}
</style>



</head>

<body>



	<div id="mc"></div>



	<div id="bank"></div>



	<!-- mcComponent -->

	<template id="mcComponent">

	<div class='mc'>

		<select v-model='select'>

			<option>1</option>

			<option>2</option>

		</select> {{user}} : {{result}}

		<!-- v-on:click => �ڽ� component�� sendtobank �޼��带 ȣ���Ѵ�. -->

		<button v-on:click='sendtobank'>send to bank</button>

		<br> <br>



		<!-- v-on:send => $.emit('send') �̺�Ʈ�� �߻��ϸ�, parent component�� checkresult �޼��尡 ȣ��ȴ� -->

		<!-- v-bind:mypoint => parent data�� �ִ� point ���� ���� child component�� ����ϱ� ���� mypoint��� �Ӽ�(props)�� ��´� -->

		<user-component v-on:send='checkresult' v-bind:mypoint='point'></user-component>

		<user-component v-on:send='checkresult' v-bind:mypoint='point'></user-component>



		<hr />

	</div>

	</template>



	<!-- userComponent -->

	<template id="userComponent">

	<div>

		<input type='text' v-model='user'><input type='text'
			v-model='num'>

		<!-- button click�̺�Ʈ �߻� �� dosend method ȣ�� -->

		<button v-on:click='doSend'>send</button>

		<!-- mypoint ��ü�ȿ� �ش� user�̸��� �Ӽ� ������ ����Ѵ� -->

		<br> point : [ {{mypoint[user]}} ]

	</div>

	</template>





	<script src="/js/vue.js"></script>

	<script>
		// ���� �ٸ� component���� ������ �����ϱ� ���� ��� 

		var bus = new Vue();

		// ����� component (child component) 

		Vue.component("userComponent", {

			template : "#userComponent",

			props : [ "mypoint" ], // parent component�� �ִ� point ������ ����ϱ� ���� ���� 

			data : function() {

				return {

					user : "",

					num : 0

				};

			},

			methods : {

				doSend : function() {

					this.$emit("send", { // parent component�� checkresult method�� ȣ���ϵ��� �̺�Ʈ �߻� 

						user : this.user,

						num : this.num

					});

				}

			}

		});

		// MC Component(parent) 

		new Vue({

			el : "#mc",

			template : "#mcComponent",

			data : function() {

				return {

					user : "",

					select : 0,

					result : false,

					point : {

						user1 : 0,

						user2 : 0

					}

				};

			},

			methods : {

				checkresult : function(obj) { // mc�� ������ ���� ������ ���, �ش� user���� point 100 ���� 

					this.user = obj.user;

					this.result = (obj.num === (this.select));

					if (this.result) {

						this.point[obj.user] += 100;

					}

				},

				sendtobank : function() { // user���� ���� point�� bank�� �����Ͽ� �ջ� 

					bus.$emit("calc_total_point", this.point);

				}

			}

		});

		// bank Component (other component) 

		new Vue({

			el : "#bank",

			template : "<div> total point : {{total_point}} </div>",

			data : function() {

				return {

					total_point : 0

				};

			},

			created : function() { // bus�� ���� �̺�Ʈ�� ȣ�� �� ������ �� �ֵ��� listener����  

				var self = this;

				bus.$on("calc_total_point", function(points) { // ��� user�� point�� �ջ��Ѵ�. 

					for ( var key in points) {

						self.total_point += points[key];

					}

				});

			}

		});
	</script>




</body>
</html>
