/**
 * 
 */
fetch('balanceYear.do')
.then(resolve => resolve.json())
.then(result => {
	const data = {
        "years": []
    };
    
 	result.years.forEach(year => {
    	data.years.push(year.pyear);
 	});
    
    const select = document.querySelector('.form-select');
    data.years.forEach(year => {
        const option = document.createElement('option');
        option.value = year;
        option.textContent = year;
        if (year === 2024) {
            option.selected = true;
        }
        select.appendChild(option);
    });
})
.catch(err => console.log(err))



    

    // JSON 데이터의 년도 목록을 순회하여 옵션 추가
    