<cfoutput>
<div id="widget-container">
    <div class="well well-sm">
        <!--- Create Widget --->
        <cfif args.mode eq "edit">
            <div class="btn-group btn-sm pull-right">
                <button class="btn btn-sm btn-danger" onclick="openRemoteModal('#event.buildLink(prc.xehWidgetCreate)#');return false"
                        title="Create a spanking new Widget">Create Widget</button>
            </div>
        </cfif>
        <div class="form-group form-inline no-margin">
            #html.textField(
                name="widgetFilter",
                size="30",
                class="form-control",
                placeholder="Quick Filter"
            )#
        </div>
    </div>
    <div class="tab-wrapper tab-left tab-primary">
        <!--- Navigation Bar --->
        <ul class="nav nav-tabs" id="widget-sidebar">
            <li class="active">
                <a href="##widget-store" class="current" data-toggle="tab">All</a>
            </li>
            <cfloop query="prc.categories">
                <cfif len( prc.categories.category )>
                    <li>
                        <a href="##widget-store" data-toggle="tab">#prc.categories.category#</a>
                    </li>
                </cfif>
            </cfloop>
        </ul>
        
        <!--- ContentBars --->
        <div class="tab-content">
            <div class="widget-store full tab-pane active">
                <!--- Category Total Bar --->
                <div id="widget-total-bar" class="widget-total-bar">Category: <strong>All</strong> (#prc.widgets.recordcount# Widgets)</div>
                <div class="row" style="padding:10px;">
                    <!--- Widgets --->
                    <cfloop query="prc.widgets">
                        <cfscript>
                        	try{
                            	p = prc.widgetService.getWidget( name=prc.widgets.name, type=prc.widgets.widgetType );
                        	} catch( Any e ){
                        		log.error( 'Error Building #prc.widgets.toString()#. #e.message# #e.detail#', e );
                        		writeOutput( "<div class='alert alert-danger'>Error building '#prc.widgets.name#' widget: #e.message# #e.detail#</div>" );
                        		continue;
                        	}
                            widgetName = prc.widgets.name;
                            widgetSelector = prc.widgets.name;
                            category = prc.widgets.category;    
                            switch( prc.widgets.widgettype ) {
                                case 'module':
                                        widgetName &= "@" & prc.widgets.module;
                                        break;
                                case 'layout':
                                    widgetName = "~" & widgetName;
                                    break;
                            }
                            iconName = prc.widgets.icon;
                            if( args.cols==2 ) {
                                extraClasses = "half ";
                                extraClasses &= currentRow mod 2==0 ? "spacer" : "";
                                extraClasses = "third ";
                                extraClasses &= currentRow mod 3!=1 ? "spacer" : "";
                            }
                            else {
                                extraClasses = "third ";
                                extraClasses &= currentRow mod 3!=1 ? "spacer" : "";
                            }
                        </cfscript>
                        <cfset hasProtocol = reFindNoCase( "\b(?:https?):?", p.getPluginAuthorURL() )>
                        <cfset pluginURL = hasProtocol ? p.getPluginAuthorURL() : "http://" & p.getPluginAuthorURL()>
                        <div class="widget-wrapper col-md-6">
                            <div class="widget-content" name="#widgetName#" category="#category#" type="#prc.widgets.widgettype#" displayname="#p.getPluginName()#">
                                <cfif isSimpleValue( p )>
                                    <div class="alert alert-danger">Error loading widget: #widgetName#<br>
                                        <p>Debugging:</p>
                                        #prc.widgets.debug#
                                    </div>
                                <cfelse>
                                    <div class="widget-title">
                                        #p.getPluginName()#
                                        <span class="widget-type">#prc.widgets.widgettype#</span>
                                    </div>
                                    <img class="widget-icon" src="#prc.cbroot#/includes/images/widgets/#iconName#" width="80" />
                                    <div class="widget-teaser">#p.getPluginDescription()#</div>
                                    <div class="widget-actions">
                                        <div class="row">
                                            <div class="col-md-7">
                                                v#p.getPluginVersion()#
                                                By <a href="#pluginURL#" target="_blank">#p.getPluginAuthor()#</a>
                                            </div>
                                            <div class="col-md-5">
                                                <cfif args.mode eq "edit">
                                                    <span class="widget-type">
                                                        <div class="btn-group btn-group-xs pull-right">
                                                            <!---read docs--->
                                                            <a title="Read Widget Documentation" class="btn btn-xs btn-info" href="javascript:openRemoteModal('#event.buildLink(prc.xehWidgetDocs)#',{widget:'#urlEncodedFormat(widgetName)#',type:'#urlEncodedFormat(prc.widgets.widgettype)#'})">
                                                                <i class="fa fa-book icon-large"></i> 
                                                            </a>
                                                            <cfif prc.oAuthor.checkPermission("WIDGET_ADMIN")>
                                                                <!--- Editor --->
                                                                <a title="Edit Widget" class="btn btn-xs btn-info" href="#event.buildLink(linkTo=prc.xehWidgetEditor,queryString='widget=#widgetName#&type=#prc.widgets.widgettype#')#">
                                                                    <i class="fa fa-edit icon-large"></i> 
                                                                </a>
                                                                <!---only allow deletion of core widgets--->
                                                                <cfif prc.widgets.widgettype eq "core">
                                                                    <!--- Delete Command --->
                                                                    <a title="Delete Widget" href="javascript:remove('#JSStringFormat(widgetName)#')" class="confirmIt btn btn-xs btn-info" data-title="Delete #widgetName#?">
                                                                        <i class="fa fa-trash-o icon-large"></i> 
                                                                    </a>
                                                                </cfif>
                                                            </cfif>
                                                        </div> <!--- end btn group --->
                                                    </span>
                                                </cfif>
                                            </div>
                                        </div>
                                    </div> <!--- end widget actions div --->  
                                </cfif>
                            </div> <!--- end widget-content --->
                        </div>
                    </cfloop>
                </div>
                <div class="widget-no-preview" style="display:none;">Sorry, no widgets matched your search!</div>
            </div>
        </div>
    </div>
</div>
</cfoutput>