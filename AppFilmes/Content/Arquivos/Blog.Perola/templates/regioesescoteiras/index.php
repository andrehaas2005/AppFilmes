<?php  
/*------------------------------------------------------------------------
# author    your name or company
# copyright Copyright © 2011 example.com. All rights reserved.
# @license  http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
# Website   http://www.example.com
-------------------------------------------------------------------------*/

defined( '_JEXEC' ) or die; 

// variables
$app = JFactory::getApplication();
$doc = JFactory::getDocument(); 
$params = &$app->getParams();
$pageclass = $params->get('pageclass_sfx');
$tpath = $this->baseurl.'/templates/'.$this->template;

$this->setGenerator(null);

// load sheets and scripts
$doc->addStyleSheet($tpath.'/css/template.css.php?v=1.0.0'); 
$doc->addScript($tpath.'/js/modernizr.js'); // <- this script must be in the head

// unset scripts, put them into /js/template.js.php to minify http requests
unset($doc->_scripts[$this->baseurl.'/media/system/js/mootools-core.js']);
unset($doc->_scripts[$this->baseurl.'/media/system/js/core.js']);
unset($doc->_scripts[$this->baseurl.'/media/system/js/caption.js']);

?><!doctype html>
<!--[if IEMobile]><html class="iemobile" lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if gt IE 8]><!-->  <html class="no-js" lang="<?php echo $this->language; ?>"> <!--<![endif]-->

<head>
    
  <script type="text/javascript" src="<?php echo $tpath.'/js/template.js.php'; ?>"></script>
  <script type="text/javascript" src="<?php echo $tpath.'/js/javascript.js'; ?>"></script>

  <jdoc:include type="head" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /> <!-- mobile viewport -->
  <link rel="stylesheet" media="only screen and (max-width: 768px)" href="<?php echo $tpath; ?>/css/tablet.css" type="text/css" />
  <link rel="stylesheet" media="only screen and (min-width: 320px) and (max-width: 480px)" href="<?php echo $tpath; ?>/css/phone.css" type="text/css" />
  <!--[if IEMobile]><link rel="stylesheet" media="screen" href="<?php echo $tpath; ?>/css/phone.css" type="text/css" /><![endif]--> <!-- iemobile -->
  <link rel="apple-touch-icon-precomposed" href="<?php echo $tpath; ?>/apple-touch-icon-57x57.png"> <!-- iphone, ipod, android -->
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<?php echo $tpath; ?>/apple-touch-icon-72x72.png"> <!-- ipad -->
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<?php echo $tpath; ?>/apple-touch-icon-114x114.png"> <!-- iphone retina -->
  <!--[if lte IE 8]>
    <style> 
      {behavior:url(<?php echo $tpath; ?>/js/PIE.htc);}
    </style>
  <![endif]-->
</head>
	
<body class="<?php echo $pageclass; ?>">
<div id="overall">
    <div id="header">
		<div id="acesso-rapido">
			<div id="acesso-rapido-mg">
              <jdoc:include type="modules" name="menutop" style="XHTML" />
              </div>
		</div>
    </div><!---header----->
    
    
<div id="layout">
    
	<div id="main">
        
		<div id="topo">
            <div id="logo"><a href="<?php echo $this->baseurl ?>" title="Voltar a página inicial do site dos Escoteiros do Brasil" accesskey="H"><img src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template;?>/images/escoteiros_do_brasil.png" width="300" height="70" alt="Escoteiros do Brasil" title="Escoteiros do Brasil" /></a>
                <h1>Escoteiros do Brasil</h1>
            </div><!---logo----->
            <div id="busca"></div>
            <br class="clr" />
		</div><!---topo----->
        
		<div id="menu">
			<div id="menu-mg">
			<jdoc:include type="modules" name="menuprinc" style="XHTML" />
			</div>
		</div><!---menu----->
        
		<div id="chamadas"><jdoc:include type="modules" name="slider" style="XHTML" /></div>
		
        <div class="clr"></div>
		<div id="conteudo-mg">
        
			<jdoc:include type="modules" name="breadcrumbs" style="XHTML" />

        	<div id="coluna1">
				<jdoc:include type="modules" name="user1" style="XHTML" />
            </div>
            
            <jdoc:include type="message" />
			<jdoc:include type="component" />
            
            <div id="coluna2">
				<jdoc:include type="modules" name="banner" style="XHTML" />
            </div>
		</div><!---conteudo-mg----->
            
	</div><!---main----->
	<div id="rodape">
		<jdoc:include type="modules" name="rodape" style="XHTML" />
	</div><!---footer----->
</div> <!---layout----->
</div><!---overall----->
  <jdoc:include type="modules" name="debug" />
</body>

</html>

