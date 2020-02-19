const picker = new Lightpick({
	
    field: document.getElementById('start_day'),
    secondField: document.getElementById('arrive_day'),
    thirdField: document.getElementById('start_day2'),
    repick: false,
    singleDate: false,
    selectForward: true,
    numberOfMonths: 1,
    footer: true,
    minDate: moment().startOf('day'), 
    format: 'YYYY-MM-DD',
    weekdayStyle: 'short',   
    dropdowns: {
    	
    	        years:false,
    	        months: false,
    	
    	      },
    	
});
