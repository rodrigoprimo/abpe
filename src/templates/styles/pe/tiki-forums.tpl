{* $Id: tiki-forums.tpl 12906 2008-05-20 20:14:26Z pkdille $ *}

<h1><a class="pagetitle" href="tiki-forums.php">{tr}Forums{/tr}</a></h1>

<div class="navbar">
{if $tiki_p_admin_forum eq 'y'}
<span class="button2"><a href="tiki-admin_forums.php" class="linkbut">{tr}Admin forums{/tr}</a></span>
{/if}
</div>
<br />
<table class="normal">
  <tr>
    <th class="heading">{self_link _class="tableheading" _sort_arg='sort_mode' _sort_field='name'}{tr}Name{/tr}{/self_link}</th>
    
    {if $prefs.forum_list_topics eq 'y'}
	    <th class="heading">{self_link _class="tableheading" _sort_arg='sort_mode' _sort_field='threads'}{tr}Topics{/tr}{/self_link}</th>
    {/if}	

    {if $prefs.forum_list_posts eq 'y'}
	    <th class="heading">{self_link _class="tableheading" _sort_arg='sort_mode' _sort_field='comments'}{tr}Posts{/tr}{/self_link}</th>
    {/if}	

    {if $prefs.forum_list_ppd eq 'y'}
	    <th class="heading">{tr}PPD{/tr}</th>
    {/if}	

    {if $prefs.forum_list_lastpost eq 'y'}	
	    <th class="heading">{self_link _class="tableheading" _sort_arg='sort_mode' _sort_field='lastPost'}{tr}Last Post{/tr}{/self_link}</th>
    {/if}

    {if $prefs.forum_list_visits eq 'y'}
	    <th class="heading">{self_link _class="tableheading" _sort_arg='sort_mode' _sort_field='hits'}{tr}Visits{/tr}{/self_link}</th>
    {/if}	
  </tr>

{assign var=section_old value=""}
{section name=user loop=$channels}
{cycle values="odd,even" print=false}
{assign var=section value=$channels[user].section}
{if $section ne $section_old}
  {assign var=section_old value=$section}
  <tr><td class="third" colspan="6">{$section}</td></tr>
{/if}
<tr>
<td class="{cycle advance=false}"><span style="float:left">
{if ($channels[user].individual eq 'n') or ($tiki_p_admin eq 'y') or ($channels[user].individual_tiki_p_forum_read eq 'y')}
<a class="forumname" href="tiki-view_forum.php?forumId={$channels[user].forumId}">{$channels[user].name}</a>
{else}
{$channels[user].name}
{/if}
</span>
{if ($tiki_p_admin eq 'y') or (($channels[user].individual eq 'n') and ($tiki_p_admin_forum eq 'y')) or ($channels[user].individual_tiki_p_admin_forum eq 'y')}
<span style="float:right">
<a class="admlink" title="{tr}Configure Forum{/tr}" href="tiki-admin_forums.php?forumId={$channels[user].forumId}">{icon _id='page_edit'}</a>
</span>
{/if}{if $prefs.forum_list_desc eq 'y'}<br />
<div class="subcomment">{$channels[user].description|truncate:240:"...":true}</div>{/if}
</td>
{if $prefs.forum_list_topics eq 'y'}
	<td style="text-align:right;" class="{cycle advance=false}">{$channels[user].threads}</td>
{/if}
{if $prefs.forum_list_posts eq 'y'}
	<td style="text-align:right;" class="{cycle advance=false}">{$channels[user].comments}</td>
{/if}
{if $prefs.forum_list_ppd eq 'y'}
	<td style="text-align:right;" class="{cycle advance=false}">{$channels[user].posts_per_day|string_format:"%.2f"}</td>
{/if}
{if $prefs.forum_list_lastpost eq 'y'}	
<td class="{cycle advance=false}">
{if isset($channels[user].lastPost)}
	<p style="font-size:9pt;color:#666;margin:0;padding:0;">
	{$channels[user].lastPost|tiki_short_datetime}<br />
	<small><i>{$channels[user].lastPostData.title}</i> {tr}by{/tr} {$channels[user].lastPostData.userName}</small>
	</p>
{/if}
</td>
{/if}
{if $prefs.forum_list_visits eq 'y'}
	<td style="text-align:right;" class="{cycle advance=false}">{$channels[user].hits}</td>
{/if}	
</tr>
{sectionelse}
<td class="odd" colspan="6"><strong>{tr}No records found.{/tr}</strong><td>
{/section}
</table>
<br />

{pagination_links cant=$cant step=$prefs.maxRecords offset=$offset}{/pagination_links}

