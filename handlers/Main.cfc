﻿component{	// Default Action	function index(event,rc,prc){		prc.welcomeMessage = "Welcome to ContentBox Modular CMS!";		event.setView( "main/index" );	}	/************************************** IMPLICIT ACTIONS *********************************************/	function onAppInit(event,rc,prc){	}	function onRequestStart(event,rc,prc){	}	function onRequestEnd(event,rc,prc){	}	function onSessionStart(event,rc,prc){	}	function onSessionEnd(event,rc,prc){		var sessionScope = event.getValue("sessionReference");		var applicationScope = event.getValue("applicationReference");	}	function onException(event,rc,prc){		//Grab Exception From request collection, placed by ColdBox		var exceptionBean = event.getValue("ExceptionBean");		//Place exception handler below:	}	function onMissingTemplate(event,rc,prc){		//Grab missingTemplate From request collection, placed by ColdBox		var missingTemplate = event.getValue("missingTemplate");	}}