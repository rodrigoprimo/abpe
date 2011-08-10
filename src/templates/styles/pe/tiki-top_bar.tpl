
<div id="idiomas">
	
	<a class="idioma{if $prefs.language eq 'pt-br'}_ativo{/if} pt-br" href="tiki-switch_lang.php?language=pt-br">Português</a><a class="idioma{if $prefs.language eq 'eo'}_ativo IEburro{/if} eo" href="tiki-switch_lang.php?language=eo">Esperanto</a><a class="en idioma{if $prefs.language eq 'en'}_ativo" id="IEburro{/if}" href="tiki-switch_lang.php?language=en">Inglês</a>
      
</div>

{assign var=filepath value="styles/pe/logos/$nomepagina.png"}

{if $prefs.language eq 'pt-br'}
	{if $filepath|file_exists}
		<img class='logo' src='styles/pe/logos/{$nomepagina}.png' />
	{else}
		<img class='logo' src='styles/pe/logos/logo.jpg' />
	{/if}

{elseif $prefs.language eq 'en'}
		<img class='logo' src='styles/pe/logos/logo_en.png' />

{/if}

<div id=menu>
    {if $prefs.language eq 'pt-br'}
      {phplayers id=44 type=horiz}
    {elseif $prefs.language eq 'en'}
      {phplayers id=45 type=horiz}
    {elseif $prefs.language eq 'eo'}
      {phplayers id=46 type=horiz}
    {/if}
</div>

{*
{if $prefs.language eq 'pt-br' || $user}
    <div id=busca>
      <form method="get" action="tiki-searchindex.php">
	<fieldset>
	  <label for="cp_busca">busca</label>
	  <input id="cp_busca" name="highlight" type="text" size="20" />
	  <input type="hidden" name="where" id="where" value="pages" />
	  <input type="image" src="styles/pe/buscabtn.jpg" >
	</fieldset>
      </form>
    </div>
{/if}
*}

