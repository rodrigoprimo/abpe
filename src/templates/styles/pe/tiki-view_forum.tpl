{* $Id: tiki-view_forum.tpl 13616 2008-07-12 19:30:31Z jonnybradley $ *}

<h1><a class="pagetitle" href="tiki-view_forum.php?forumId={$forum_info.forumId}">{$forum_info.name}</a></h1>
<!-- {if $forum_info.show_description eq 'y'}
<div class="description">{$forum_info.description}</div> 
<br />
{/if}-->

<span class="trilha_forum"><a class="link" href="tiki-forums.php">{tr}Forums{/tr}</a> -&gt; <a class="link" href="tiki-view_forum.php?forumId={$forumId}">{$forum_info.name}</a></span>

<div class="navbar">
<table width="97%">
<tr>
<td>
{if ($tiki_p_forum_post_topic eq 'y' and ($prefs.feature_wiki_discuss ne 'y' or $prefs.$forumId ne $prefs.wiki_forum_id)) or $tiki_p_admin_forum eq 'y'}
<a class="novoassunto" href="tiki-view_forum.php?openpost=1&amp;forumId={$forum_info.forumId}&amp;comments_threadId=0&amp;comments_threshold={$comments_threshold}&amp;comments_offset={$comments_offset}&amp;thread_sort_mode={$thread_sort_mode}&amp;comments_per_page={$comments_per_page}" {if !isset($comments_threadId) or $comments_threadId eq 0}onclick="javascript:show('forumpost');return false;"{/if}>
<!-- {tr}New Topic{/tr} -->
<img src="styles/pe/novoassunto_btn.png" /></a>
{/if}
{if $tiki_p_admin_forum eq 'y'}
<a class="linkbut" href="tiki-admin_forums.php?forumId={$forum_info.forumId}">{tr}Edit Forum{/tr}</a>
{/if}

{if $queued > 0}
  <a class="linkbut highlight" href="tiki-forum_queue.php?forumId={$forumId}">{tr}Manage Message Queue{/tr}&nbsp;({$queued})</a>
{/if}

{if $reported > 0}
  <a class="linkbut highlight" href="tiki-forums_reported.php?forumId={$forumId}">{tr}Manage Reported Messages{/tr}&nbsp;({$reported})</a>
{/if}

</td>
<td style="text-align:right;">
{if $prefs.rss_forum eq 'y'}
<a href="tiki-forum_rss.php?forumId={$forumId}"><img src='img/rss.png' border='0' alt='{tr}RSS feed{/tr}' title='{tr}RSS feed{/tr}' /></a>
{/if}
{if $user and $prefs.feature_user_watches eq 'y'}
		{if $user_watching_forum eq 'n'}
			<a href="tiki-view_forum.php?forumId={$forumId}&amp;watch_event=forum_post_topic&amp;watch_object={$forumId}&amp;watch_action=add" title='{tr}Monitor Topics of this Forum{/tr}'>{icon _id='eye' alt='{tr}Monitor Topics of this Forum{/tr}'}</a>
		{else}
			<a href="tiki-view_forum.php?forumId={$forumId}&amp;watch_event=forum_post_topic&amp;watch_object={$forumId}&amp;watch_action=remove" title='{tr}Stop Monitoring Topics of this Forum{/tr}'>{icon _id='no_eye' alt='{tr}Stop Monitoring Topics of this Forum{/tr}'}</a>
		{/if}			
{/if}
{if $user and $prefs.feature_user_watches eq 'y'}
	{if $user_watching_forum_topic_and_thread eq 'n'}
		<a href="tiki-view_forum.php?forumId={$forumId}&amp;watch_event=forum_post_topic_and_thread&amp;watch_object={$forumId}&amp;watch_action=add" title='{tr}Monitor Topics and Threads of this Forum{/tr}'>{icon _id='eye_magnifier' alt='{tr}Monitor Topics and Threads of this Forum{/tr}'}</a>
	{else}
		<a href="tiki-view_forum.php?forumId={$forumId}&amp;watch_event=forum_post_topic_and_thread&amp;watch_object={$forumId}&amp;watch_action=remove" title='{tr}Stop Monitoring Topics and Threads of this Forum{/tr}'>{icon _id='no_eye' alt='{tr}Stop Monitoring Topics and Threads of this Forum{/tr}'}</a>
	{/if}
{/if}

<div class="navbar" align="right" >
	{if $user and $prefs.feature_user_watches eq 'y'}
		{if $category_watched eq 'y'}
			{tr}Watched by categories{/tr}:
			{section name=i loop=$watching_categories}
				<a href="tiki-browse_categories?parentId={$watching_categories[i].categId}">{$watching_categories[i].name}</a>&nbsp;
			{/section}
		{/if}	
	{/if}
</div>

{if $prefs.feature_forum_content_search eq 'y' and $prefs.feature_search eq 'y'}
  <form class="forms" method="get" action="{if $prefs.feature_forum_local_tiki_search eq 'y'}tiki-searchindex.php{else}tiki-searchresults.php{/if}">
    <input name="highlight" size="30" type="text" />
    <input type="hidden" name="where" value="forums" />
    <input type="hidden" name="forumId" value="{$forum_info.forumId}" />
    <input type="image" src="styles/pe/buscar_btn.png" class="wikiaction" name="search" value="{tr}Find{/tr}"/>
  </form>
{/if}

</td>
</tr>
</table>
</div>

{if $unread > 0}
<a class='link' href='messu-mailbox.php'>{tr}You have {$unread} unread private messages{/tr}<br /></a>
{/if}

{if $was_queued eq 'y'}
{remarksbox type="warning" title="{tr}Information{/tr}" icon="information"}
{tr}Your message has been queued for approval, the message will be posted after a moderator approves it.{/tr}
{/remarksbox}
{/if}

{if $tiki_p_forum_post_topic eq 'y'}
  {if $comment_preview eq 'y'}
  <br /><br />
  <b>{tr}Preview{/tr}</b>
  <div class="commentscomment">
  <div class="commentheader">
  <table>
  <tr>
  <td>
  <div class="commentheader">
  <span class="commentstitle">{$comments_preview_title}</span><br />
  {tr}by{/tr} {$user|userlink}
  </div>
  </td>
  <td valign="top" align="right" >
  <div class="commentheader">
  </div>
  </td>
  </tr>
  </table>
  </div>
  <div class="commenttext">
  {$comments_preview_data}
  <br />
  </div>
  </div>
  {/if}

  {if $warning eq 'y'}
  <br /><br />
  <div class="simplebox highlight">{icon _id=exclamation alt="{tr}Error{/tr}" style="vertical-align:middle"} {tr}You have to enter a title and text{/tr}!
  </div>
  <br />
  {/if}
{if $contribution_needed eq 'y'}
  <br /><br />
  <div class="simplebox highlight">{icon _id=exclamation alt="{tr}Error{/tr}" style="vertical-align:middle"} {tr}A contribution is mandatory{/tr}
  </div>
  <br />
  {/if}
{if $duplic eq 'y'}
<div class="simplebox highlight">{icon _id=exclamation alt="{tr}Error{/tr}" style="vertical-align:middle"}{tr}Another post with the same title and content already exists.{/tr}<br />{tr}Please change your title or content then click Post.{/tr}</div><br />
{/if}

<div id="forumpost" style="display:{if $comments_threadId > 0 or $openpost eq 'y' or $warning eq 'y' or $comment_title neq '' or $smarty.request.comments_previewComment neq ''}block{else}none{/if};">
  {if $comments_threadId > 0}
    {tr}Editing{/tr}: {$comment_title|escape} (<a class="forumbutlink" href="tiki-view_forum.php?openpost=1&amp;forumId={$forum_info.forumId}&amp;comments_threadId=0&amp;comments_threshold={$comments_threshold}&amp;comments_offset={$comments_offset}&amp;thread_sort_mode={$thread_sort_mode}&amp;comments_per_page={$comments_per_page}">{tr}Post New{/tr}</a>)
    {/if}
    <form method="post" enctype="multipart/form-data" action="tiki-view_forum.php" id="editpageform">
    <input type="hidden" name="comments_offset" value="{$comments_offset|escape}" />
    <input type="hidden" name="comments_threadId" value="{$comments_threadId|escape}" />
    <input type="hidden" name="comments_threshold" value="{$comments_threshold|escape}" />
    <input type="hidden" name="thread_sort_mode" value="{$thread_sort_mode|escape}" />
    <input type="hidden" name="forumId" value="{$forumId|escape}" />
    <table class="normal">
    <tr class="formcolor">
      <td>{tr}Title{/tr}</td>
      <td><input type="text" name="comments_title" value="{$comment_title|escape}" size="60" /></td>
    </tr>
    {if $forum_info.forum_use_password ne 'n'}
    <tr class="formcolor">
    	<td>{tr}Password{/tr}</td>
    	<td>
    		<input type="password" name="password" />
    	</td>
    </tr>
    {/if}
    
    <input type="hidden" name="comment_topictype" value="n">

    {if $forum_info.topic_summary eq 'y'}
    <tr class="formcolor">
    	<td>{tr}Summary{/tr}</td>
    	<td>
    		<input type="text" size="60" name="comment_topicsummary" value="{$comment_topicsummary|escape}" maxlength="240" />
    	</td>
    </tr>
    {/if}
    {if $prefs.feature_smileys eq 'y'}
     <tr class="formcolor">
	<td>{tr}Smileys{/tr}</td>
	<td>{include file="tiki-smileys.tpl" area_name='editpost'}</td>
     </tr>
    {/if}
    
    <tr class="formcolor">
      <td>{tr}Edit{/tr}
			<br /><br />
			{if $prefs.feature_forum_parse eq 'y' and $prefs.quicktags_over_textarea neq 'y'}
			  {include file=tiki-edit_help_tool.tpl area_name="editpost"}
			{/if}
			</td>
      <td>
        {if $prefs.feature_forum_parse eq 'y' and $prefs.quicktags_over_textarea eq 'y'}
          {include file=tiki-edit_help_tool.tpl area_name='editpost'}
        {/if}
        <textarea id='editpost' name="comments_data" rows="{$rows}" cols="{$cols}">{$comment_data|escape}</textarea><input type="hidden" name="rows" value="{$rows}"/>
        <input type="hidden" name="cols" value="{$cols}"/>
      </td>
    </tr>
    {if ($forum_info.att eq 'att_all') or ($forum_info.att eq 'att_admin' and $tiki_p_admin_forum eq 'y') or ($forum_info.att eq 'att_perm' and $tiki_p_forum_attach eq 'y')}
    <tr class="formcolor">
	  <td>{tr}Attach file{/tr}</td>
	  <td>
	  	<input type="hidden" name="MAX_FILE_SIZE" value="{$forum_info.att_max_size|escape}" /><input name="userfile1" type="file" />
	  </td>
    </tr>
    {/if}
	{if $prefs.feature_contribution eq 'y'}
	{include file="contribution.tpl"}
	{/if}

	{if $prefs.feature_antibot eq 'y'}
		{include file="antibot.tpl"}
	{/if}
   
   {if $prefs.feature_freetags eq 'y' and $tiki_p_freetags_tag eq 'y'}
     {include file=freetag.tpl}
   {/if}

	{if $user and $prefs.feature_user_watches eq 'y' and (!isset($comments_threadId) or $comments_threadId eq 0)}
	<tr class="formcolor">
      <td>{tr}Watch for replies{/tr}</td>
      <td>
		  <input type="radio" name="set_thread_watch" value="y" id="thread_watch_yes" checked="checked" />
      <label for="thread_watch_yes">{tr}Send me an e-mail when someone replies to my topic{/tr}</label>
      <br />
		  <input type="radio" name="set_thread_watch" value="n" id="thread_watch_no" />
      <label for="thread_watch_no">{tr}Don't send me any e-mails{/tr}</label>
      </td>
    </tr>
    {/if}
    
    <tr class="formcolor">
      <td>{tr}Post{/tr}</td>
      <td>
      {if empty($user)}{tr}Enter your name{/tr}:&nbsp;<input type="text" maxlength="50" size="12" id="anonymous_name" name="anonymous_name" />{/if}
      <input type="submit" name="comments_previewComment" value="{tr}Preview{/tr}" {if empty($user)}onclick="setCookie('anonymous_name',document.getElementById('anonymous_name').value);"{/if} />
      <input type="submit" name="comments_postComment" value="{tr}Post{/tr}" {if empty($user)}onclick="setCookie('anonymous_name',document.getElementById('anonymous_name').value);"{/if} />
      <input type="submit" name="comments_postCancel" value="{tr}Cancel{/tr}" {if $comment_preview neq 'y'}onclick="hide('forumpost');window.location='#header';return false;"{/if} />
      </td>
    </tr>
    </table>
    </form>
</div>

<br />
{/if}

<form method="post" action="tiki-view_forum.php">
    <input type="hidden" name="comments_offset" value="{$comments_offset|escape}" />
    <input type="hidden" name="comments_threadId" value="{$comments_threadId|escape}" />
    <input type="hidden" name="comments_threshold" value="{$comments_threshold|escape}" />
    <input type="hidden" name="thread_sort_mode" value="{$thread_sort_mode|escape}" />
    <input type="hidden" name="forumId" value="{$forumId|escape}" />
<table class="normal">
{if $tiki_p_admin_forum eq 'y'}
<tr>
	<th class="heading" colspan='18'>{tr}Moderator Actions{/tr}</th>
</tr>
<tr>	
	<td class="odd" colspan="3">
	<input type="image" name="movesel" src="pics/icons/task_submitted.png" alt='{tr}Move{/tr}' title='{tr}Move Selected Topics{/tr}' />
	<input type="image" name="unlocksel" src="pics/icons/lock_break.png" alt='{tr}Unlock{/tr}' title='{tr}Unlock Selected Topics{/tr}' />
	<input type="image" name="locksel" src="pics/icons/lock_add.png" alt='{tr}Lock{/tr}' title='{tr}Lock Selected Topics{/tr}' />
	<input type="image" name="delsel" src="pics/icons/cross.png" alt='{tr}Delete{/tr}' title='{tr}Delete Selected Topics{/tr}' />
	<input type="image" name="splitsel" src="pics/icons/arrow_merge.png" alt='{tr}Merge{/tr}' title='{tr}Merge Selected Topics{/tr}' />
	</td>
	<td style="text-align:right;" class="odd" colspan="10">
	{if $reported > 0}
	<a class="link" href="tiki-forums_reported.php?forumId={$forumId}">{tr}Reported Messages:{/tr}{$reported}</a><br />
	{/if}
	<a class="link" href="tiki-forum_queue.php?forumId={$forumId}">{tr}Queued Messages:{/tr}{$queued}</a>
	</td>
</tr>
{if $smarty.request.movesel_x} 
<tr>
	<td class="odd" colspan="18">
	{tr}Move to{/tr}:
	<select name="moveto">
		{section name=ix loop=$all_forums}
			{if $all_forums[ix].forumId ne $forumId}
				<option value="{$all_forums[ix].forumId|escape}">{$all_forums[ix].name}</option>
			{/if}
		{/section}
	</select>
	<input type='submit' name='movesel' value='{tr}Move{/tr}' />
	
	</td>
</tr>
{/if}
{if $smarty.request.splitsel_x} 
<tr>
	<td class="odd" colspan="18">
	{tr}Merge into topic{/tr}:
	<select name="mergetopic">
		{section name=ix loop=$comments_coms}
			{if !in_array($comments_coms[ix].threadId,$smarty.request.forumtopic)}
				<option value="{$comments_coms[ix].threadId|escape}">{$comments_coms[ix].title}</option>
			{/if}
		{/section}
	</select>
	<input type="submit" name="mergesel" value="{tr}Merge{/tr}" />
	</td>
</tr>
{/if}

<tr id='moveop' style="display:none;">
	<td class="odd" colspan="18">
		{tr}Move{/tr}
	</td>
</tr>
{/if}
<tr>
  {if $tiki_p_admin_forum eq 'y'}
  <th class="heading">&nbsp;</th>
  {/if}
  {if $forum_info.topic_smileys eq 'y'}
  <th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='smiley'}{tr}Emot{/tr}{/self_link}</th>
  {/if}
  <th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='title'}{tr}Title{/tr}{/self_link}</th>
  {if $forum_info.topics_list_replies eq 'y'}
  	<th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='replies'}{tr}Replies{/tr}{/self_link}</th>
  {/if}
  {if $forum_info.topics_list_reads eq 'y'}
  	<th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='hits'}{tr}Reads{/tr}{/self_link}</th>
  {/if}
  {if $forum_info.topics_list_pts eq 'y'}
  	<th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='average'}{tr}pts{/tr}{/self_link}</th>
  {/if}
  {if $forum_info.topics_list_lastpost eq 'y'}
  	<th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='lastPost'}{tr}Last Post{/tr}{/self_link}</th>
  {/if}
  {if $forum_info.topics_list_author eq 'y'}
  	<th class="heading">{self_link _class="tableheading" _sort_arg='thread_sort_mode' _sort_field='userName'}{tr}Author{/tr}{/self_link}</th>
  {/if}
</tr>
{cycle values="odd,even" print=false}
{section name=ix loop=$comments_coms}
{if $userinfo && $comments_coms[ix].lastPost > $userinfo.lastLogin}
{assign var="newtopic" value="_new"}
{else}
{assign var="newtopic" value=""}
{/if}
<tr>
  {if $tiki_p_admin_forum eq 'y'}
  <td class="{cycle advance=false}">
  	
	<input type="checkbox" name="forumtopic[]" value="{$comments_coms[ix].threadId|escape}" {if $smarty.request.forumtopic and in_array($comments_coms[ix].threadId,$smarty.request.forumtopic)}checked="checked"{/if} />
  </td>
  {/if}	
  {if $forum_info.topic_smileys eq 'y'}
  <td style="text-align:center;" class="{cycle advance=false}">
  	{if strlen($comments_coms[ix].smiley) > 0}
  		<img src='img/smiles/{$comments_coms[ix].smiley}' alt=''/>
  	{else}
  	&nbsp;{$comments_coms[ix].smiley}
  	{/if}
  </td>
  {/if}
  
  <td class="{cycle advance=false}">
  <table width="100%"><tr><td>
  <a {if $comments_coms[ix].is_marked}class="forumnameread"{else}class="forumname"{/if} href="tiki-view_forum_thread.php?comments_parentId={$comments_coms[ix].threadId}{if $comments_threshold}&amp;topics_threshold={$comments_threshold}{/if}{if $comments_offset or $smarty.section.ix.index}&amp;topics_offset={math equation="x + y" x=$comments_offset y=$smarty.section.ix.index}{/if}{if $thread_sort_mode ne 'commentDate_desc'}&amp;topics_sort_mode={$thread_sort_mode}{/if}{if $topics_find}&amp;topics_find={$comments_find}{/if}&amp;forumId={$forum_info.forumId}">{$comments_coms[ix].title}</a>
  {if $forum_info.topic_summary eq 'y'}
  <br /><small>{$comments_coms[ix].summary|truncate:240:"...":true}</small>
  {/if}
  </td>
  
  <td style="text-align:right;" nowrap="nowrap">
  {if count($comments_coms[ix].attachments) or $tiki_p_admin_forum eq 'y'}
  {if count($comments_coms[ix].attachments)}
  	<img src='img/icons/attachment.gif' alt='attachments' />
  {/if}
  {else}
  	&nbsp;
  {/if}

  {if $tiki_p_admin_forum eq 'y' or ($comments_coms[ix].userName == $user && $tiki_p_forum_post eq 'y') }
  <a href="tiki-view_forum.php?openpost=1&amp;comments_threadId={$comments_coms[ix].threadId}&amp;forumId={$forum_info.forumId}&amp;comments_threshold={$comments_threshold}&amp;comments_offset={$comments_offset}&amp;thread_sort_mode={$thread_sort_mode}&amp;comments_per_page={$comments_per_page}"
     class="admlink">{icon _id='page_edit'}</a>
   {/if}

  {if $prefs.feature_forum_topics_archiving eq 'y' && $tiki_p_admin_forum eq 'y'}
    {if $comments_coms[ix].archived eq 'y'}
    <a href="{$smarty.server.PHP_SELF}?{query archive="n" comments_parentId=$comments_coms[ix].threadId}" title="{tr}Unarchive{/tr}">{icon _id='package_go' alt='{tr}Unarchive{/tr}'}</a>
    {else}
    <a href="{$smarty.server.PHP_SELF}?{query archive="y" comments_parentId=$comments_coms[ix].threadId}" title="{tr}Archive{/tr}">{icon _id='package' alt='{tr}Archive{/tr}'}</a>
    {/if}
  {/if}

  {if $tiki_p_admin_forum eq 'y' }
   <a href="tiki-view_forum.php?comments_remove=1&amp;comments_threadId={$comments_coms[ix].threadId}&amp;forumId={$forum_info.forumId}&amp;comments_threshold={$comments_threshold}&amp;comments_offset={$comments_offset}&amp;thread_sort_mode={$thread_sort_mode}&amp;comments_per_page={$comments_per_page}"
     class="admlink">{icon _id='cross' alt='{tr}Remove{/tr}'}</a>
  {/if}

  </td>
  
  </tr></table>
  </td>
  {if $forum_info.topics_list_replies eq 'y'}
  	<td style="text-align:center;" class="{cycle advance=false}"><span style="font-size:11pt;">{$comments_coms[ix].replies}</span></td>
  {/if}
  {if $forum_info.topics_list_reads eq 'y'}
  	<td style="text-align:center;" class="{cycle advance=false}"><span style="font-size:11pt;">{$comments_coms[ix].hits}</span></td>
  {/if}
  {if $forum_info.topics_list_pts eq 'y'}
  	<td style="text-align:center;" class="{cycle advance=false}">{$comments_coms[ix].average|string_format:"%.2f"}</td>
  {/if}
  {if $forum_info.topics_list_lastpost eq 'y'}
  	  <td class="{cycle advance=false}">
		<p style="margin: 0pt; padding: 0pt; font-size: 9pt; color: rgb(102, 102, 102);">
		{$comments_coms[ix].lastPost|tiki_short_datetime} {* date_format:"%b %d [%H:%M]" *}
		  {if $comments_coms[ix].replies}
		  <br />
		  <small><i>{$comments_coms[ix].lastPostData.title}</i> {tr}by{/tr} {$comments_coms[ix].lastPostData.userName|userlink}</small>
		  {/if}
		</p>
	  </td>
  {/if}
  {if $forum_info.topics_list_author eq 'y'}
  	<td class="{cycle}">{$comments_coms[ix].userName|userlink}</td>
  {/if}
</tr>
{sectionelse}
<tr>
	<td class="odd" colspan="8">{tr}No topics yet{/tr}</td>
</tr>
{/section}
</table>
</form>

{pagination_links cant=$comments_cant step=$comments_per_page offset=$comments_offset offset_arg='comments_offset'}{/pagination_links}

{if $forum_info.forum_last_n > 0 && count($last_comments)}
	{* Last n titles *}
	{cycle values="odd,even" print=false}
	<table class="normal">
	<tr>
	 	<td class="heading">{tr}Last{/tr} {$forum_info.forum_last_n} {tr}posts in this forum{/tr}</td>
	</tr>
 	{section name=ix loop=$last_comments}
	 	<tr>
	 		<td class="{cycle}">
	 		{if $last_comments[ix].parentId eq 0}
	 		 	{assign var="idt" value=$last_comments[ix].threadId}
	 		{else}
	 			{assign var="idt" value=$last_comments[ix].parentId}
	 		{/if}
	 		<a class="forumname" href="tiki-view_forum_thread.php?comments_parentId={$idt}&amp;topics_threshold={$comments_threshold}&amp;topics_offset={math equation="x + y" x=$comments_offset y=$smarty.section.ix.index}&amp;topics_sort_mode={$thread_sort_mode}&amp;topics_find={$comments_find}&amp;forumId={$forum_info.forumId}">{$last_comments[ix].title}</a>
	 		</td>
	 	</tr>
 	{/section}
	</table>
	<br />
{/if}

<table >
<tr>
<td style="text-align:left;">

<form id='time_control' method="post" action="tiki-view_forum.php">
    <input type="hidden" name="comments_offset" value="{$comments_offset|escape}" />
    <input type="hidden" name="comments_threadId" value="{$comments_threadId|escape}" />
    <input type="hidden" name="comments_threshold" value="{$comments_threshold|escape}" />
    <input type="hidden" name="thread_sort_mode" value="{$thread_sort_mode|escape}" />
    <input type="hidden" name="forumId" value="{$forumId|escape}" />
    {if $prefs.feature_forum_topics_archiving eq 'y'}
      <input style="margin-left:20px" type="checkbox" id="show_archived" name="show_archived" {if $show_archived eq 'y' }checked="checked"{/if} onchange="javascript:document.getElementById('time_control').submit();" />
      <label for="show_archived"><small>{tr}Show archived posts{/tr}</small></label>
    {/if}
</form>
</td>
<td style="text-align:right;">
{if $prefs.feature_forum_quickjump eq 'y'}
<form id='quick' method="post" action="tiki-view_forum.php">
<small>{tr}Jump to forum{/tr}:</small>
<select name="forumId" onchange="javascript:document.getElementById('quick').submit();">
{section name=ix loop=$all_forums}
<option value="{$all_forums[ix].forumId|escape}" {if $all_forums[ix].forumId eq $forumId}selected="selected"{/if}>{$all_forums[ix].name}</option>
{/section}
</select>
</form>
{else}
&nbsp;
{/if}
</td>
</tr>
</table>

{if empty($user)}
<script type="text/javascript">
<!--//--><![CDATA[//><!--
var js_anonymous_name = getCookie('anonymous_name');
if (js_anonymous_name) document.getElementById('anonymous_name').value = js_anonymous_name;
//--><!]]>
</script>
{/if}
