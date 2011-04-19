<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad" access="public" returntype="void" output="false">
		<cfargument name="event" />
		<cfargument name="$" />
		<cfset variables.pluginConfig.addEventHandler(this) />
	</cffunction>
	
	<cffunction name="onRenderStart" output="false" returntype="any">
		<cfargument name="event" />
		<cfargument name="$" />
		<cfset var PowerToolsHeader = '' />
		
		<cfset $.getContentRenderer().injectMethod('showPlayer', showPlayer) />
		
		<!--- Let us call other functions from the mura tag --->
		<cfset event.MuraMusicPlayer = this />
		<cfset $.musicplay = this />
		
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
					
					/*soundManager.onload = function(){
						$('.playlist').ttwFullScreenMusic({style:'minimal'});
					}*/
				</script>
				<link rel="stylesheet" type="text/css" href="/plugins/#variables.pluginConfig.getDirectory()#/assets/css/style.css"/>
				<link rel="stylesheet" type="text/css" href="/plugins/#variables.pluginConfig.getDirectory()#/assets/css/musicplayer.css"/>
			</cfoutput>
		</cfsavecontent>

		<cfhtmlhead text="#PowerToolsHeader#">
	</cffunction>
	
	<cffunction name="onPageMuraMusicPlayerBodyRender" output="true" returntype="void">
		<cfargument name="event" />
		
		<cfscript>
			var PowerToolsHeader = '';
			var body = event.getContentRenderer().setDynamicContent(event.getContentBean().getBody());
			var style = 'minimal';
			if(Request.muramobilerequest)style = 'page-list';	
		</cfscript>
		<!--- Add CSS and JS to header --->
		<cfsavecontent variable="PowerToolsHeader">
			<cfoutput>
				<script type="text/javascript">
					/**
					  * Fullscreen music initialization
					  * Always make sure this call is wrapped in
					  * soundManager.onload to ensure all dependencies are loaded
					* */
					
					soundManager.onload = function(){
							$('.playlist').ttwFullScreenMusic({style:'#style#', autoPlay:false});
					}
				</script>
			</cfoutput>
		</cfsavecontent>
		<cfprocessingdirective suppresswhitespace="true">
			<cfsetting enablecfoutputonly="true" />
			<cfhtmlhead text="#PowerToolsHeader#">
			<cfoutput>#body#</cfoutput>
			<cfsetting enablecfoutputonly="false" />
		</cfprocessingdirective>
		
	</cffunction>	
	<!---******************* MuraMusicPlayer Methods *******************--->
	<cffunction name="showPlayer" access="public" output="false" returntype="String">
		<cfargument name="component" type="string" required="true" hint="The ID of the component that contains the playlist." />
		<cfargument name="autoPlay" type="boolean" required="false" default="false" />
		<cfargument name="autoAdvance" type="boolean" required="false" default="true" />
		<cfargument name="style" type="string" required="false" default="minimal" />
		<cfargument name="showPlaylist" type="boolean" required="false" default="true" />
		<cfargument name="autoHideControls" type="boolean" required="false" default="false" />
		<cfargument name="controlsAutoHideInterval" type="numeric" required="false" default="2000" />
		<cfargument name="loadFirstItem" type="boolean" required="false" default="true" />
		<cfargument name="preloadImages" type="boolean" required="false" default="true" />
		<cfargument name="backgroundColor" type="string" required="false" default="000000" />
		<cfargument name="defaultVolume" type="numeric" required="false" default="100" />
		<cfargument name="$" />
		
		
		<cfscript>
			var headcode = '';
			var bodycode = '';
			var settingsstruct = structNew();
			var fullscreenstruct = structNew();
			// Validate that a proper style was passed in
			var validStyles = 'fullscreen|page-list|minimal';
			if(!listFind(validStyles,Arguments.style,'|'))return '<!-- Not a valid style for music player -->';
						
			// Build a CF struct for the proper styles
			settingsstruct['autoPlay'] = Arguments.autoPlay;
			settingsstruct['autoAdvance'] = Arguments.autoAdvance;
			settingsstruct['style'] = Arguments.style;
			settingsstruct['defaultVolume'] = Arguments.defaultVolume;

			if(Arguments.style IS 'fullscreen'){
				settingsstruct['showPlaylist'] = Arguments.showPlaylist;
				settingsstruct['autoHideControls'] = Arguments.autoHideControls;
				settingsstruct['loadFirstItem'] = Arguments.loadFirstItem;
				settingsstruct['preloadImages'] = Arguments.preloadImages;
				settingsstruct['backgroundColor'] = Arguments.backgroundColor;
			}
		</cfscript>
		<!--- Set our head content --->
		<cfsavecontent variable="headcode">
			<cfoutput>
				<script type="text/javascript">
					soundManager.onload = function(){
						$('.playlist').ttwFullScreenMusic(#reReplace(serializeJson(settingsstruct), '"([A-Za-z0-9]+)":','\1:','all')#);
					}
				</script>
			</cfoutput>
		</cfsavecontent>
		<cfhtmlhead text="#headcode#" />
		
		<!--- Create the body content --->
		<cfsavecontent variable="bodycode">
			<cfoutput>#$.dspObject('component',Arguments.component)#</cfoutput>
		</cfsavecontent>
		
		<cfreturn bodycode />
	</cffunction>

</cfcomponent>