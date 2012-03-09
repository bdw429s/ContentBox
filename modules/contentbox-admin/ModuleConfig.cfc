﻿/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.gocontentbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************
* ContentBox Admin module configuration
* Icon Themes: woothemesiconset, duesseldorf
*/
component {

	// Module Properties
	this.title 				= "ContentBox-Admin";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "ContentBox Admin";
	this.version			= "1.0";
	this.viewParentLookup 	= true;
	this.layoutParentLookup = true;
	this.entryPoint			= "cbadmin";

	function configure(){

		// Layout Settings
		layoutSettings = { defaultLayout = "admin.cfm" };

		// Module Settings
		settings = {
			// ForgeBox Settings
			forgeBoxURL 	 = "http://www.coldbox.org/forgebox",
			forgeBoxEntryURL = "http://www.coldbox.org/forgebox/view"
		};

		// SES Routes
		routes = [
			{pattern="/", handler="dashboard", action="index" },
			{pattern="/dashboard/reload/:targetModule", handler="dashboard", action="reload" },
			{pattern="/authors/page/:page",handler="authors"},
			{pattern="/entries/page/:page",handler="entries"},
			{pattern="/pages/parent/:parent?",handler="pages"},
			{pattern="/entries/pager/page/:page",handler="entries",action="pager"},
			{pattern="/comments/page/:page",handler="comments"},
			{pattern="/customHTML/page/:page",handler="customHTML"},
			{pattern="/module/:moduleEntryPoint/:moduleHandler/:moduleAction?", handler="modules", action="execute" },
			{pattern="/:handler/:action?"}
		];

		// Custom Declared Points
		interceptorSettings = {
			// CB Admin Custom Events
			customInterceptionPoints = arrayToList([
				// Admin Layout HTML points
				"cbadmin_beforeHeadEnd","cbadmin_afterBodyStart","cbadmin_beforeBodyEnd","cbadmin_footer","cbadmin_beforeContent","cbadmin_afterContent","cbadmin_onTagLine", "cbadmin_onTopBar",
				// Login Layout HTML points
				"cbadmin_beforeLoginHeadEnd","cbadmin_afterLoginBodyStart","cbadmin_beforeLoginBodyEnd","cbadmin_loginFooter","cbadmin_beforeLoginContent","cbadmin_afterLoginContent",
				// Entry Events
				"cbadmin_preEntrySave","cbadmin_postEntrySave","cbadmin_preEntryRemove","cbadmin_postEntryRemove",
				"cbadmin_entryEditorSidebar", "cbadmin_entryEditorSidebarFooter",
				"cbadmin_entryEditorFooter", "cbadmin_entryEditorInBody",
				// Page Events
				"cbadmin_prePageSave","cbadmin_postPageSave","cbadmin_prePageRemove","cbadmin_postPageRemove",
				"cbadmin_pageEditorSidebar", "cbadmin_pageEditorSidebarAccordion", "cbadmin_pageEditorSidebarFooter",
				"cbadmin_pageEditorFooter", "cbadmin_pageEditorInBody",
				// Author Events
				"cbadmin_preAuthorSave","cbadmin_postAuthorSave","cbadmin_onAuthorPasswordChange","cbadmin_preAuthorRemove","cbadmin_postAuthorRemove",
				// Category Events
				"cbadmin_preCategorySave","cbadmin_postCategorySave","cbadmin_preCategoryRemove","cbadmin_postCategoryRemove",
				// Comment Events
				"cbadmin_onCommentStatusUpdate","cbadmin_preCommentSave","cbadmin_postCommentSave","cbadmin_preCommentRemove","cbadmin_postCommentRemove","cbadmin_preCommentSettingsSave","cbadmin_postCommentSettingsSave",
				"cbadmin_onCommentSettingsNav","cbadmin_onCommentSettingsContent",
				// Permission events
				"cbadmin_prePermissionSave", "cbadmin_postPermissionSave", "cbadmin_prePermissionRemove" , "cbadmin_postPermissionRemove" ,
				// Roles events
				"cbadmin_preRoleSave", "cbadmin_postRoleSave", "cbadmin_preRoleRemove" , "cbadmin_postRoleRemove" ,
				// Dashboard events
				"cbadmin_onDashboard",
				// Security events
				"cbadmin_preLogin","cbadmin_onLogin","cbadmin_onBadLogin","cbadmin_onLogout","cbadmin_onPasswordReminder","cbadmin_onInvalidPasswordReminder",
				// Settings events
				"cbadmin_preSettingsSave","cbadmin_postSettingsSave","cbadmin_preSettingRemove","cbadmin_postSettingRemove","cbadmin_onSettingsNav","cbadmin_onSettingsContent",
				// Global HTML Events
				"cbadmin_preGlobalHTMLSave","cbadmin_postGlobalHTMLSave",
				// Custom HTML Events
				"cbadmin_preCustomHTMLSave", "cbadmin_postCustomHTMLSave","cbadmin_preCustomHTMLRemove", "cbadmin_postCustomHTMLRemove",
				// Security Rules Events
				"cbadmin_preSecurityRulesSave", "cbadmin_postSecurityRulesSave", "cbadmin_preSecurityRulesRemove", "cbadmin_postSecurityRulesRemove",
				// Version Control
				"cbadmin_preContentVersionRemove","cbadmin_postContentVersionRemove","cbadmin_preContentVersionRollback", "cbadmin_postContentVersionRollback"
			])
		};

		// Custom Declared Interceptors
		interceptors = [
			// CB Admin Request Interceptor
			{class="#moduleMapping#.interceptors.CBRequest", properties={ entryPoint=this.entryPoint }, name="CBRequest@cbAdmin" }
		];

	}
}