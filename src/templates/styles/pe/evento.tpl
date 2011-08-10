<h1>Agenda</h1>
<br />
<h5 class="agenda">{$evento.cal_name}</h2>
{if $tiki_p_admin eq 'y'}
        <a href="/webcalendar/">Administrar agenda</a>
        <br /><br />
{/if}

<table style="border-width: 0px;"><tbody>
  <tr>
    <td class="agenda_campo">Descri&ccedil;&atilde;o:</td>
    <td class="agenda_conteudo">{$evento.cal_description}</td>
  </tr>
  <tr>
    <td class="agenda_campo">Data:</td>
    <td class="agenda_conteudo">{$evento.cal_date}</td>
  </tr>
  {if $evento.cal_duration ne 1440 and $evento.cal_duration ne 0}
    <tr>
      <td class="agenda_campo">Hora:</td>
      <td class="agenda_conteudo">{$evento.cal_time} - {$evento.cal_time_end}</td>
    </tr>
  {/if}
  <tr>
    <td class="agenda_campo">Dura&ccedil;&atilde;o:</td>
    <td class="agenda_conteudo">    
    {if $evento.cal_duration eq 1440}
      dia todo</td>
    {elseif $evento.cal_duration eq 0}
      sem hora</td>
    {else}
      {$evento.cal_duration} minutos</td>
    {/if}
  </tr>
</tbody></table>

<br />
<a href="agenda.php"><img src="styles/pe/retorna_agenda_btn.png" border=0 ></a>
