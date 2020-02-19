function fuck() {
	const indate=document.querySelector('#arrive_day').value;
	const outdate=document.querySelector('#start_day').value;
	const api={
			"inboundDate": indate,
			"cabinClass": "business",
			"children": "0",
			"infants": "0",
			"country": "KR",
			"currency": "KRW",
			"locale": "ko-KR",
			"originPlace": "ICN-sky",
			"destinationPlace": "PUS-sky",
			"outboundDate": outdate,
			"adults": "1"
		};


	fetch("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0", {
		"method": "POST",
		"headers": {
			
			"Access-Control-Expose-Headers": "Location",
			"x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
			"x-rapidapi-key": "e2b10f9ffdmsh38e70977a0e7bbdp11f444jsn3f4b92c83b27",
			"content-type": "application/x-www-form-urlencoded"
			
		},
		body :JSON.stringify(api)
	})
	.then(response => {
		if(response.status===400){
			return;
		}else if(response.status===200||response.status===201){
			
			console.log(response);				
			console.log(api);				
		}
		
	})
	.catch(err => {
	
		console.log(err);
	});
}