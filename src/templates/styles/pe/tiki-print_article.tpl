{include file="header.tpl"}{* This must be included as the first thing in a document to be XML compliant *}
{* $Id: tiki-print_article.tpl 13434 2008-07-04 09:09:11Z Jyhem $ *}
{* Index we display a wiki page here *}

<div id="tiki-main">
	<br />
  <div class="articletitle">
    <span class="titlea">{$title}</span><br />
  </div>
  {*<div class="articleheading">
    <table  cellpadding="0" cellspacing="0">
    <tr><td  valign="top">
    </td><td  valign="top">
      <span class="articleheading">{$parsed_heading}</span>
    </td></tr>
    </table>
  </div>*}
  <div class="articletrailer">
    {if $show_size eq 'y'}
    ({$size} bytes)
    {/if}
  </div>
  <div class="articlebody">
    {if $useImage eq 'y' && $hasImage eq 'y'}
        <img alt="{tr}Article image{/tr}" border="0" src="article_image.php?id={$articleId}" style="float: left;"/>
    {/if}
    {if $tiki_p_read_article eq 'y'}
      {$parsed_body}
    {else}
      <div class="error simplebox">
        {tr}Permission denied. You do not have permission to read complete articles.{/tr}
      </div>
    {/if}
  </div>
</div>

<p class="editdate">
	<span class="titleb">{tr}By:{/tr} {$authorName} {tr}on:{/tr} {$publishDate|tiki_short_datetime} ({$reads} {tr}Reads{/tr})</span>
	<br />
	{tr}The original document is available at{/tr} <a href="{$base_url}tiki-read_article.php?articleId={$articleId}">{$base_url}tiki-read_article.php?articleId={$articleId}</a>
	<br />
</p>

{include file="footer.tpl"}
