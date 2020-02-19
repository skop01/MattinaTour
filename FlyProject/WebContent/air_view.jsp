<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String start=request.getParameter("start");
String arrive=request.getParameter("arrive");
String start_day=request.getParameter("start_day");
String arrive_day=request.getParameter("arrive_day");
%>  
 <jsp:include page="./user_head.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/air_view.css" />
<script>
function onReady(callback) {
	  var intervalId = window.setInterval(function() {
	    if (document.getElementsByTagName('body')[0] !== undefined) {
	      window.clearInterval(intervalId);
	      callback.call(this);
	    }
	  }, 2000);
	}

	function setVisible(selector, visible) {
	  document.querySelector("#loading").style.display = visible ? 'block' : 'none';
	}

	onReady(function() {
	  setVisible('.page', true);
	  setVisible('#loading', false);
	});
</script>

<style>
.page    { display: none; padding: 0 0.5em; }
.page h1 { font-size: 2em; line-height: 1em; margin-top: 1.1em; font-weight: bold; }
.page p  { font-size: 1.5em; line-height: 1.275em; margin-top: 0.15em; }

#loading {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 100;
  width: 100vw;
  height: 100vh;
  background-color: rgba(192, 192, 192, 0.5);
  background-image: url("https://t1.daumcdn.net/liveboard/emoticon/kakaofriends/v3/mujiandconspecial/emot_019_x3.gif");
  background-repeat: no-repeat;
  background-position: center;
}
</style>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    
                     

<div class="main_box"></div>
<div id="loading"></div>

</body>
<script>


fetch("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0", {
	"method": "POST",
	"headers": {
		"x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
		"x-rapidapi-key": "aca6611b20msh3994975508a209bp14158fjsnc5d6ce611f77",
		"content-type": "application/x-www-form-urlencoded"
	},
	body: new URLSearchParams({
		"inboundDate": "<%=arrive_day%>",
		"cabinClass": "economy",
		"children": "0",
		"infants": "0",
		"country": "KR",
		"currency": "KRW",
		"locale": "ko-KR",
		"originPlace": "<%=start%>-sky",
		"destinationPlace": "<%=arrive%>-sky",
		"outboundDate": "<%=start_day%>",
		"adults": "1"
	})
})
.then(res=> {
	console.log(res);
	const location=res.headers.get('Location');
	let sessionKey = '';
    let sessionKeyReversed = '';
    for (let i = location.length-1; i >= 0; i--) {
        if (location.charAt(i) == '/') { break }
        sessionKeyReversed += location.charAt(i)
    }
    for (let i = sessionKeyReversed.length-1; i >= 0; i--) {
        sessionKey += sessionKeyReversed.charAt(i)
    }
    return sessionKey
	
})
.then(sessionKey=>{
	console.log(sessionKey)
	fetch("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/%7B"+sessionKey+"%7D?pageIndex=0&pageSize=1000", {
	"method": "GET",
	"headers": {
		"x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
		"x-rapidapi-key": "aca6611b20msh3994975508a209bp14158fjsnc5d6ce611f77"
	}
})
.then((res) =>res.json())
.then((air)=>gentateHtml(air))

const gentateHtml=(res)=>{
	console.log(res)
const main_box = document.querySelector(".main_box")
const total = document.querySelector(".total")
const total_box1 = document.querySelector(".total_box1")
const total_box2 = document.querySelector(".total_box2")
const total_box3 = document.querySelector(".total_box3")
const total_box4 = document.querySelector(".total_box4")

	
    for(let i=0; i<res.Legs.length; i++ ){
    	 let total=document.createElement("div")
  	     total.className="total"
  	     main_box.appendChild(total)    	
    	
    	
    	   let total_box1=document.createElement("div")
    	   total_box1.className="total_box1"
    	   total.appendChild(total_box1)
    	   
    	   let total_box2=document.createElement("div")
    	   total_box2.className="total_box2"
    	   total_box1.appendChild(total_box2)
    	   
    	   let total_box3=document.createElement("div")
    	   total_box3.className="total_box3"
    	   total_box1.appendChild(total_box3)
    	   
    	   let total_box4=document.createElement("div")
    	   total_box4.className="total_box4"
    	   total_box1.appendChild(total_box4)
    	   
   for(let j=0; j<res.Itineraries.length; j++ ){
	
   for(let l=0; l<res.Carriers.length; l++ ){
	  if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId &&res.Legs[i].Carriers[0]==res.Carriers[l].Id){
		   let m1_box=document.createElement("div")
		    m1_box.className="m1_box"
		    total_box2.appendChild(m1_box)
		    
		 	let img= document.createElement("img")//항공사 이미지    		  	
		    img.src=res.Carriers[l].ImageUrl
		    m1_box.appendChild(img) 
		    
		
	  }
	    if(res.Legs[i].Id==res.Itineraries[j].InboundLegId &&res.Legs[i].Carriers[0]==res.Carriers[l].Id){
	    	console.log(res.Carriers[l].ImageUrl)
			   let mm1_box=document.createElement("div")
			    mm1_box.className="mm1_box"
			    total_box2.appendChild(mm1_box)
			    
			 	let img2= document.createElement("img")//항공사 이미지    		  	
			    img2.src=res.Carriers[l].ImageUrl
			    mm1_box.appendChild(img2) 
			    
			 
			    
		  }
	    

	 
   }
   for(let a=0; a<res.Places.length; a++ ){

   if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId && res.Legs[i].OriginStation==res.Places[a].Id){

	   let m2_box=document.createElement("div")
	    m2_box.className="m2_box"
	    	total_box2.appendChild(m2_box)
	    
	     let departure = document.createElement("div")//출발시간
    	departure.className="departure"
    	departure.textContent=timeTransfer(res.Legs[i].Departure)
    	m2_box.appendChild(departure)
    	 
	    
	     let start_code=document.createElement("div")	 
	   start_code.className="start_code"	      
	   start_code.textContent=res.Places[a].Code    	
	   m2_box.appendChild(start_code)

	  
   }
    
}
   
   
   
   
   
   
   if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId &&res.Legs[i].Stops.length<1){
	     
	   
	   let m4_box=document.createElement("div")
	    m4_box.className="m4_box"
	    total_box2.appendChild(m4_box)
	    
		let Duration=document.createElement("div")//총 비행시간
      	Duration.className="Duration"
       	Duration.textContent=durationTransfer (res.Legs[i].Duration)
      	m4_box.appendChild(Duration)
       
       let line_image=document.createElement("div")
       line_image.className="line_image"
       m4_box.appendChild(line_image)
       
       let hr=document.createElement("hr")//라인선
      	hr.className="line"
       line_image.appendChild(hr)
       
	 	let img2= document.createElement("img")//비행기 이미지    		  	
	    img2.src="./img/airplane.png"
	    line_image.appendChild(img2) 
	    
	    let turn=document.createElement("div")//경유지
		 	turn.className="turn" 
		    m4_box.appendChild(turn)	
       
	}
   
   
   
   for(let c=0; c<res.Places.length; c++){    
	   if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId && res.Legs[i].Stops[0]==res.Places[c].Id){
		   
		   let m4_box=document.createElement("div")
		   m4_box.className="m4_box"
		   total_box2.appendChild(m4_box)
		   
		 	let Duration=document.createElement("div")//총 비행시간
	       	Duration.className="Duration"
	        Duration.textContent=durationTransfer (res.Legs[i].Duration)
	        m4_box.appendChild(Duration)
	        
	        let line_image=document.createElement("div")
	        line_image.className="line_image"
	        m4_box.appendChild(line_image)
	        
	        let hr=document.createElement("hr")//라인선
	       	hr.className="line"
	        line_image.appendChild(hr)
	        
		 	let img2= document.createElement("img")//비행기 이미지    		  	
		    img2.src="./img/airplane.png"
		    line_image.appendChild(img2) 
	        
	       	
	    let turn=document.createElement("div")//경유지
	 	turn.className="turn"
	    turn.textContent=res.Places[c].Code  	 
	    m4_box.appendChild(turn)
	    
	    for(let d=0; d<res.Places.length; d++){   
	 	   if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId && res.Legs[i].Stops[1]==res.Places[d].Id){
	 		   
	 		    let turn2=document.createElement("div")//경유지
	 		 	turn2.className="turn2"
	 		    turn2.textContent=res.Places[d].Code  	 
	 		    m4_box.appendChild(turn2)	   
	 		}
	 	   }
		   
		   
		   
	 	
	   }
	   }
	       
	   

	   
	   
   for(let b=0; b<res.Places.length; b++ ){
   if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId && res.Legs[i].DestinationStation==res.Places[b].Id){
		
	   
	   let m3_box=document.createElement("div")
	    m3_box.className="m3_box"
	    	total_box2.appendChild(m3_box)
	    
	    
	   let arrival = document.createElement("div")//도착시간
	    arrival.className="arrival"
	    arrival.textContent=timeTransfer(res.Legs[i].Arrival)
	    m3_box.appendChild(arrival)
   
    	let arrive_code=document.createElement("div")
	        
	   arrive_code.className="arrive_code"	    
	   arrive_code.textContent=res.Places[b].Code    
	
	   m3_box.appendChild(arrive_code)
    	
      
   
}     
}
   
   
  
   
if(res.Legs[i].Id==res.Itineraries[j].OutboundLegId){
	
	let m6_box=document.createElement("div")
    m6_box.className="m6_box"
    total_box4.appendChild(m6_box)
    
    
    let price=document.createElement("div")
 
   
    price.className="price"
    price.textContent=res.Currencies[0].Symbol+priceTransfer (res.Itineraries[j].PricingOptions[0].Price)
    m6_box.appendChild(price)
    
    
    let priceUrl=document.createElement("a")//구매 url
    priceUrl.className="priceUrl"
    priceUrl.textContent="선택  "
    priceUrl.href=res.Itineraries[j].PricingOptions[0].DeeplinkUrl
    m6_box.appendChild(priceUrl)
    
   
        

}          
}
}
}


//null값 체크 
function isEmptyObject(param) {
  return Object.keys(param).length === 0 && param.constructor === Object;
}

//출발,도착 시간 변환
function timeTransfer (time) {
    let hour = parseInt(time.slice(11, 13))
    if (hour > 12) {
      hour -= 12
      return "오후 " + hour + ":" + time.slice(14, 16)
    } else {
      return "오전 " + hour + ":" + time.slice(14, 16)
    }
  }
  
  
//총 비행시간 변화
 function durationTransfer (duration) {
    if (parseInt(duration)%60 == 0) {
      return parseInt(parseInt(duration)/60) + "시간 "
    }
    return parseInt(parseInt(duration)/60) + "시간 " + parseInt(duration)%60 + "분"
    }

 

//가격 변환
 function priceTransfer (price) {
     price = price.toString()
     for (let i=0; i<price.length; i++) {
       if (price[i] == ".")
         price = price.slice(0,i)
     }
     let result = ''
     for (let i=0; i<price.length; i++) {
       if (i>0 && i%3 == 0)
         result += ","
       result += price[price.length-i-1]
     }
     let reverse = ''
     for (let i=result.length-1; i>=0; i--) {
       reverse += result[i]
     }
     return reverse
   }





})
.catch(err => {
	console.log(err);
	
});


</script>

</html>
