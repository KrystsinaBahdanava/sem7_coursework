//alert(1);
//alert( document.body instanceof HTMLBodyElement );
var test = 0;
$(document).ready(function(){
//alert(test);
//alert($("#Test").text());    
});

var req = new XMLHttpRequest();
var url = '/data';

req.open('GET',url,true); // set this to POST if you would like

req.addEventListener('load',onLoad);

req.addEventListener('error',onError);

req.send();

function onLoad() {
    var response = '';
     response = this.responseText;
    // var elem = document.getElementById('rest');
    //elem.remove(elem);
    var parsedResponse = JSON.parse(response);
   // access your data newly received data here and update your DOM with appendChild(), findElementById(), etc...
    var restaurant = parsedResponse.restaurant;
    var schedule = parsedResponse.sched;
    var mark = parsedResponse.mark;
    var logo = parsedResponse.logo;
    var category = parsedResponse.cat;
    var category_all = parsedResponse.categories;
    restaurant.forEach(function(item, i, restaurant) {
    var newLi = document.createElement('li');
    newLi.id = 'rest';
  newLi.innerHTML = '<a href="#"><img src="'+logo[i]+'" alt="" /></a>'+
				    	'<div class="product-info">'+
				    		'<h3 id="restName" class="restName">'+restaurant[i]+'</h3>'+
				    		'<div class="product-desc">'+
								'<h4>'+category[i]+'</h4>'+
				    			'<p>'+schedule[i]+'<br /></p>'+
				    			'<strong class="price">Рейтинг: '+Math.round(mark[i] * 100) / 100+'</strong>'+
				    		'</div>'+
				    	'</div>';
          li_rest.insertBefore(newLi, li_rest.children[i]);

    });
    
    category_all.forEach(function(item, i, category_all) {
        var cats = document.createElement('li');
        cats.id = 'cat'; 
        cats.innerHTML = '<a href="#">'+category_all[i]+'</a>'
        categories.insertBefore(cats, categories.children[i]);
    });
}

function onError() {
  // handle error here, print message perhaps
  console.log('error receiving async AJAX call');
}