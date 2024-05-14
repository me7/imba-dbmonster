let rowData = ['cluster1', 9, 2.43, 81.6, 7.41, 8.37, 0.04]
tag App
	<self>
		for i in rowData
			<div> "{i}"

imba.mount <App>
