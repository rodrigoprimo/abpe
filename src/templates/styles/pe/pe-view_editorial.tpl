
<table  cellpadding="0" cellspacing="0">
	<tr>
		<td>


<div class="editorial">
	<div id="conteudo">
		{if $editorial.hasImage eq 'y' && $editorial.useImage eq 'y'}
			<a href="tiki-read_article.php?articleId={$editorial.articleId}"><img class="editorialimage" src="article_image.php?id={$editorial.articleId}" {if $editorial.image_x > 0} width="{$editorial.image_x}"{/if}{if $editorial.image_y > 0 } height="{$editorial.image_y}"{/if}/></a>
		{/if}
		<div class="articletitle">
			<span class="titlea"><a href="tiki-read_article.php?articleId={$editorial.articleId}">{$editorial.title|truncate:58}</a></span><br />
			<span class="titleb">
			{$editorial.publishDate|tiki_short_date}&nbsp;
			({$editorial.nbreads} {tr}Reads{/tr})
			</span><br />
		</div>
			<div class="articleheading">
				<div class="articleheadingtext">
                                    {if $destaque ne ''}
                                        {$editorial.parsed_heading|truncate:160}
                                    {else}
                                        {$editorial.parsed_heading|truncate:320}
                                    {/if}
                                </div>
			</div>
	</div>
</div>
</td>

{if $destaque ne ''}
  <td>
    <div class="destaque">
        {$destaque}
    </div>
  </td>
{/if}

</tr>
</table>
