//= require active_admin/base
//= require autocomplete-rails
$(function(){
	$(".select_product").live("change", function() {
		var select_product = "#" + $(this).attr("id");
		var product_id = $(this).val();
		if(product_id == "") product_id="0";
		jQuery.getJSON('/product/find_unit_price/' + product_id, function(data){
			var unit_price = $(select_product).parent().parent().find(".unit_price_col").first();
			var quantity =  $(select_product).parent().parent().find(".quantity_col").first();
			var total =  $(select_product).parent().parent().find(".total_col").first();
			unit_price.val(data.unit_price);
			if(quantity.val()==""){ 
				total.val(0);
			}else {
				total.val(unit_price.val()* quantity.val());	
			}
		});
	});
    
	$(".can_change_col").live("blur", function() {
			var select_product = "#" + $(this).attr("id");
			var unit_price = $(select_product).parent().parent().find(".unit_price_col").first();
			var quantity =  $(select_product).parent().parent().find(".quantity_col").first();
			var total =  $(select_product).parent().parent().find(".total_col").first();
			if(quantity.val()==""){ 
				total.val(0);
			}else {
				total.val(unit_price.val()* quantity.val());	
			}
	});
});