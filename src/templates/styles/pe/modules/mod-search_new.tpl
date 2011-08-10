{* $Id: mod-search_new.tpl 12242 2008-03-30 13:22:01Z luciash $ *}

{if $prefs.feature_search eq 'y' and $tiki_p_search eq 'y'}
{if !isset($tpl_module_title)}{assign var=tpl_module_title value=".:. {tr}Search{/tr} .:."}{/if}
{tikimodule title=$tpl_module_title name="search_new" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox}
    <form class="forms" method="get" action="tiki-searchindex.php">
    <input id="fuser" name="highlight" size="14" type="text" accesskey="s" />
    <input type="hidden" name="where" value="pages">
    <input type="image" src="styles/pe/buscabtn.jpg" class="wikiaction" name="search" value="{tr}Go{/tr}"/> 
    </form>
{/tikimodule}
{/if}
