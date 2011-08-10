{* $Id: tiki-edit_article.tpl 12246 2008-03-30 13:41:44Z luciash $ *}
{* Note: if you edit this file, make sure to make corresponding edits on tiki-edit_submission.tpl*}

{popup_init src="lib/overlib.js"}
{include file="tiki-articles-js.tpl"}

{* preguica de criar um arquivo js para o projeto, se criarmos essa funcao vai pra la :-) *}
{literal}
<script type="text/javascript">
  function verificaTipo() {
    if (document.getElementById('articletype').value == 'none') {
      alert('Você precisa definir um tipo para o objeto antes de salvá-lo');
      return false;
    }
  }
</script>
{/literal}

<h1>{if $articleId}<a class="pagetitle" href="tiki-edit_article.php?articleId={$articleId}">{tr}Edit{/tr}: {$title}</a>{else}<a class="pagetitle" href="tiki-edit_article.php?articleId={$articleId}">{tr}Edit article{/tr}{/if}
{assign var=area_name value="body"}

{if $prefs.feature_help eq 'y'}
<a href="{$prefs.helpurl}Articles" target="tikihelp" class="tikihelp" title="{tr}Edit Article{/tr}">
<img src="img/icons/help.gif" border="0" height="16" width="16" alt='{tr}Help{/tr}' /></a>
{/if}

{if $prefs.feature_edit_templates eq 'y' and $tiki_p_edit_templates eq 'y'}
<a href="tiki-edit_templates.php?template=tiki-edit_article.tpl" target="tikihelp" class="tikihelp" title="{tr}View tpl{/tr}: {tr}Edit Article Tpl{/tr}">
<img src="img/icons/info.gif" border="0" width="16" height="16" alt='{tr}Edit Template{/tr}' /></a>
{/if}</h1>

<div class="navbar">
<a class="linkbut" href="tiki-list_articles.php">{tr}List Articles{/tr}</a>
<a class="linkbut" href="tiki-view_articles.php">{tr}View Articles{/tr}</a>
</div>

{if $preview}
{include file="tiki-preview_article.tpl"}
{/if}

{if !empty($errors)}
<div class="simplebox highlight">
{tr}One of the email addresses you typed is invalid{/tr}<br />
{foreach from=$errors item=m name=errors}
{$m}
{if !$smarty.foreach.errors.last}<br />{/if}
{/foreach}
</div>
{/if}

<form enctype="multipart/form-data" method="post" action="tiki-edit_article.php" id='editpageform'>
<input type="hidden" name="articleId" value="{$articleId|escape}" />
<input type="hidden" name="image_data" value="{$image_data|escape}" />
<input type="hidden" name="useImage" value="{$useImage|escape}" />
<input type="hidden" name="image_type" value="{$image_type|escape}" />
<input type="hidden" name="image_name" value="{$image_name|escape}" />
<input type="hidden" name="image_size" value="{$image_size|escape}" />
<table class="normal">
<tr class="formcolor"><td>{tr}Title{/tr}</td><td><input type="text" name="title" value="{$title|escape}" maxlength="255" size="58" /></td></tr>
<tr class="formcolor" id='show_author'><td>{tr}Author Name{/tr}</td><td><input type="text" name="authorName" value="{$authorName|escape}" /></td></tr>
<tr class="formcolor"><td>{tr}Type{/tr}</td><td>
<select id='articletype' name='type' onchange='javascript:chgArtType();'>
<option value="none"> --- </option>
{foreach from=$types key=typei item=prop}
<option value="{$typei|escape}" {if $type eq $typei}selected="selected"{/if}>{tr}{$typei}{/tr}</option>
{/foreach}
</select>
</td></tr>
<tr id='show_image_1' class="formcolor"><td>{tr}Own Image{/tr}</td><td><input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
<input name="userfile1" type="file" onchange="document.getElementById('useImage').checked = true;"/></td></tr>
{if $hasImage eq 'y'}
  <tr class="formcolor"><td>{tr}Own Image{/tr}</td><td>{$image_name} [{$image_type}] ({$image_size} bytes)</td></tr>
  {if $tempimg ne 'n'}
    <tr class="formcolor"><td>{tr}Own Image{/tr}</td><td>
    <img alt="{tr}Article image{/tr}" border="0" src="{$tempimg}" {if $image_x > 0}width="{$image_x}"{/if}{if $image_y > 0 }height="{$image_y}"{/if}/>
    </td></tr>
  {/if}
{/if}
<tr id='show_image_2' class="formcolor"><td>{tr}Use own image{/tr}</td><td>
<input type="checkbox" name="useImage" id="useImage" {if $useImage eq 'y'}checked='checked'{/if}/>
</td></tr>
<input type="hidden" name="isfloat" value="on"/>

{include file=categorize.tpl}

<tr class="formcolor">
  <td>{tr}Heading{/tr}<br />
    {if $prefs.quicktags_over_textarea neq 'y'}
      {include file=tiki-edit_help_tool.tpl area_name='heading'}
    {/if}
  </td>
  <td>
    {if $prefs.quicktags_over_textarea eq 'y'}
      {include file=tiki-edit_help_tool.tpl area_name='heading'}
    {/if}
    <textarea class="wikiedit" name="heading" rows="5" cols="80" id='subheading' wrap="virtual">{$heading|escape}</textarea>
  </td>
</tr>

<tr id='heading_only' class="formcolor">
  <td>{tr}Body{/tr}
    <br />
    {include file="textareasize.tpl" area_name='body' formId='editpageform'}
    {if $prefs.quicktags_over_textarea neq 'y'}
      <br />{include file=tiki-edit_help_tool.tpl area_name='body' qtnum='2'}
    {/if}
  </td>
  <td>
    {if $prefs.quicktags_over_textarea eq 'y'}
      {include file=tiki-edit_help_tool.tpl area_name='body'}
    {/if}
    <textarea class="wikiedit" id="body" name="body" rows="{$rows}" cols="{$cols}" wrap="virtual">{$body|escape}</textarea>
    <input type="hidden" name="rows" value="{$rows}"/>
    <input type="hidden" name="cols" value="{$cols}"/>
  </td>
</tr>

<tr id='show_pubdate' class="formcolor">
  <td>{tr}Publish Date{/tr}</td>
  <td>
    {html_select_date prefix="publish_" time=$publishDateSite start_year="-5" end_year="+10" field_order=$prefs.display_field_order} {tr}at{/tr} 
    <span dir="ltr">{html_select_time prefix="publish_" time=$publishDateSite display_seconds=false}
      &nbsp;{$siteTimeZone}
    </span>
  </td>
</tr>

{if $tiki_p_use_HTML eq 'y'}
<tr class="formcolor"><td>{tr}Allow HTML{/tr}</td><td><input type="checkbox" name="allowhtml" {if $allowhtml eq 'y'}checked="checked"{/if}/></td></tr>
{/if}
{if $prefs.feature_cms_emails eq 'y' and $articleId eq 0}
<tr class="formcolor"><td>{tr}Emails to be notified (separated with commas){/tr}</td><td><input type="text" name="emails" value="{$emails|escape}" size="80" /></td></tr>
{/if}

{include file=freetag.tpl}

<tr class="formcolor"><td></td><td><input type="submit" class="wikiaction" name="preview" value="{tr}Preview{/tr}" />
<input type="submit" class="wikiaction" name="save" value="{tr}Save{/tr}" onclick="return verificaTipo();"/></td></tr>
</table>
</form>
<br />

<div class="button2">
<a href="#edithelp" onclick="javascript:flip('edithelpzone'); return true;" name="edithelp" class="linkbut">{tr}Wiki Help{/tr}</a>
</div>
{include file=tiki-edit_help.tpl}
