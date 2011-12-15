
<div id="idiomas">	
	<a class="idioma{if $prefs.language eq 'pt-br'}_ativo{/if} pt-br" href="tiki-switch_lang.php?language=pt-br">Português</a><a class="idioma{if $prefs.language eq 'eo'}_ativo IEburro{/if} eo" href="tiki-switch_lang.php?language=eo">Esperanto</a><a class="en idioma{if $prefs.language eq 'en'}_ativo" id="IEburro{/if}" href="tiki-switch_lang.php?language=en">Inglês</a>
</div>

{if $prefs.language eq 'pt-br'}
	<img class='logo' src='styles/pe/logos/{$imagemLogoTopo}' />
{elseif $prefs.language eq 'en'}
	<img class='logo' src='styles/pe/logos/logo_en.png' />
{elseif $prefs.language eq 'eo'}
	<img class='logo' src='styles/pe/logos/logo_eo.png' />
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