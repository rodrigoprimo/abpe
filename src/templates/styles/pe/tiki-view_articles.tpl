{if $type == 'noticia'}
	{assign var=title value='Notícias'}
{elseif $type == 'editorial'}
	{assign var=title value='Editoriais'}
{elseif $type == 'revista'}
	{assign var=title value='Edições da revista'}
{elseif $type == 'artigo'}
	{assign var=title value='Artigos'}
{/if}

{section name=ix loop=$listpages}
	{if $listpages[ix].disp_article eq 'y'}
		<div class="article">
			{if $listpages[ix].show_topline eq 'y' and $listpages[ix].topline}<div class="articletopline">{$listpages[ix].topline}</div>{/if}
			<div class="articletitle">
				<span class="titlea"><a href="tiki-read_article.php?articleId={$listpages[ix].articleId}">{$listpages[ix].title}</a></span><br />
				{if $listpages[ix].show_subtitle eq 'y' and $listpages[ix].subtitle}<div class="articlesubtitle">{$listpages[ix].subtitle}</div>{/if}
				{if ($listpages[ix].show_author eq 'y')
				 or ($listpages[ix].show_pubdate eq 'y')
				 or ($listpages[ix].show_expdate eq 'y')
				 or ($listpages[ix].show_reads eq 'y')}	
					<span class="titleb">
						{if $listpages[ix].show_author eq 'y'}	
							{tr}By:{/tr} {$listpages[ix].authorName}&nbsp;
						{/if}
						{if $listpages[ix].show_pubdate eq 'y'}
							{tr}on:{/tr} {$listpages[ix].publishDate|tiki_short_datetime}&nbsp;
						{/if}
						{if $listpages[ix].show_expdate eq 'y'}
							{tr}expires:{/tr} {$listpages[ix].expireDate|tiki_short_datetime}&nbsp;
						{/if}
						{if $listpages[ix].show_reads eq 'y'}
							({$listpages[ix].nbreads} {tr}Reads{/tr})
						{/if}
					</span><br />
				{/if}
			</div>
			<div class="articleheading">
				<table  cellpadding="0" cellspacing="0">
					<tr><td valign="top">
						{if $listpages[ix].show_image eq 'y'}
							{if $listpages[ix].useImage eq 'y'}
								{if $listpages[ix].hasImage eq 'y'}
									<a href="tiki-read_article.php?articleId={$listpages[ix].articleId}" title="{if $listpages[ix].show_image_caption and
$listpages[ix].image_caption}{$listpages[ix].image_caption}{else}{$listpages[ix].topicName}{/if}"><img {if $listpages[ix].isfloat eq 'y'}style="margin-right:4px;float:left;"{else}class="articleimage"{/if} 
alt="{if $listpages[ix].show_image_caption and $listpages[ix].image_caption}{$listpages[ix].image_caption}{else}{$listpages[ix].topicName}{/if}" 
border="0" src="article_image.php?id={$listpages[ix].articleId}" {if $listpages[ix].image_x > 0} width="{$listpages[ix].image_x}"{/if}{if $listpages[ix].image_y > 0 } height="{$listpages[ix].image_y}"{/if} /></a>
								{else}
									<a href="tiki-read_article.php?articleId={$listpages[ix].articleId}" title="{if $listpages[ix].show_image_caption and
$listpages[ix].image_caption}{$listpages[ix].image_caption}{else}{$listpages[ix].topicName}{/if}"><img {if $listpages[ix].isfloat eq 'y'}style="margin-right:4px;float:left;"{else}class="articleimage"{/if} 
alt="{if $listpages[ix].show_image_caption and $listpages[ix].image_caption}{$listpages[ix].image_caption}{else}{$listpages[ix].topicName}{/if}" 
border="0" src="topic_image.php?id={$listpages[ix].topicId}" /></a>
								{/if}
							{else}
								{section name=it loop=$topics}
									{if ($topics[it].topicId eq $listpages[ix].topicId) and ($topics[it].image_size > 0)}
										<a href="tiki-read_article.php?articleId={$listpages[ix].articleId}" title="{if $listpages[ix].show_image_caption and
$listpages[ix].image_caption}{$listpages[ix].image_caption}{else}{$listpages[ix].topicName}{/if}"><img {if $listpages[ix].isfloat eq 'y'}style="margin-right:4px;float:left;"{else}class="articleimage"{/if} 
alt="{if $listpages[ix].show_image_caption and $listpages[ix].image_caption}{$listpages[ix].image_caption}{else}{$listpages[ix].topicName}{/if}" 
border="0" src="topic_image.php?id={$listpages[ix].topicId}" /></a>
									{/if}
								{/section}
							{/if}
						{/if}
						{if $listpages[ix].isfloat eq 'n'}
							</td><td  valign="top">
						{/if}
						<div class="articleheadingtext">{$listpages[ix].parsed_heading}</div>
					</td></tr>
				</table>
			</div>
			<div class="articletrailer">
				<table class="wikitopline">
					<tr>
						{if ($listpages[ix].size > 0) or (($prefs.feature_article_comments eq 'y') and ($tiki_p_read_comments eq 'y'))}
  							{if ($prefs.feature_article_comments eq 'y') and ($tiki_p_read_comments eq 'y') and ($listpages[ix].allow_comments eq 'y')}
    							<td class="articletrailer">
      								<a href="tiki-read_article.php?articleId={$listpages[ix].articleId}&amp;show_comzone=y#comments" class="linkbut {if $listpages[ix].comments_cant > 0}highlight{/if}">
	        							{if $listpages[ix].comments_cant == 0 or ($tiki_p_read_comments  == 'n' and $tiki_p_post_comments  == 'y')}
    										{tr}Add Comment{/tr}
        								{elseif $listpages[ix].comments_cant == 1}
          									{tr}1 comment{/tr}
        								{else}
          									{$listpages[ix].comments_cant}&nbsp;{tr}comments{/tr}
        								{/if}
      								</a>
    							</td>
  							{/if}
						{/if}
						<td style="text-align:right;">
							{if $tiki_p_edit_article eq 'y' or ($listpages[ix].author eq $user and $listpages[ix].creator_edit eq 'y')}
  								<a class="trailer" href="tiki-edit_article.php?articleId={$listpages[ix].articleId}">{icon _id='page_edit'}</a>
							{/if}
							{if $tiki_p_remove_article eq 'y'}
  								&nbsp;&nbsp;<a class="trailer" href="tiki-list_articles.php?remove={$listpages[ix].articleId}">{icon _id='cross' alt='{tr}Remove{/tr}'}</a>
							{/if}
						</td>
					</tr>
				</table>
			</div>
		</div>
	{/if}
{sectionelse}
	{tr}No articles.{/tr}
{/section}

{pagination_links cant=$cant step=$maxArticles offset=$offset}{/pagination_links}