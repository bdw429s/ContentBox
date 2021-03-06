<cfoutput>
<!--- entries --->
<table name="entries" id="entries" class="tablesorter table table-hover table-striped table-condensed" width="98%">
	<thead>
		<tr>
			<th>Entry Title</th>
			<th width="40" class="center"><i class="icon-globe icon-large"></i></th>
			<th width="120" class="center">Select</th>
		</tr>
	</thead>
	<tbody>
		<cfloop array="#prc.entries#" index="entry">
		<tr id="contentID-#entry.getContentID()#" <cfif NOT entry.getIsPublished()>class="warning"</cfif>>
			<td>
				<!--- Title --->
				<strong>#entry.getTitle()#</strong>
				<br>
				<span class="label">Published: #entry.getDisplayPublishedDate()#</label>
			</td>
			<td class="center">
				<cfif entry.getIsPublished()>
					<i class="icon-ok icon-large textGreen"></i>
					<span class="hidden">published</span>
				<cfelse>
					<i class="icon-remove icon-large textRed"></i>
					<span class="hidden">draft</span>
				</cfif>
			</td>
			<td class="center">
				<div class="btn-group">
				<button class="btn" onclick="return selectCBContent( '#entry.getSlug()#', '#entry.getTitle()#', 'entryssl' )" title="SSL Link"><i class="icon-lock icon-large"></i></button>
				<button class="btn" onclick="return selectCBContent( '#entry.getSlug()#','#entry.getTitle()#','entry' )" title="Link"><i class="icon-link icon-large"></i></button>
				</div>
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>

<!--- Paging --->
#prc.pagingPlugin.renderit(foundRows=prc.entriesCount, link=prc.pagingLink, asList=true)#
</cfoutput>