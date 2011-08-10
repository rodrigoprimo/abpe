<h1>Agenda</h1>
{if $tiki_p_admin eq 'y'}
        <a href="/webcalendar/">Administrar agenda</a>
        <br />
{/if}
<br />
{foreach from=$days item=day}
	{if !empty($day.entries) || !empty($day.rentries)}
		<h4 class="agenda">{$day.day}</h4>
		<ul class="agenda">
			{foreach from=$day.entries item=entry}	
				<li><a href="agenda.php?id={$entry.cal_id}">{$entry.cal_name}</a></li>
        		{/foreach}
			{foreach from=$day.rentries item=entry}
				<li><a href="agenda.php?id={$entry.cal_id}">{$entry.cal_name}</a></li>
			{/foreach}
			
		</ul>
		<br />
	{/if}
{/foreach}
