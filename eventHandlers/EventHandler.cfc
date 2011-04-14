<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad" access="public" returntype="void" output="false">
		<cfargument name="event" />
		<cfset variables.pluginConfig.addEventHandler(this) />
	</cffunction>
	
	<cffunction name="onRenderStart" output="false" returntype="any">
		<!--- Add CSS and JS to header --->
		<cfsavecontent variable="PowerToolsHeader">
			<cfoutput>
				<script type="text/javascript" src="#variables.pluginConfig.getDirectory()#/assets/soundmanager/script/soundmanager2.js"></script>
				<script type="text/javascript" src="#variables.pluginConfig.getDirectory()#/assets/js/ttwFullScreenMusic.js"></script>
				<script type="text/javascript" src="#variables.pluginConfig.getDirectory()#/assets/js/muramusicplayer.js"></script>
				<link rel="stylesheet" type="text/css" href="#variables.pluginConfig.getDirectory()#/assets/css/style.css"/>
			</cfoutput>
		</cfsavecontent>

		<cfhtmlhead text="#PowerToolsHeader#">
	</cffunction>

</cfcomponent>