<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad" access="public" returntype="void" output="false">
		<cfargument name="event" />
		<cfset variables.pluginConfig.addEventHandler(this) />
	</cffunction>
	
	<cffunction name="onRenderStart" output="false" returntype="any">
		<!--- Add CSS and JS to header --->
		<cfsavecontent variable="PowerToolsHeader">
			<cfoutput>
				<script type="text/javascript" src="/plugins/#variables.pluginConfig.getDirectory()#/assets/soundmanager/script/soundmanager2.js"></script>
				<script type="text/javascript" src="/plugins/#variables.pluginConfig.getDirectory()#/assets/js/ttwFullScreenMusic.js"></script>
				<script type="text/javascript">
					/**
					  * These are soundManager settings. There
					  * is no need to change them unless you have
					  * read the soundManager documentation
					* */
					
					soundManager.flashVersion = 9;
					soundManager.useHighPerformance = true;
					soundManager.wmode = 'transparent';
					soundManager.useFastPolling = true;
					soundManager.url = '/plugins/#variables.pluginConfig.getDirectory()#/assets/soundmanager/swf/';
					soundManager.debugMode = false;
					
					/**
					  * Fullscreen music initialization
					  * Always make sure this call is wrapped in
					  * soundManager.onload to ensure all dependencies are loaded
					* */
					
					soundManager.onload = function(){
						$('.playlist').ttwFullScreenMusic({style:'minimal'});
					}
				</script>
				<link rel="stylesheet" type="text/css" href="/plugins/#variables.pluginConfig.getDirectory()#/assets/css/style.css"/>
			</cfoutput>
		</cfsavecontent>

		<cfhtmlhead text="#PowerToolsHeader#">
	</cffunction>

</cfcomponent>