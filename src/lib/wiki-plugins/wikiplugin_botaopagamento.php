<?php

function wikiplugin_botaopagamento_help() {
	$help = "Exibe um botão de pagamento".":<br />~np~{BOTAOPAGAMENTO(email=>email_de_cobrança@loja.com.br, id=>1, titulo=>,quantidade=>000|escolher, quant_min=>00, quant_max=>00, valor=>000, frete=>000, peso=>000, botao=>ComprarBR|PagarBR|PagueComBR|Pagar|http://seusite.com/suaimagem.jpg)}"."tudo que vier aqui será apagado, não coloque nada aqui."."{BOTAOPAGAMENTO}~/np~";
	return tra($help);
}

function wikiplugin_botaopagamento($data, $params) {
	extract($params, EXTR_SKIP);

	if ($frete and $peso) { return "Coloque apenas frete=>XXX para valor de frete fixo ou peso=>XXX para frete pelo peso do produto"; }
	if ($quantidade and ($quant_min or $quant_max)) { return "Você não deve usar os campos quantidade mínima e/ou quantidade máxima junto com quantidade."; }
	if (!$botao) { $botao = "https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamento/btnPagar.jpg" ; }
	if ($botao == "ComprarBR" or $botao == "PagarBR" or $botao == "PagueComBR" or $botao == "Pagar") {
		$botao = "https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamento/btn$botao.jpg" ;
	}
	if (!$quantidade and !$quant_min and !$quant_max) { $quantidade = 1; }
	
	$out = "~np~
	<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
	 <form target=\"pagseguro\" action=\"https://pagseguro.uol.com.br/checkout/checkout.jhtml\" method=\"post\" accept-charset='iso-8859-1'>
	 <input type=\"hidden\" name=\"email_cobranca\" value=\"$email\">
	 <input type=\"hidden\" name=\"tipo\" value=\"CP\">
	 <input type=\"hidden\" name=\"moeda\" value=\"BRL\">
	 <input type=\"hidden\" name=\"item_id_1\" value=\"$id\">
	 <input type=\"hidden\" name=\"item_descr_1\" value=\"$titulo\">
	 <input type=\"hidden\" name=\"item_valor_1\" value=\"$valor\">" ;

	if ($quantidade == 'escolher') {
		$out .= "<label for=\"item_quant_1\">Quantidade:</label> <input type=\"text\" name=\"item_quant_1\" size=2>";
	} elseif ($quant_min and $quant_max) { 
		$out .= "Quantidade: <select name=\"item_quant_1\">";
		for ($q = $quant_min; $q <= $quant_max; $q++) {
			$out .= "<option value=$q> $q </option>";
		}
		$out .= "</select>";
	} else {
		$out .= "<input type=\"hidden\" name=\"item_quant_1\" value=$quantidade>";
	}
 	if ($frete) { $out .= "<input type=\"hidden\" name=\"item_frete_1\" value=\"$frete\">"; }
	if ($peso) { $out .= "<input type=\"hidden\" name=\"item_peso_1\" value=\"$peso\">"; }

	$out .= "
 <input type=\"image\" src=\"$botao\" name=\"submit\" alt=\"Pague com PagSeguro - é rápido, grátis e seguro!\">
 </form>
 <!-- FINAL FORMULARIO BOTAO PAGSEGURO -->~/np~" ;

	return $out;
}

?>
