
/**
 * add to the cart
 */
function buy(goodid){
	$.post("goods_buy", {goodsid:goodid}, function(data){
		if(data=="ok"){
			layer.msg("Add to Cart!", {time:800}, function(){
				location.reload();
			});
		}else if(data=="fail"){
			layer.msg("Out of stock, please purchase other items!", {time:800}, function(){
				
			});
		}
//		if(data=="ok"){
//			layer.msg("操作成功!", {time:800}, function(){
//				location.reload();
//			});
//		}else if(data=="login"){
//			alert("请登录后购买!");
//			location.href="login.jsp";
//		}else if(data=="empty"){
//			alert("库存不足!");
//			location.reload();
//		}else{
//			alert("请求失败!");
//		}
		//location.href="login.jsp"
		//layer.msg("操作成功!", {time:800}, function(){
		//	location.reload();
		//});
	});
}
/**
 * Shopping cart minus
 */
function lessen(goodsid){
	$.post("goods_lessen", {goodsid:goodsid}, function(data){
		if(data=="ok"){
			layer.msg("Successful operation!", {time:800}, function(){
				location.reload();
			});
		}
//		if(data=="ok"){
//			layer.msg("Successful operation!", {time:800}, function(){
//				location.href="cart.action";
//			});
//		}else if(data=="login"){
//			alert("Please log in to operate!");
//			location.href="login.jsp";
//		}else{
//			alert("Request failed!");
//		}
	});
}
/**
 * 购物车删除
 */
function deletes(goodid){
	$.post("delete.action", {goodid:goodid}, function(data){
		if(data=="ok"){
			layer.msg("Successfully Deleted!", {time:800}, function(){
				location.href="cart.action";
			});
		}else if(data=="login"){
			alert("Please log in to delete!");
			location.href="login.jsp";
		}else{
			alert("Request failed!");
		}
	});
}