﻿<cfoutput>
<div class="row">
    <div class="col-md-3" id="login-wrapper">
        <div class="panel panel-primary animated flipInY">
            <div class="panel-heading">
                <h3 class="panel-title">     
                   <i class="fa fa-key"></i> Login
                </h3>      
            </div>
            <div class="panel-body">
            	<!--- Render Messagebox. --->
				#getPlugin("MessageBox").renderit()#

                #html.startForm(
                	action=prc.xehDoLogin, 
                	name="loginForm", 
                	novalidate="novalidate", 
                	class="form-horizontal"
                )#
					#html.hiddenField(name="_securedURL", value=rc._securedURL)#
                    <div class="form-group">
                        <div class="col-md-12 controls">
                            #html.textfield(
                            	name="username", 
                            	required="required", 
                            	class="form-control", 
                            	value=prc.rememberMe, 
                            	placeholder=cb.r( "common.username@security" ), 
                            	autocomplete="off"
                            )#
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-group">
                       <div class="col-md-12 controls">
                            #html.passwordField(
                            	name="password", 
                            	required="required", 
                            	class="form-control", 
                            	placeholder=cb.r( "common.password@security" ), 
                            	autocomplete="off"
                            )#
                            <i class="fa fa-lock"></i>
                            
                        </div>
                        <div class="col-md-12">
							<a href="#event.buildLink( prc.xehLostPassword )#" class="help-block">#cb.r( "lostpassword@security" )#?</a>
						</div>		
                    </div>
                    <div class="form-group">
                    	<div class="col-md-12">
							<label class="checkbox">
								#html.checkBox(
									name="rememberMe", 
									value=true, 
									checked=( len( prc.rememberMe ) )
								)#
								#cb.r( "rememberme@security" )#
							</label>
						</div>		
					</div>
                    <div class="form-group">
                       <div class="col-md-12 text-center">
                       		<button type="submit" class="btn btn-primary">
                       			#cb.r( "common.login@security" )#
                       		</button>
                        </div>
                    </div>
                #html.endForm()#
            </div>
        </div>
    </div>
</div>
</cfoutput>