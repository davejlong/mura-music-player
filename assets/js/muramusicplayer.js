/**
  * These are soundManager settings. There
  * is no need to change them unless you have
  * read the soundManager documentation
* */

soundManager.flashVersion = 9;
soundManager.useHighPerformance = true;
soundManager.wmode = 'transparent';
soundManager.useFastPolling = true;
soundManager.url = '../soundmanager/swf/';
soundManager.debugMode = false;

/**
  * Fullscreen music initialization
  * Always make sure this call is wrapped in
  * soundManager.onload to ensure all dependencies are loaded
* */

soundManager.onload = function(){
	$('.playlist').ttwFullScreenMusic({style:'minimal'});
}
