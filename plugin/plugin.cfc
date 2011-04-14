<cfcomponent extends="mura.plugin.plugincfc">

	<cffunction name="init" returntype="any" access="public" output="false">
		<cfargument name="pluginConfig" type="any" default="" />

		<cfset variables.pluginConfig = arguments.pluginConfig />

		<cfreturn this />
	</cffunction>

	<cffunction name="install" returntype="void" access="public" output="false">
		<!--- TODO: Auto-generated method stub --->
	</cffunction>

	<cffunction name="update" returntype="void" access="public" output="false">
		<!--- TODO: Auto-generated method stub --->
		<cfset upsertMuraMusicPlayerSubType() />
	</cffunction>

	<cffunction name="delete" returntype="void" access="public" output="false">
		<!--- TODO: Auto-generated method stub --->
	</cffunction>


	<cffunction name="upsertMuraMusicPlayerSubType" returntype="any" access="private" output="false">
		<cfscript>
			var local = structNew();

			// grab which sites this plugin has been assigned to
			local.rsSites 		= variables.config.getAssignedSites();
			local.filestore 	= variables.config.getConfigBean().getFileStore();
			local.subType 		= application.classExtensionManager.getSubTypeBean();
		</cfscript>
		<!--- create the attribute sets that belong to this subType --->
		<cfloop query="local.rsSites">
			<cftry>
				<cfscript>
					local.subType = application.classExtensionManager.getSubTypeBean();
					local.subType.setType("Page");
					local.subType.setSubType(variables.PackageName);
					local.subType.setSiteID(local.rsSites.siteid);
					local.subType.setBaseTable("tcontent"); // if you don't set this, when deleting the plugin, the subType won't get updated!
					local.subType.setBaseKeyField("contentHistID");
					local.subType.load();
					local.subType.save();
				</cfscript>
			<cfcatch>
				<cfthrow
					message="Sorry! This plugin did NOT install correctly. Please DELETE it. Here's the error message: #cfcatch.message#" 
					detail="#cfcatch.detail#" />
				</cfcatch>
			</cftry>
		</cfloop>
	</cffunction>
</cfcomponent>