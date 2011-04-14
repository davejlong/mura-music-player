<cfscript>
	// time to create the attribute sets
	if ( isDefined('local') and structKeyExists(local, 'rsSites') and structKeyExists(local.rsSites, 'siteid') and structKeyExists(local, 'parentType') ) {
		upsertAttributeSet(
			siteID=local.rsSites.siteid,
			name='',
			label='Default Start/From Location',
			hint='The default start/from address location if showing directions.',
			type='TextBox',
			defaultValue='Lebanon, KS',
			required=false,
			validate='None',
			regex='',
			message='',
			optionList='',
			optionLabelList='',
			parentType=local.parentType,
			orderNo=1
		);
	}
</cfscript>