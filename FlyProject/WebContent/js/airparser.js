
fetch("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0", {
	"method": "POST",
	"headers": {
		"x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
		"x-rapidapi-key": "aca6611b20msh3994975508a209bp14158fjsnc5d6ce611f77",
		"content-type": "application/x-www-form-urlencoded"
	},
	body: new URLSearchParams({
		"cabinClass": "business",
		"children": "0",
		"infants": "0",
		"country": "US",
		"currency": "USD",
		"locale": "en-US",
		"originPlace": "SFO-sky",
		"destinationPlace": "LHR-sky",
		"outboundDate": "2020-05-01",
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
	fetch("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/%7B"+sessionKey+"%7D?pageIndex=0&pageSize=10", {
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
	const html=`
		<div class="name">${res.Carriers[0].Name}</div>
		<img src=${res.Carriers[0].ImageUrl}>
		<div class="start">${res.Legs[0].Departure}</div>
		<div class="arrive">${res.Legs[0].Arrival}</div>
		<a href=${res.Itineraries[0].PricingOptions[0].DeeplinkUrl}>선택</a>
		
		`
	const airlist=document.querySelector('.airlist')
	airlist.innerHTML=html

}

})
.catch(err => {
	console.log(err);
	
});