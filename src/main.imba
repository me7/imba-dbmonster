let rowData = ['cluster1', 9, 2.43, 81.6, 7.41, 8.37, 0.04]

tag Row < tr
	<self>
		for col in data
			<td [bd:1px]> "{col}"

tag App
	<self>
		<table[bd:1 border-collapse:collapse] >
			<Row data=rowData>

imba.mount <App>
