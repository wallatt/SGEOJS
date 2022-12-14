{**
 * saludColectiva/templates/frontend/components/registrationFormContexts.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display role selection for all of the journals/presses on this site
 *
 * @uses $contexts array List of journals/presses on this site that have enabled registration
 * @uses $readerUserGroups array Associative array of user groups with reader
 *  permissions in each context.
 * @uses $authorUserGroups array Associative array of user groups with author
 *  permissions in each context.
 * @uses $reviewerUserGroups array Associative array of user groups with reviewer
 *  permissions in each context.
 * @uses $userGroupIds array List group IDs this user is assigned
 *}

{* Only display the context role selection when registration is taking place
   outside of the context of any one journal/press. *}
{if $currentContext}

	{* Allow users to register for any journal/press on this site *}
	<fieldset name="contexts">
		<legend>
			{translate key="plugins.themes.saludColectiva.userRole"}
		</legend>
		<div class="fields">
			<div id="contextOptinGroup" class="context_optin">
				<ul class="contexts">
					{foreach from=$contexts item=context}
						{if $context->_data["id"] == 1}
							{assign var=contextId value=$context->getId()}
							<li class="context">
								<fieldset class="roles">
									<legend>
										{translate key="user.register.otherContextRoles"}
									</legend>
									
									{foreach from=$readerUserGroups[$contextId] item=userGroup}
										{if $userGroup->getPermitSelfRegistration()}
											{assign var="userGroupId" value=$userGroup->getId()}
											<label>
												<input type="checkbox" name="readerGroup[{$userGroupId}]" id="readerGroup[{$userGroupId}]" style="visibility:hidden" checked="checked">
												<label for="readerGroup[{$userGroupId}]">{translate key="plugins.themes.saludColectiva.readerAuthor"}</label>
											</label>
										{/if}
									{/foreach}
									
									{*
									{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
										{if $userGroup->getPermitSelfRegistration()}
											{assign var="userGroupId" value=$userGroup->getId()}
											<label>
												<input type="checkbox" name="reviewerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if} id="reviewerGroup[{$userGroupId}]" >
												<label for="reviewerGroup[{$userGroupId}]">{$userGroup->getLocalizedName()}</label>
											</label>
										{/if}
									{/foreach}
									*}
									
								</fieldset>
							</li>
						{/if}	
					{/foreach}
				</ul>
			</div>
		</div>
	</fieldset>
{/if}
