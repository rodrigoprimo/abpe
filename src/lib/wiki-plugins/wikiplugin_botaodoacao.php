<?php

function wikiplugin_botaodoacao_help() {
	$help = "Exibe um botão de doação".":<br />~np~{BOTAODOACAO(email=>email_de_cobrança@loja.com.br,botao=>doacao|doar|contribuicao|http://seusite.com/seubotao.jpg)}"."tudo que vier aqui será apagado, não coloque nada aqui."."{BOTAODOACAO}~/np~";
	return tra($help);
}

function wikiplugin_botaodoacao($data, $params) {
	extract($params, EXTR_SKIP);

	if (!$email) { return "Coloque o e-mail de quem vai receber a doação"; }
	if (!$botao) { $botao = "https://p.simg.uol.com.br/out/pagseguro/i/botoes/doacao/btndoacao.jpg" ; }
	if ($botao == "doacao" or $botao == "doar" or $botao == "contribuicao") {
		$botao = "https://p.simg.uol.com.br/out/pagseguro/i/botoes/doacao/btn$botao.jpg" ;
	}
	
	$out = "~np~

<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
 <form style='display: inline' target=\"pagseguro\" action=\"https://pagseguro.uol.com.br/checkout/doacao.jhtml\" method=\"post\">
 <input type=\"hidden\" name=\"email_cobranca\" value=\"$email\">
 <input type=\"hidden\" name=\"moeda\" value=\"BRL\">
 <input type=\"image\" src=\"$botao\" name=\"submit\" alt=\"Pague com PagSeguro - é rápido, grátis e seguro!\">
 </form>
 <!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
~/np~" ;

	return $out;
}

?>
