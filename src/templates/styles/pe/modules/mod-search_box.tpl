{* $Id: mod-search_new.tpl 12242 2008-03-30 13:22:01Z luciash $ *}

{if $prefs.feature_search eq 'y' and $tiki_p_search eq 'y'}
{assign var=tpl_module_title value=".:. {tr}Search{/tr} .:."}
{tikimodule title=$tpl_module_title name="search_new" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox}
    <form class="forms" method="get" action="http://www.google.com/search" target="Google" style="margin-top:7px;">
    <input type="hidden" name="hl" value="en"/>
    <input type="hidden" name="oe" value="UTF-8"/>
    <input type="hidden" name="ie" value="UTF-8"/>
    <input type="hidden" name="btnG" value="Google Search"/>
    <input type="text" id="search_text_input" name="q" size="12"  maxlength="100"/>
    {if $url_host ne ''}
      <input type="hidden" name="domains" value="{$url_host}" />
      <input type="hidden" name="sitesearch" value="{$url_host}"/>
    {/if}
    <input type="image" src="styles/pe/buscabtn.jpg" class="wikiaction" name="search" value="{tr}Go{/tr}"/> 
    </form>
{/tikimodule}
{/if}
