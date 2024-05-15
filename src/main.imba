import './bootstrap.min.css'
import './style.css'

var row = []
var rows = []
perfMonitor.startFPSMonitor();
perfMonitor.startMemMonitor();
perfMonitor.initProfiler('view update');

def redraw
	rows = ENV.generateData().toArray()
	imba.commit!


tag Row < tr
	<self>
		if data
			query = data.lastSample.topFiveQueries
			<td.dbname> "{data.dbname}"
			<td.query-count> 
				<span .{data.lastSample.countClassName}> "{data.nbQueries}"
			for cell, i in query
				<td .Query .{cell.elapsedClassName}> 
					<span> "{cell.formatElapsed || ''}"
					<div.popover.left>
						<div.popover-content> "{cell.query}"
						<div.arrow>
			else
				<p> "no data"

tag App
	<self>
		# <pre> "{JSON.stringify(rows[0], '-', 2)}"
		# <button @click=redraw!> "Redraw"
		global.perfMonitor.startProfile('view update')
		<table.table .table-striped latest-data>
			<tbody>
				for row in rows
					<Row data=row>
		global.perfMonitor.endProfile('view update')
		redraw!

imba.mount <App>
